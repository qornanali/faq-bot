# Cara menggunakan proyek ini

**Daftar isi**

* [Memulai proyek](#memulai-proyek)
  + [Prasyarat](#prasyarat)
  + [Menyiapkan proyek](#menyiapkan-proyek)
  + [Menjalankan server di lokal](#menjalankan-server-di-lokal)
* [Ketika proses pengembangan](#ketika-proses-pengembangan)
  + [Check specifications](#check-specifications)
* [Cara berkontribusi](#cara-berkontribusi)

## Memulai proyek

### Prasyarat

1. Ruby ~> v2.5

2. Docker

3. Bundler ~> 2.1.4

Untuk cara instalasinya, buka terminal/cmd lalu jalankan:

```console
$ gem install bundler -v 2.0.2
```

### Menyiapkan proyek

1. Menyiapkan pengaturan

Buka terminal/cmd di direktori proyeknya lalu jalankan:

```console
$ cp config/application.yml.sample config/application.yml
```

**Ubah isi pengaturan**

`application.yml` berisikan _key_ dan _value_ yang digunakan untuk pengaturan aplikasi.
Kamu bisa biarkan atau isi sesuai yang kamu inginkan.

2. Menyiapkan container

Buka terminal/cmd di direktori proyeknya lalu jalankan:

```console
$ docker-compose up -d
```

Jika ingin mematikan container:

```console
$ docker-compose down --volumes
```

3. Membuat database

Buka terminal/cmd di direktori proyeknya lalu jalankan:

```console
$ bin/rails db:create
```

**Memuat skema ke database**

```console
$ RAILS_ENV=test bin/rails db:migrate
$ RAILS_ENV=development bin/rails db:migrate
```

4. Instalasi dependensi-dependensi

**Instalasi Rubygems**

Buka terminal/cmd di direktori proyeknya lalu jalankan:

```console
$ bundle set config path vendor/bundle
$ bundle install
```

### Menjalankan server di lokal

Buka terminal/cmd di direktori proyeknya lalu jalankan:

```console
$ bin/rails s
```

Secara _default_, akan berjalan di `http://localhost:3000`.

## Ketika proses pengembangan

Untuk menjaga kualitas kode, jalankan instruksi berikut setiap akan mengirimkan _pull-request_:

### Periksa spesifikasi

Untuk memastikan perubahanmu tidak merusak apapun, kamu bisa menjalankan _unit-test_
yang di proyek ini akan kita sebut sebagai `spec`.

Buka terminal/cmd di direktori proyeknya lalu jalankan:

```console
$ bundle exec rspec
```

Pastikan perubahanmu tidak menurunkan persentasi dari _code-coverage_ nya.

## Cara berkontribusi

Work in progress 🛠
