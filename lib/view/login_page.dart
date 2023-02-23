import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _emailEditingControlller = TextEditingController().obs;
  final _passwordEditingController = TextEditingController().obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Image.asset('assets/images/logo.png'),
          Text('hai! Selamat datang!'),
          Column(
            children: [
              Text('Username atau Email'),
              TextField(
                controller: _emailEditingControlller.value,
              )
            ],
          ),
          Column(
            children: [
              Text('Kata Sandi'),
              TextField(
                controller: _passwordEditingController.value,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () {}, child: Text('Lupa kata sandi?'))
            ],
          ),
          Column(
            children: [
              ElevatedButton(onPressed: () {}, child: Text('Masuk')),
              Row(
                children: [
                  Text('Jika belum memiliki akun'),
                  TextButton(onPressed: () {}, child: Text('Daftar'))
                ],
              )
            ],
          )
        ],
      )),
    );
  }
}
