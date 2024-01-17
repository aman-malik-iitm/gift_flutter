// ignore_for_file: must_be_immutable

part of 'onboarding_four_bloc.dart';

/// Represents the state of OnboardingFour in the application.
class OnboardingFourState extends Equatable {
  OnboardingFourState({
    this.sliderIndex = 0,
    this.onboardingFourModelObj,
  });

  OnboardingFourModel? onboardingFourModelObj;

  int sliderIndex;

  @override
  List<Object?> get props => [
        sliderIndex,
        onboardingFourModelObj,
      ];
  OnboardingFourState copyWith({
    int? sliderIndex,
    OnboardingFourModel? onboardingFourModelObj,
  }) {
    return OnboardingFourState(
      sliderIndex: sliderIndex ?? this.sliderIndex,
      onboardingFourModelObj:
          onboardingFourModelObj ?? this.onboardingFourModelObj,
    );
  }
}
