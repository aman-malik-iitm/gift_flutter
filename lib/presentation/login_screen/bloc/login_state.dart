// ignore_for_file: must_be_immutable

part of 'login_bloc.dart';

/// Represents the state of Login in the application.
class LoginState extends Equatable {
  LoginState({
    this.nameController,
    this.mobileNumberController,
    this.loginModelObj,
  });

  TextEditingController? nameController;

  TextEditingController? mobileNumberController;

  LoginModel? loginModelObj;

  @override
  List<Object?> get props => [
        nameController,
        mobileNumberController,
        loginModelObj,
      ];
  LoginState copyWith({
    TextEditingController? nameController,
    TextEditingController? mobileNumberController,
    LoginModel? loginModelObj,
  }) {
    return LoginState(
      nameController: nameController ?? this.nameController,
      mobileNumberController:
          mobileNumberController ?? this.mobileNumberController,
      loginModelObj: loginModelObj ?? this.loginModelObj,
    );
  }
}
