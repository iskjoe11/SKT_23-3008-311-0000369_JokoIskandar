<?php

namespace App\Controllers;

use CodeIgniter\API\ResponseTrait;

class gempa extends BaseController
{
    function __construct()
    {
        $this->model = new \App\Models\ModelGempa();
    }
    public function hapus($id)
    {
        $this->model->delete($id);
        return redirect()->to('pegawai');
    }
    public function edit($id)
    {
        return json_encode($this->model->find($id));
    }
    public function simpan()
    {
        $validasi  = \Config\Services::validation();
        $aturan = [
            'lokasi' => [
                'label' => 'lokasi',
                'rules' => 'required|min_length[5]',
                'errors' => [
                    'required' => '{field} harus diisi',
                    'min_length' => 'Minimum karakter untuk field {field} adalah 5 karakter'
                ]
            ],
            'deskripsi' => [
                'label' => 'deskripsi',
                'rules' => 'required|min_length[5]|valid_deskripsi',
                'errors' => [
                    'required' => '{field} harus diisi',
                    'min_length' => 'Minimum karakter untuk field {field} adalah 5 karakter',
                    'valid_deskripsi' => 'deskripsi yang kamu masukkan tidak valid'
                ]
            ],
            'magnitude' => [
                'label' => 'magnitude',
                'rules' => 'required|min_length[5]',
                'errors' => [
                    'required' => '{field} harus diisi',
                    'min_length' => 'Minimum karakter untuk field {field} adalah 5 karakter'
                ]
            ],
        ];
        $validasi->setRules($aturan);
        if ($validasi->withRequest($this->request)->run()) {
            $id = $this->request->getPost('id');
            $lokasi = $this->request->getPost('lokasi');
            $deskripsi = $this->request->getPost('deskripsi');
            $kedalaman = $this->request->getPost('kedalaman');
            $magnitude = $this->request->getPost('magnitude');
            $data = [
                'id' => $id,
                'lokasi' => $lokasi,
                'deskripsi' => $deskripsi,
                'kedalaman' => $kedalaman,
                'magnitude' => $magnitude
            ];
            $this->model->save($data);
            $hasil['sukses'] = "Berhasil memasukkan data";
            $hasil['error'] = true;
        } else {
            $hasil['sukses'] = false;
            $hasil['error'] = $validasi->listErrors();
        }
        return json_encode($hasil);
    }
    public function index()
    {
        $jumlahBaris = 5;
        $katakunci = $this->request->getGet('katakunci');
        if ($katakunci) {
            $pencarian = $this->model->cari($katakunci);
        } else {
            $pencarian = $this->model;
        }
        $data['katakunci'] = $katakunci;
        $data['dataPegawai'] = $pencarian->orderBy('id', 'desc')->paginate($jumlahBaris);
        $data['pager'] = $this->model->pager;
        $data['nomor'] = ($this->request->getVar('page') == 1) ? '0' : $this->request->getVar('page');
        return view('pegawai_view', $data);
    }
}
