import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lumihome/Model.dart';

class DatabaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  // Fungsi untuk login pengguna dengan email dan kata sandi
  static Future<bool> loginUser(String email, String password) async {
    try {
      // Mencoba untuk login dengan email dan kata sandi yang diberikan
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Jika login berhasil, cetak pesan dan kembalikan nilai true
      print('Login berhasil dengan email : $email');
      return true;
    } on FirebaseAuthException catch (e) {
      // Tangani berbagai kesalahan autentikasi
      switch (e.code) {
        case 'user-not-found':
          print('Pengguna tidak ditemukan');
          break;
        case 'wrong-password':
          print('Kata sandi salah');
          break;
        case 'invalid-email':
          print('Alamat email tidak valid');
          break;
        default:
          print('Error: ${e.code}');
      }
    } catch (e) {
      // Tangani kesalahan lainnya
      print('Terjadi kesalahan: $e');
    }

    // Kembalikan nilai false jika login gagal
    return false;
  }

  // fungsi untuk logout user
  static void logoutUser(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    print('Logout Berhasil');
    Navigator.pushNamed(context, '/Auth');
  }

  Future<void> register(BuildContext context, RegisterUser register,
      String email, String password) async {
    try {
      // Periksa apakah email sudah terdaftar
      List<String> signInMethods =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);

      if (signInMethods.isNotEmpty) {
        // Jika daftar signInMethods tidak kosong, email sudah terdaftar
        print('Email sudah terdaftar. Silakan gunakan email lain.');

        return;
      }

      // Jika email belum terdaftar, lanjutkan dengan pembuatan akun
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Akun berhasil dibuat dengan email: $email');

      String uuid = credential.user!.uid;
      await FirebaseDatabase.instance.ref().child('users').child(uuid).set({
        'email': email,
        'name': register.fullName,
        'phone': register.phoneNumber,
      });
      Navigator.pop(context);
    } catch (e) {
      print('Terjadi kesalahan: $e');
    }
  }
}
