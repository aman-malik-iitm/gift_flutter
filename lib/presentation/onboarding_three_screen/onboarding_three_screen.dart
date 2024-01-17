import '../onboarding_three_screen/widgets/titledescription_item_widget.dart';
import 'bloc/onboarding_three_bloc.dart';
import 'models/onboarding_three_model.dart';
import 'models/titledescription_item_model.dart';
import 'package:aman_s_application2/core/app_export.dart';
import 'package:aman_s_application2/widgets/custom_elevated_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingThreeScreen extends StatelessWidget {
  const OnboardingThreeScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<OnboardingThreeBloc>(
      create: (context) => OnboardingThreeBloc(OnboardingThreeState(
        onboardingThreeModelObj: OnboardingThreeModel(),
      ))
        ..add(OnboardingThreeInitialEvent()),
      child: OnboardingThreeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 23.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 24.h),
                        child: Text(
                          "lbl_logo".tr,
                          style: theme.textTheme.headlineLarge,
                        ),
                      ),
                      SizedBox(height: 3.v),
                      CustomImageView(
                        imagePath: ImageConstant.imgUntitledDesign343x371,
                        height: 343.v,
                        width: 371.h,
                        margin: EdgeInsets.only(left: 4.h),
                      ),
                      SizedBox(height: 112.v),
                      _buildOnboardingThree(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildOnboardingThree(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 23.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.h),
            child: BlocBuilder<OnboardingThreeBloc, OnboardingThreeState>(
              builder: (context, state) {
                return CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 92.v,
                    initialPage: 0,
                    autoPlay: true,
                    viewportFraction: 1.0,
                    enableInfiniteScroll: false,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (
                      index,
                      reason,
                    ) {
                      state.sliderIndex = index;
                    },
                  ),
                  itemCount: state.onboardingThreeModelObj
                          ?.titledescriptionItemList.length ??
                      0,
                  itemBuilder: (context, index, realIndex) {
                    TitledescriptionItemModel model = state
                            .onboardingThreeModelObj
                            ?.titledescriptionItemList[index] ??
                        TitledescriptionItemModel();
                    return TitledescriptionItemWidget(
                      model,
                    );
                  },
                );
              },
            ),
          ),
          SizedBox(height: 15.v),
          BlocBuilder<OnboardingThreeBloc, OnboardingThreeState>(
            builder: (context, state) {
              return SizedBox(
                height: 8.v,
                child: AnimatedSmoothIndicator(
                  activeIndex: state.sliderIndex,
                  count: state.onboardingThreeModelObj?.titledescriptionItemList
                          .length ??
                      0,
                  axisDirection: Axis.horizontal,
                  effect: ScrollingDotsEffect(
                    spacing: 4,
                    activeDotColor: theme.colorScheme.errorContainer,
                    dotColor: theme.colorScheme.onPrimary,
                    dotHeight: 8.v,
                    dotWidth: 8.h,
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 24.v),
          CustomElevatedButton(
            text: "lbl_get_started".tr,
          ),
          SizedBox(height: 9.v),
        ],
      ),
    );
  }
}
