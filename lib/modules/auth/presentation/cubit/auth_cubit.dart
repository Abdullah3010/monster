import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:monster/core/services/forms/f_login.dart';
import 'package:monster/core/services/forms/f_register.dart';
import 'package:monster/modules/auth/domain/entities/params_login_user.dart';
import 'package:monster/modules/auth/domain/entities/params_register_user.dart';
import 'package:monster/modules/auth/domain/repos/r_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.repo) : super(AuthInitial());

  final RAuth repo;

  /// [Register]
  FRegister fRegister = FRegister();

  Future<void> register() async {
    emit(AuthLoading());
    if (fRegister.validate()) {
      ParamsRegisterUser params = ParamsRegisterUser(
        fullName: fRegister.fullNameField.controller.text,
        phoneNumber: fRegister.phoneField.controller.text,
        email: fRegister.emailField.controller.text,
        password: fRegister.passwordField.controller.text,
        dateOfBirth: fRegister.dateOfBirthField.controller.text,
        address: fRegister.addressField.controller.text,
        imageUrl: fRegister.imageUrl,
        userType: fRegister.userType,
      );

      final bool result = await repo.register(params);
      if (result) {
        emit(RegisterSuccess());
      } else {
        emit(AuthError());
      }
    } else {
      emit(AuthError());
    }
  }

  /// [Login]
  FLogin fLogin = FLogin();

  Future<void> login() async {
    emit(AuthLoading());

    if (fLogin.validate()) {
      ParamsLoginUser params = ParamsLoginUser(
        email: fLogin.emailField.controller.text,
        password: fLogin.passwordField.controller.text,
      );

      final bool result = await repo.login(params);

      if (result) {
        emit(LoginSuccess());
      } else {
        emit(AuthError());
      }
    }
  }
}
