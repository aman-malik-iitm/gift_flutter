import 'package:flutter/material.dart';
import 'package:aman_s_application2/presentation/onboarding_one_screen/onboarding_one_screen.dart';
import 'package:aman_s_application2/presentation/onboarding_two_screen/onboarding_two_screen.dart';
import 'package:aman_s_application2/presentation/onboarding_three_screen/onboarding_three_screen.dart';
import 'package:aman_s_application2/presentation/onboarding_four_screen/onboarding_four_screen.dart';
import 'package:aman_s_application2/presentation/login_screen/login_screen.dart';
import 'package:aman_s_application2/presentation/confirmation_code_screen/confirmation_code_screen.dart';
import 'package:aman_s_application2/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String onboardingOneScreen = '/onboarding_one_screen';

  static const String onboardingTwoScreen = '/onboarding_two_screen';

  static const String onboardingThreeScreen = '/onboarding_three_screen';

  static const String onboardingFourScreen = '/onboarding_four_screen';

  static const String loginScreen = '/login_screen';

  static const String confirmationCodeScreen = '/confirmation_code_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        onboardingOneScreen: OnboardingOneScreen.builder,
        onboardingTwoScreen: OnboardingTwoScreen.builder,
        onboardingThreeScreen: OnboardingThreeScreen.builder,
        onboardingFourScreen: OnboardingFourScreen.builder,
        loginScreen: LoginScreen.builder,
        confirmationCodeScreen: ConfirmationCodeScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: OnboardingOneScreen.builder
      };
}
