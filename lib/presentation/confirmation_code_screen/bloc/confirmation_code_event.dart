// ignore_for_file: must_be_immutable

part of 'confirmation_code_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ConfirmationCode widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ConfirmationCodeEvent extends Equatable {}

/// Event that is dispatched when the ConfirmationCode widget is first created.
class ConfirmationCodeInitialEvent extends ConfirmationCodeEvent {
  @override
  List<Object?> get props => [];
}

///event for OTP auto fill
class ChangeOTPEvent extends ConfirmationCodeEvent {
  ChangeOTPEvent({required this.code});

  String code;

  @override
  List<Object?> get props => [
        code,
      ];
}
