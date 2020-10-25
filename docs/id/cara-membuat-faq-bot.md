# 🇮🇩 Cara membuat asisten pintar `FAQ-bot` untuk menjawab pertanyaan

![Demo](../assets/faq-bot-demo-resized.gif)

## Pengantar 

### Mengapa kita butuh bot ini? 🤔

Ketika kita membuat suatu produk, kita ingin agar pengguna atau konsumen kita
dapat menggunakannya sesuai dengan yang kita harapkan. Akan tetapi,
seiring dengan berkembangnya produk tersebut, makin banyak
informasi yang tersebar dimana-mana dan membuat konsumen kita kehilangan arah.

Untuk menyelesaikan itu, disusunlah FAQ. FAQ merupakan singkatan dari
frequently asked question, sebuah list yang berisi pertanyaan-pertanyaan
yang sering diajukan oleh konsumen ataupun pengguna mengenai sebuah topik, beserta jawabannya.

Untuk meningkatkan kualitas FAQ, kita sebagai produk perlu menjawab hal berikut:

- Apakah jawaban yg diberikan kepada konsumen sesuai?
- Pertanyaan-pertanyaan apa lagi yang sering ditanyakan konsumen?

### Lalu apa solusinya? 🙋‍♂️

Seperti yang kita tahu, facebook dengan _messenger-platform_-nya telah merilis API yang
dapat kita gunakan untuk membuat asisten virtual pintar yang dapat
membalas pesan dari user secara otomatis. Tapi jawaban yang biasa saja tidak cukup, karena
ada kemungkinan pertanyaan yang dilontarkan customer itu tidak terdaftar di database kita.
Oleh karena itu kita bisa mengintegrasikan obrolan di bot ini dengan wit.ai
agar di setiap obrolannya, kita bisa mencerna "maksud" dari customer.

Dengan memanfaatkan fitur-fitur tersebut, kita akan membuat suatu bot di messenger
yang dapat mencerna maksud dari pertanyaan yang ditanyakan oleh konsumen.
Kemudian maksud ini kita olah untuk dapat memberikan jawaban yang sesuai.

## Daftar Isi

* [Pengantar](#pengantar)
  + [Mengapa kita butuh bot ini? 🤔](#mengapa-kita-butuh-bot-ini----)
  + [Lalu apa solusinya? 🙋‍♂️](#lalu-apa-solusinya-------)
* [Daftar Isi](#daftar-isi)
* [Menganalisa aplikasi yang akan kita buat](#menganalisa-aplikasi-yang-akan-kita-buat)
  + [Mendefinisikan ruang lingkup 🔍](#mendefinisikan-ruang-lingkup---)
  + [Mencari tahu teknologi yang dibutuhkan 💻](#mencari-tahu-teknologi-yang-dibutuhkan---)
    - [Membuat messenger app](#membuat-messenger-app)
    - [Melatih AI agar dapat memahami pembicaraan](#melatih-ai-agar-dapat-memahami-pembicaraan)
    - [Kesimpulan](#kesimpulan)
  + [Prasyarat 📦](#prasyarat---)
* [Referensi](#referensi)

## Menganalisa aplikasi yang akan kita buat

Salah satu kunci membuat aplikasi yang berkualitas bagus adalah dengan mengetahui
selak beluknya. Jika kita mengetahui apa yang kita lakukan, maka dalam proses
pengembangannya akan efektif dan efisien karena kita tahu apa saja spesifikasi teknologi yang dibutuhkan
dan langkah apa yang harus dilakukan jiga terjadi suatu error/bug.

### Mendefinisikan ruang lingkup 🔍

Kita perlu menentukan ruang lingkup agar dalam pengembangan aplikasi ini kita bisa fokus
akan hal-hal yang paling utama. Berikut adalah use case diagramnya:

![Use case diagram](../assets/use-case-diagram.png)

- Aktor yang bisa berinteraksi dengan sistem adalah: 1) customer.

- Aktor customer dapat melakukan 1) mengirim pesan dan 2) menerima jawaban.

### Mencari tahu teknologi yang dibutuhkan 💻

Agar kita tahu apa saja spesifikasi dari teknologi yang akan kita gunakan,
kita perlu mencoba membuat versi simpel atau bisa kita sebut hello-world dari aplikasi kita.
Metode yang akan kita gunakanan untuk ini ialah _spike_[[2]].

#### Membuat messenger app

Untuk membuat aplikasi di messenger platform yang dapat menerima, membaca lalu membalas pesan,
kita perlu memahami bagaimana arsitektur dari platformnya bekerja.
Untuk memahami caranya, kita bisa langsung masuk ke tutorial singkat
dari messenger-platform di link berikut https://developers.facebook.com/docs/messenger-platform/getting-started.

#### Melatih AI agar dapat memahami pembicaraan

Agar aplikasi kita bisa mencerna "maksud" dari pertanyaan customer, kita perlu mengintegrasikan AI.
AI ini akan kita latih dengan cara memberikan sampel-sampel pertanyaan-pertanyaan dari customer 
lalu kita tentukan dari setiap sampel pertanyaan tersebut, apa "maksud" dari customer.
Untuk memahami caranya, kita bisa langsung masuk ke tutorial singkat
dari wit.ai di link berikut https://wit.ai/docs/quickstart.

#### Kesimpulan

Setelah melakukan spike-spike di atas, berikut ini adalah diagram dari spesifikasi
teknologi yang akan kita gunakan. Diagram ini dibuat sesimpel mungkin jadi mungkin
saja ada beberapa informasi yang terlewatkan, tapi ini seharusnya cukup untuk menjelaskan high-levelnya.

Setiap event yang dilakukan oleh customer akan diteruskan ke webhook yang sudah kita buat.
Di webhook inilah aplikasi kamu akan menerima, memproses dan merespon terhadap pesan
yang dikirimkan customer melalui Facebook page.

Kebutuhan dari webhooknya adalah:

- Menunjang protokol HTTPS

- Setifikat SSL yang valid

- Port terbuka yang dapat menerima request `POST` dan `GET`.

**Facebook melakukan verifikasi webhook**

![Setup webhook](../assets/set-webhook-diagram.png)

Kita harus menyimpan url webhook yang telah kita siapkan ke pengaturan di Facebook application. 
Saat kita menyimpan, Facebook akan mengirimkan request `GET` yang berisi
proses verifikasi untuk memastikan kebutuhan webhooknya terpenuhi.

**Aplikasi menerima pertanyaan dari customer**

![Customer sends a question](../assets/send-question-diagram.png)

Facebook akan mengirimkan `POST` request ke url webhook yang telah kita simpan di pengaturan.
Request ini berisikan informasi berisi ID dari pengirim pesan, teks pesan, waktu dikirim, dan lain-lain.

**Aplikasi mengirim jawaban ke customer**

![Customer receives an answer](../assets/receive-answer-diagram.png)

Aplikasi kita akan memproses pesan yang diterima sesuai logic yang kita buat.
Selanjutnya aplikasi akan membalas pesan dari pengirim
dengan cara mengirimkan `POST` request ke Facebook Graph API.

### Prasyarat 📦

1. Ruby ~> v2.5.

Kamu bisa menggunakan [rbenv](https://github.com/rbenv/rbenv#installing-ruby-versions)
atau [rvm](https://rvm.io/rvm/install#try-out-your-new-rvm-installation),
untuk menginstall versi dari ruby yang dibutuhkan.

Untuk memeriksa apakah perangkatmu sudah terinstall ruby, kamu bisa menjalankan
perintah berikut di terminal/command prompt:

```console
$ ruby -v
# example: ruby 2.5.3p105 (2018-10-18 revision 65156) [x86_64-darwin18]
```

Kalau terminal-mu mengembalikan `ruby <xxx>` maka ruby-mu sudah siap digunakan.

2. Bundler ~> v2

Untuk cara instalasinya, buka terminal/cmd lalu jalankan:

```console
$ gem install bundle -v 2.0.2
```

Untuk memeriksa apakah perangkatmu sudah terinstall bundler, kamu bisa menjalankan
perintah berikut di terminal/command prompt:

```console
$ bundler -v
# example: Bundler version 2.1.4
```

Kalau terminal-mu mengembalikan `Bundler version <xxx>` maka bundler-mu sudah siap digunakan.

3. Rails ~> v6

Untuk cara instalasinya, buka terminal/cmd lalu jalankan:

```console
$ gem install rails -v 6
```

Untuk memeriksa apakah perangkatmu sudah terinstall rails, kamu bisa menjalankan
perintah berikut di terminal/command prompt:

```console
$ rails -v
# example: Rails 6.0.3.4
```

Kalau terminal-mu mengembalikan `Rails <xxx>` maka rails-mu sudah siap digunakan.

4. Docker

Kamu bisa menginstallnya melalui link berikut: https://docs.docker.com/get-docker.

5. Akun developer Facebook

Akun ini diperlukan untuk membuat aplikasi baru, yang merupakan inti dari integrasi Facebook.
Kamu bisa membuat akun baru dengan membuka link berikut: https://developers.facebook.com.

6. Akun wit.ai].

Akun ini diperlukan untuk membuat model NLP[[1]], yang digunakan untuk mencerna maksud pertanyaan dari konsumen.
Kamu bisa membuat akun baru dengan membuka link berikut: https://wit.ai.

7. Akun ngrok

Akun ini diperlukan untuk membuat url https dari webservermu ke internet yang dibutuhkan Facebook
agar bisa mengirimkan data ke webhookmu. Kamu bisa membuat akun baru
dengan membuka link berikut: https://ngrok.com. Jangan lupa untuk mengikuti
panduan setup-nya di https://dashboard.ngrok.com/get-started/setup.

- https://developers.facebook.com/docs/messenger-platform

- https://guides.rubyonrails.org/

- https://wit.ai/docs

- https://ngrok.com/docs

- https://developercircles2020.devpost.com/details/resources

[1]: https://id.wikipedia.org/wiki/Pemrograman_neurolinguistik

[2]: https://en.wikipedia.org/wiki/Spike_(software_development)
