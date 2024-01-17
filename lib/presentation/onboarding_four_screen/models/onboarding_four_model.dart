// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'titledescription1_item_model.dart';

/// This class defines the variables used in the [onboarding_four_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class OnboardingFourModel extends Equatable {
  OnboardingFourModel({this.titledescription1ItemList = const []}) ;

  List<Titledescription1ItemModel> titledescription1ItemList;

  OnboardingFourModel copyWith(
      {List<Titledescription1ItemModel>? titledescription1ItemList}) {
    return OnboardingFourModel(
      titledescription1ItemList:
          titledescription1ItemList ?? this.titledescription1ItemList,
    );
  }

  @override
  List<Object?> get props => [titledescription1ItemList];
}
