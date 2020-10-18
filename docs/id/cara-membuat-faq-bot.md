# 🇮🇩 Cara membuat FAQ-bot langkah demi langkah

## Pengantar 

Sebelum kita mengerjakan sesuatu, kita harus memulai dengan _why?_. Oleh karena itu
di bagian ini, akan dijelaskan tentang latar belakang dari FAQ-bot

### Latar belakang 🤔

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

### Tujuan pembuatan 🙋‍♂️

Seperti yang kita tahu, facebook dengan _messenger-platform_-nya telah merilis API yang
dapat kita gunakan untuk membuat asisten virtual pintar yang dapat
membalas pesan dari user secara otomatis. Asisten ini juga bisa di-integrasikan
dengan wit.ai agar dengan mudah mencerna "maksud" dari kalimat yang dibicarakan oleh konsumen.

Dengan memanfaatkan fitur-fitur tersebut, kita akan membuat suatu bot di messenger
yang dapat mencerna maksud dari pertanyaan yang ditanyakan oleh konsumen.
Kemudian maksud ini kita olah untuk dapat memberikan jawaban yang sesuai.

## Sebelum mulai

### Prasyarat 📦

- Ruby ~> 2.5 telah diinstall di perangkat kerjamu.

Kamu bisa menggunakan [rbenv](https://github.com/rbenv/rbenv#installing-ruby-versions)
atau [rvm](https://rvm.io/rvm/install#try-out-your-new-rvm-installation), untuk menginstall ruby yang dibutuhkan.

- Akun [Facebook developer](https://developers.facebook.com/).

Akun ini diperlukan untuk membuat aplikasi baru, yang merupakan inti dari integrasi Facebook. Kamu bisa membuat akun baru dengan membuka situs di atas.

- Akun [wit.ai](https://wit.ai).

Akun ini diperlukan untuk membuat model NLP[[1]], yang digunakan untuk mencerna maksud pertanyaan dari konsumen. Kamu bisa membuat akun baru dengan membuka situs di atas.

- Akun [ngrok](https://ngrok.com/) dan sudah diatur.

Salah satu kebutuhan membuat bot di _messenger-platform_ adalah aplikasi
kamu harus mendukung protokol HTTPS. Dengan menggunakan ngrok,
kita bisa dengan mudah membuat url publik yang mendukung protokol tersebut.
Perangkat ini sementara akan kita gunakan untuk pengembangan.

## Referensi

- https://developers.facebook.com/docs/messenger-platform

- https://guides.rubyonrails.org/

- https://wit.ai/docs

- https://ngrok.com/docs

- https://developercircles2020.devpost.com/details/resources

[1]: https://id.wikipedia.org/wiki/Pemrograman_neurolinguistik
