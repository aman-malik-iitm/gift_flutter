// ignore_for_file: must_be_immutable

part of 'onboarding_three_bloc.dart';

/// Represents the state of OnboardingThree in the application.
class OnboardingThreeState extends Equatable {
  OnboardingThreeState({
    this.sliderIndex = 0,
    this.onboardingThreeModelObj,
  });

  OnboardingThreeModel? onboardingThreeModelObj;

  int sliderIndex;

  @override
  List<Object?> get props => [
        sliderIndex,
        onboardingThreeModelObj,
      ];
  OnboardingThreeState copyWith({
    int? sliderIndex,
    OnboardingThreeModel? onboardingThreeModelObj,
  }) {
    return OnboardingThreeState(
      sliderIndex: sliderIndex ?? this.sliderIndex,
      onboardingThreeModelObj:
          onboardingThreeModelObj ?? this.onboardingThreeModelObj,
    );
  }
}
