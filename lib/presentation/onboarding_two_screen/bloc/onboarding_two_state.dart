// ignore_for_file: must_be_immutable

part of 'onboarding_two_bloc.dart';

/// Represents the state of OnboardingTwo in the application.
class OnboardingTwoState extends Equatable {
  OnboardingTwoState({
    this.sliderIndex = 0,
    this.onboardingTwoModelObj,
  });

  OnboardingTwoModel? onboardingTwoModelObj;

  int sliderIndex;

  @override
  List<Object?> get props => [
        sliderIndex,
        onboardingTwoModelObj,
      ];
  OnboardingTwoState copyWith({
    int? sliderIndex,
    OnboardingTwoModel? onboardingTwoModelObj,
  }) {
    return OnboardingTwoState(
      sliderIndex: sliderIndex ?? this.sliderIndex,
      onboardingTwoModelObj:
          onboardingTwoModelObj ?? this.onboardingTwoModelObj,
    );
  }
}
