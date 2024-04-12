import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hotel_app/database/model/user.dart';
import 'package:hotel_app/database/model/user_dao.dart';
import 'package:hotel_app/remote/model/sign_init_info.dart';
import 'package:hotel_app/remote/model/user.dart';
import 'package:hotel_app/remote/service/user_service.dart';

class JsonUserServiceImpl implements UserService {
  final UserDao userDao;
  Map<String, dynamic> otps = {};

  JsonUserServiceImpl(this.userDao);

  @override
  Future<void> createUser(
      String username, String email, String password) async {
    return;
  }

  @override
  Future<String> login(String username, String password) async {
    await Future.delayed(const Duration(milliseconds: 2000));
    return "implement your token";
  }

  @override
  Future<SignUpInitInfo> initCreateUser(
      String username, String emailOrPhone, String password) async {
    await Future.delayed(const Duration(seconds: 2));

    var ref = '${generateRandomString(20)}${DateTime.now().millisecond}';

    bool isExist = await userDao.findOne(username) != null;

    if (isExist) {
      throw Exception('This username already exsisted');
    }
    String otp = generateOTP(5);
    otps[ref] = {
      "otp": otp,
      "user": UserInfo(
          username: username, emailOrPhone: emailOrPhone, password: password)
    };
    debugPrint('-----> $otps');
    return SignUpInitInfo(ref: ref, otp: otp);
  }

  @override
  Future<String> submitCreateUser(String ref, String otp) async {
    await Future.delayed(const Duration(seconds: 3));

    var info = otps[ref];
    if (info == null) {
      throw Exception('TODO make readable');
    }
    if (info['otp'] != otp) {
      throw Exception('Invalid OTP');
    }
    UserInfo user = info['user'];
    userDao.add(User(
        username: user.username,
        email: user.emailOrPhone,
        password: user.password));
    return generateRandomString(20);
  }

  String generateRandomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    return String.fromCharCodes(
      Iterable.generate(
          length, (_) => chars.codeUnitAt(random.nextInt(chars.length))),
    );
  }

  String generateOTP(int length) {
    const chars = '0123456789'; // Character set for the OTP
    final random = Random();
    return String.fromCharCodes(
      Iterable.generate(
          length, (_) => chars.codeUnitAt(random.nextInt(chars.length))),
    );
  }
}
