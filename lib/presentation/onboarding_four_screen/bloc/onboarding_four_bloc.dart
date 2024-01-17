import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/titledescription1_item_model.dart';
import 'package:aman_s_application2/presentation/onboarding_four_screen/models/onboarding_four_model.dart';
part 'onboarding_four_event.dart';
part 'onboarding_four_state.dart';

/// A bloc that manages the state of a OnboardingFour according to the event that is dispatched to it.
class OnboardingFourBloc
    extends Bloc<OnboardingFourEvent, OnboardingFourState> {
  OnboardingFourBloc(OnboardingFourState initialState) : super(initialState) {
    on<OnboardingFourInitialEvent>(_onInitialize);
  }

  List<Titledescription1ItemModel> fillTitledescription1ItemList() {
    return List.generate(1, (index) => Titledescription1ItemModel());
  }

  _onInitialize(
    OnboardingFourInitialEvent event,
    Emitter<OnboardingFourState> emit,
  ) async {
    emit(state.copyWith(
      sliderIndex: 0,
    ));
    emit(state.copyWith(
        onboardingFourModelObj: state.onboardingFourModelObj?.copyWith(
      titledescription1ItemList: fillTitledescription1ItemList(),
    )));
  }
}
