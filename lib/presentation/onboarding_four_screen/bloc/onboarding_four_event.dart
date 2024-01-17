// ignore_for_file: must_be_immutable

part of 'onboarding_four_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///OnboardingFour widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class OnboardingFourEvent extends Equatable {}

/// Event that is dispatched when the OnboardingFour widget is first created.
class OnboardingFourInitialEvent extends OnboardingFourEvent {
  @override
  List<Object?> get props => [];
}
