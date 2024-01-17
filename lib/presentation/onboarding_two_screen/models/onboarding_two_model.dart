// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'twelve_item_model.dart';

/// This class defines the variables used in the [onboarding_two_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class OnboardingTwoModel extends Equatable {
  OnboardingTwoModel({this.twelveItemList = const []}) ;

  List<TwelveItemModel> twelveItemList;

  OnboardingTwoModel copyWith({List<TwelveItemModel>? twelveItemList}) {
    return OnboardingTwoModel(
      twelveItemList: twelveItemList ?? this.twelveItemList,
    );
  }

  @override
  List<Object?> get props => [twelveItemList];
}
