import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/twelve_item_model.dart';
import 'package:aman_s_application2/presentation/onboarding_two_screen/models/onboarding_two_model.dart';
part 'onboarding_two_event.dart';
part 'onboarding_two_state.dart';

/// A bloc that manages the state of a OnboardingTwo according to the event that is dispatched to it.
class OnboardingTwoBloc extends Bloc<OnboardingTwoEvent, OnboardingTwoState> {
  OnboardingTwoBloc(OnboardingTwoState initialState) : super(initialState) {
    on<OnboardingTwoInitialEvent>(_onInitialize);
  }

  List<TwelveItemModel> fillTwelveItemList() {
    return List.generate(2, (index) => TwelveItemModel());
  }

  _onInitialize(
    OnboardingTwoInitialEvent event,
    Emitter<OnboardingTwoState> emit,
  ) async {
    emit(state.copyWith(
      sliderIndex: 0,
    ));
    emit(state.copyWith(
        onboardingTwoModelObj: state.onboardingTwoModelObj?.copyWith(
      twelveItemList: fillTwelveItemList(),
    )));
  }
}
