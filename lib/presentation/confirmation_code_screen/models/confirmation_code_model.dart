// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [confirmation_code_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ConfirmationCodeModel extends Equatable {
  ConfirmationCodeModel() ;

  ConfirmationCodeModel copyWith() {
    return ConfirmationCodeModel();
  }

  @override
  List<Object?> get props => [];
}
