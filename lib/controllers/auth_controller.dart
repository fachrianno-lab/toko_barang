import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/user_model.dart';

class AuthController {
  Future<UserModel?> Login(String username, String password) async {
    final String teks =
        await rootBundle.loadString('assets/data/user.json');
    final List data = jsonDecode(teks);
    final List<UserModel> semuaUsers =
        data.map((e) => UserModel.fromJson(e)).toList();

    for (final user in semuaUsers) {
      if (user.username == username && user.password == password) {
        return user;
      }
    }
    return null;
  }
}