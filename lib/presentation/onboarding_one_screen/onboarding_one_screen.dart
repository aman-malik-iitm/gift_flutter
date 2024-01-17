import 'bloc/onboarding_one_bloc.dart';
import 'models/onboarding_one_model.dart';
import 'package:aman_s_application2/core/app_export.dart';
import 'package:aman_s_application2/widgets/app_bar/appbar_title.dart';
import 'package:aman_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:aman_s_application2/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingOneScreen extends StatelessWidget {
  const OnboardingOneScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<OnboardingOneBloc>(
        create: (context) => OnboardingOneBloc(
            OnboardingOneState(onboardingOneModelObj: OnboardingOneModel()))
          ..add(OnboardingOneInitialEvent()),
        child: OnboardingOneScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingOneBloc, OnboardingOneState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: SizedBox(
                  width: double.maxFinite,
                  child: Column(children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgUntitledDesign,
                        height: 365.v,
                        width: 375.h),
                    SizedBox(height: 89.v),
                    _buildOnboardingTwo(context)
                  ]))));
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        title: AppbarTitle(
            text: "lbl_logo".tr, margin: EdgeInsets.only(left: 24.h)));
  }

  /// Section Widget
  Widget _buildOnboardingTwo(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(24.h),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.customBorderTL24),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
              width: 208.h,
              child: Text("msg_unwrap_savings".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style:
                      theme.textTheme.headlineSmall!.copyWith(height: 1.33))),
          SizedBox(height: 7.v),
          Text("msg_over_300_brands".tr, style: theme.textTheme.bodyMedium),
          SizedBox(height: 16.v),
          SizedBox(
              height: 8.v,
              child: AnimatedSmoothIndicator(
                  activeIndex: 0,
                  count: 4,
                  effect: ScrollingDotsEffect(
                      spacing: 4,
                      activeDotColor: theme.colorScheme.errorContainer,
                      dotColor: theme.colorScheme.onPrimary,
                      dotHeight: 8.v,
                      dotWidth: 8.h))),
          SizedBox(height: 24.v),
          CustomElevatedButton(text: "lbl_get_started".tr),
          SizedBox(height: 7.v)
        ]));
  }
}
