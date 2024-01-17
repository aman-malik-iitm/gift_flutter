// ignore_for_file: must_be_immutable

part of 'confirmation_code_bloc.dart';

/// Represents the state of ConfirmationCode in the application.
class ConfirmationCodeState extends Equatable {
  ConfirmationCodeState({
    this.otpController,
    this.confirmationCodeModelObj,
  });

  TextEditingController? otpController;

  ConfirmationCodeModel? confirmationCodeModelObj;

  @override
  List<Object?> get props => [
        otpController,
        confirmationCodeModelObj,
      ];
  ConfirmationCodeState copyWith({
    TextEditingController? otpController,
    ConfirmationCodeModel? confirmationCodeModelObj,
  }) {
    return ConfirmationCodeState(
      otpController: otpController ?? this.otpController,
      confirmationCodeModelObj:
          confirmationCodeModelObj ?? this.confirmationCodeModelObj,
    );
  }
}
