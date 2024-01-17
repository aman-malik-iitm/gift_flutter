import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:aman_s_application2/presentation/confirmation_code_screen/models/confirmation_code_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
part 'confirmation_code_event.dart';
part 'confirmation_code_state.dart';

/// A bloc that manages the state of a ConfirmationCode according to the event that is dispatched to it.
class ConfirmationCodeBloc
    extends Bloc<ConfirmationCodeEvent, ConfirmationCodeState>
    with CodeAutoFill {
  ConfirmationCodeBloc(ConfirmationCodeState initialState)
      : super(initialState) {
    on<ConfirmationCodeInitialEvent>(_onInitialize);
    on<ChangeOTPEvent>(_changeOTP);
  }

  @override
  codeUpdated() {
    add(ChangeOTPEvent(code: code!));
  }

  _changeOTP(
    ChangeOTPEvent event,
    Emitter<ConfirmationCodeState> emit,
  ) {
    emit(state.copyWith(
      otpController: TextEditingController(text: event.code),
    ));
  }

  _onInitialize(
    ConfirmationCodeInitialEvent event,
    Emitter<ConfirmationCodeState> emit,
  ) async {
    emit(state.copyWith(
      otpController: TextEditingController(),
    ));
    listenForCode();
  }
}
