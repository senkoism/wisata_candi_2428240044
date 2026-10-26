# Widget Dasar Flutter 4
**Pengembangan Aplikasi Bergerak · Pertemuan 13**
Membangun SignInScreen dengan Form dan TextFormField
Pokok Bahasan: Widget Flutter
Universitas Multi Data Palembang

---

## Tujuan Pembelajaran

1. Membuat form dengan `Form` dan `TextFormField`.
2. Membaca isi input dengan `TextEditingController`.
3. Menampilkan dan menyembunyikan kata sandi dengan `setState`.
4. Mengatur tema dan mencegah overflow saat keyboard muncul.

---

## Target: Layar Sign In dan Sign Up

*(Gambar: `signin.png` dan `signup.png`)*

Hari ini kita membuat `SignInScreen`. `SignUpScreen` menjadi latihan karena strukturnya hampir sama.

| Bagian layar | Widget |
|---|---|
| Judul layar | `AppBar` |
| Kolom isian nama pengguna dan kata sandi | `TextFormField` |
| Tombol Sign In | `ElevatedButton` |
| Tautan ke halaman daftar | `TextButton` / `RichText` |

---

## Widget yang Akan Dipakai

- **Kerangka:** `StatelessWidget`, `StatefulWidget`, `Scaffold`, `AppBar`
- **Susunan:** `Center`, `Padding`, `Column`, `SizedBox`, `SingleChildScrollView`
- **Form:** `Form`, `TextFormField`, `InputDecoration`, `OutlineInputBorder`
- **Tombol:** `ElevatedButton`, `TextButton`, `IconButton`, `RichText`

> Yang baru: `Form`, `TextFormField`, `InputDecoration`, `TextEditingController`, dan `RichText`.

---

# BAGIAN 01 — Kerangka SignInScreen
*Mulai dari StatelessWidget, variabel, dan struktur layar*

## Mulai dari StatelessWidget

1. Buat file `lib/screens/sign_in_screen.dart` (VS Code: New File. Android Studio: New > Dart File)
2. Buat `StatelessWidget` bernama `SignInScreen`
3. Di `main.dart`, ubah `home` menjadi `SignInScreen()`
4. Import otomatis: Android Studio klik ikon lampu (Alt + Enter), VS Code Ctrl + . lalu jalankan

`lib/screens/sign_in_screen.dart`

```dart
import 'package:flutter/material.dart';
 
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
```

> Kita sengaja mulai dari Stateless. Nanti terlihat sendiri kenapa layar ini butuh Stateful.

## Variabel dan TODO

**TextEditingController** — menyimpan dan membaca teks yang diketik pengguna di `TextFormField`.

`sign_in_screen.dart`

```dart
// TODO: 1. Deklarasikan variabel
final TextEditingController _usernameController =
    TextEditingController();
final TextEditingController _passwordController =
    TextEditingController();
 
String _errorText = '';
bool _isSignedIn = false;
bool _obscurePassword = true;
```

- `_errorText`: pesan kesalahan, misalnya kata sandi salah
- `_obscurePassword`: `true` berarti kata sandi disembunyikan dengan titik

> Garis bawah (`_`) di depan nama berarti variabel itu hanya dipakai di file ini (private), sesuai materi Pertemuan 7.

## AppBar, Center, Form, Column

`sign_in_screen.dart`

```dart
return Scaffold(
  // TODO: 2. Pasang AppBar
  appBar: AppBar(title: const Text('Sign In')),
  // TODO: 3. Pasang body
  body: Center(
    child: Form(
      child: Column(
        // TODO: 4. Atur alignment
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // TODO: 5. TextFormField nama pengguna
          // TODO: 6. TextFormField kata sandi
          // TODO: 7. ElevatedButton Sign In
          // TODO: 8. TextButton Sign Up
        ],
      ),
    ),
  ),
);
```

Struktur: `Scaffold` → `AppBar`, `Center` → `Form` → `Column` → `TextFormField` ×2 + tombol.

> `Form` mengelompokkan semua isian supaya nanti bisa divalidasi bersama.

---

# BAGIAN 02 — Isi Form
*Kolom isian, ikon mata, dan tombol*

## Nama Pengguna: TextFormField

`sign_in_screen.dart`

```dart
// TODO: 5. Pasang TextFormField nama pengguna
TextFormField(
  controller: _usernameController,
  decoration: const InputDecoration(
    labelText: 'Nama Pengguna',
    border: OutlineInputBorder(),
  ),
),
```

- **Sebelum diisi:** label "Nama Pengguna" berada di dalam kotak.
- **Saat diisi:** label otomatis pindah ke garis atas kotak (contoh isi: `rachmadi`).

| Properti | Fungsi |
|---|---|
| `controller` | Menghubungkan kolom ini ke `_usernameController` |
| `labelText` | Label di dalam kolom, naik ke atas saat diisi |
| `OutlineInputBorder` | Garis tepi kotak di sekeliling kolom |

## Kata Sandi dan Pesan Error

`sign_in_screen.dart`

```dart
// TODO: 6. Pasang TextFormField kata sandi
const SizedBox(height: 20),
TextFormField(
  controller: _passwordController,
  decoration: InputDecoration(
    labelText: 'Kata Sandi',
    errorText: _errorText.isNotEmpty ? _errorText : null,
    border: const OutlineInputBorder(),
  ),
  obscureText: _obscurePassword,
),
```

- `obscureText: true` → tampil `••••••••`
- `_errorText` terisi → muncul pesan "Nama pengguna atau kata sandi salah."

| Properti | Fungsi |
|---|---|
| `errorText` | Pesan merah di bawah kolom. Nilai `null` berarti tidak ada error. |
| `obscureText` | `true`: huruf diganti titik supaya kata sandi tidak terlihat |

## Ikon Mata dengan suffixIcon

`sign_in_screen.dart`

```dart
decoration: InputDecoration(
  labelText: 'Kata Sandi',
  errorText: _errorText.isNotEmpty ? _errorText : null,
  border: const OutlineInputBorder(),
  suffixIcon: IconButton(
    onPressed: () {}, // diisi setelah jadi Stateful
    icon: Icon(_obscurePassword
        ? Icons.visibility_off
        : Icons.visibility),
  ),
),
```

- `_obscurePassword = true` → kata sandi `••••••••`, ikon `visibility_off`
- `_obscurePassword = false` → kata sandi `rahasia123`, ikon `visibility`

> `suffixIcon` menaruh widget di ujung kanan kolom isian. Ikonnya bergantung pada nilai `_obscurePassword`.

## Tombol Sign In dan Sign Up

`sign_in_screen.dart`

```dart
// TODO: 7. Pasang ElevatedButton Sign In
const SizedBox(height: 20),
ElevatedButton(
  onPressed: () {},
  child: const Text('Sign In'),
),
// TODO: 8. Pasang TextButton Sign Up
const SizedBox(height: 10),
TextButton(
  onPressed: () {},
  child: const Text('Belum punya akun? Daftar di sini.'),
),
```

> `onPressed` masih kosong. Isinya dibuat di materi navigasi dan sign in.

## Alternatif yang Lebih Rapi: RichText

Dengan `RichText`, hanya kata "Daftar di sini" yang bisa diketuk dan diberi warna berbeda.

`sign_in_screen.dart`

```dart
import 'package:flutter/gestures.dart';
 
RichText(
  text: TextSpan(
    text: 'Belum punya akun? ',
    style: const TextStyle(fontSize: 16, color: Colors.deepPurple),
    children: [
      TextSpan(
        text: 'Daftar di sini.',
        style: const TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline),
        recognizer: TapGestureRecognizer()..onTap = () {},
      ),
    ],
  ),
),
```

| Class | Fungsi |
|---|---|
| `TextSpan` | Potongan teks dengan gaya sendiri |
| `TapGestureRecognizer` | Membuat potongan teks bisa diketuk. Perlu import `gestures.dart` |

---

# BAGIAN 03 — Merapikan Tampilan
*Jarak tepi, keyboard, dan warna tema*

## Padding dan SingleChildScrollView

Dua masalah setelah form jadi: isinya menempel ke tepi layar, dan saat keyboard muncul layar jadi overflow.

`sign_in_screen.dart`

```dart
body: Center(
  child: SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        child: Column(...),
      ),
    ),
  ),
),
```

*(Perbandingan gambar: ✗ Sebelum / ✓ Sesudah)*

## Mengatur Warna Tema Aplikasi

AppBar masih putih polos. Atur warnanya sekali saja di `ThemeData` pada `main.dart`, semua layar ikut berubah.

`lib/main.dart`

```dart
theme: ThemeData(
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.deepPurple),
    titleTextStyle: TextStyle(
      color: Colors.deepPurple,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
      .copyWith(primary: Colors.deepPurple, surface: Colors.deepPurple[50]),
  useMaterial3: true,
),
```

*(Perbandingan gambar: Sebelum / Sesudah)*

---

# BAGIAN 04 — Menjadikan Stateful
*Supaya ikon mata bisa mengubah tampilan*

## Kenapa Layar Ini Harus Stateful?

Saat ikon mata ditekan, nilai `_obscurePassword` berubah dan tampilan kolom kata sandi harus ikut berubah. Perubahan seperti ini hanya bisa ditangani `StatefulWidget`.

1. Letakkan kursor pada kata `StatelessWidget`
2. Android Studio: klik kanan > Show Context Actions. VS Code: tekan Ctrl + .
3. Pilih **Convert to StatefulWidget**
4. IDE membuat class `_SignInScreenState` dan memindahkan isinya

Hasil konversi:

```dart
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
 
  @override
  State<SignInScreen> createState() =>
      _SignInScreenState();
}
 
class _SignInScreenState
    extends State<SignInScreen> {
  // variabel dan build() pindah ke sini
}
```

## Tampilkan atau Sembunyikan Sandi

Alur: ikon mata ditekan → `setState` membalik `_obscurePassword` → `build()` dijalankan ulang → kata sandi terlihat atau tersembunyi.

`sign_in_screen.dart`

```dart
suffixIcon: IconButton(
  onPressed: () {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  },
  icon: Icon(_obscurePassword
      ? Icons.visibility_off
      : Icons.visibility),
),
```

> Tanda `!` membalik nilai boolean: `true` jadi `false`, `false` jadi `true`.
> Pola yang sama dengan tombol Sign In/Out di `ProfileScreen`.

---

## Yang Belum Selesai di SignInScreen

| # | Bagian | Yang dikerjakan | Fungsi |
|---|---|---|---|
| 1 | Tombol Sign In | Memeriksa nama pengguna dan kata sandi | `_signIn` |
| 2 | Tautan Sign Up | Pindah ke `SignUpScreen` (navigasi) | `_signUp` |
| 3 | — | Mencocokkan data dengan yang tersimpan | `_signIn` |
| 4 | — | Menyimpan data pengguna baru | `_signUp` |

Keempatnya dilanjutkan di materi state management, navigasi, dan penyimpanan data.

---

## Latihan: SignUpScreen

*(Gambar: `signup.png`)*

1. Ubah `home` di `main.dart` menjadi `SignUpScreen()`
2. Buat `lib/screens/sign_up_screen.dart` dengan struktur serupa `SignInScreen`
3. Tambahkan satu `TextFormField` untuk Nama (nama lengkap) di paling atas
4. Ganti judul AppBar dan teks tombol menjadi Sign Up
5. Pastikan ikon mata kata sandi berfungsi

> Butuh `TextEditingController` baru: `_fullnameController`.

---

## Rangkuman

- **Form dan TextFormField:** `Form` mengelompokkan isian, `TextFormField` menjadi kolom isian dengan label dan garis tepi.
- **TextEditingController:** menyimpan teks yang diketik supaya bisa dibaca kode.
- **Merapikan tampilan:** `Padding` untuk jarak tepi, `SingleChildScrollView` agar tidak overflow, `ThemeData` untuk warna.
- **StatefulWidget:** dibutuhkan saat tampilan berubah, seperti ikon mata kata sandi.

---

## Terima Kasih
Ada pertanyaan? Mari berdiskusi.

*Pengembangan Aplikasi Bergerak · Universitas Multi Data Palembang*
