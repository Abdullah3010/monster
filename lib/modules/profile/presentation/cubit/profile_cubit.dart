import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:monster/core/services/forms/f_edit_profile.dart';
import 'package:monster/modules/auth/data/models/m_user.dart';
import 'package:monster/modules/auth/presentation/cubit/auth_cubit.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  FEditProfile editProfile = FEditProfile();

  void initProfile() {
    editProfile.init();
    MUser? user = Modular.get<AuthCubit>().getActiveUser();
    if (user != null) {
      editProfile.imageUrl = user.imageUrl ?? '';
      editProfile.fullNameField.controller.text = user.fullName ?? '';
      editProfile.phoneField.controller.text = (user.phoneNumber ?? '').replaceAll(' ', '');
      editProfile.dateOfBirthField.controller.text = user.dateOfBirth ?? '';
      editProfile.addressField.controller.text = user.address ?? '';
    }
    emit(ProfileInitSuccessfuly());
  }
}
