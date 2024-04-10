import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_app/repository/user_repo.dart';

class SignUpViewModel extends ChangeNotifier {

  final UserRepository userRepo;

  SignUpViewModel._(this.userRepo);   

  factory SignUpViewModel.createNewInstance() {
    final userRepo = GetIt.I<UserRepository>();
    return SignUpViewModel._(userRepo);
  }
}