import '../onboarding_two_screen/widgets/twelve_item_widget.dart';
import 'bloc/onboarding_two_bloc.dart';
import 'models/onboarding_two_model.dart';
import 'models/twelve_item_model.dart';
import 'package:aman_s_application2/core/app_export.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingTwoScreen extends StatelessWidget {
  const OnboardingTwoScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<OnboardingTwoBloc>(
      create: (context) => OnboardingTwoBloc(OnboardingTwoState(
        onboardingTwoModelObj: OnboardingTwoModel(),
      ))
        ..add(OnboardingTwoInitialEvent()),
      child: OnboardingTwoScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 23.v),
              Padding(
                padding: EdgeInsets.only(left: 24.h),
                child: Text(
                  "lbl_logo".tr,
                  style: theme.textTheme.headlineLarge,
                ),
              ),
              SizedBox(height: 3.v),
              CustomImageView(
                imagePath: ImageConstant.imgUntitledDesign333x368,
                height: 333.v,
                width: 368.h,
                margin: EdgeInsets.only(left: 4.h),
              ),
              Spacer(),
              _buildOnboardingTwoStack(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildOnboardingTwoStack(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      margin: EdgeInsets.all(0),
      color: appTheme.whiteA700,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusStyle.customBorderTL24,
      ),
      child: Container(
        height: 248.v,
        width: double.maxFinite,
        padding: EdgeInsets.all(24.h),
        decoration: AppDecoration.fillWhiteA.copyWith(
          borderRadius: BorderRadiusStyle.customBorderTL24,
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            BlocBuilder<OnboardingTwoBloc, OnboardingTwoState>(
              builder: (context, state) {
                return CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 191.v,
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
                  itemCount:
                      state.onboardingTwoModelObj?.twelveItemList.length ?? 0,
                  itemBuilder: (context, index, realIndex) {
                    TwelveItemModel model =
                        state.onboardingTwoModelObj?.twelveItemList[index] ??
                            TwelveItemModel();
                    return TwelveItemWidget(
                      model,
                    );
                  },
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BlocBuilder<OnboardingTwoBloc, OnboardingTwoState>(
                builder: (context, state) {
                  return Container(
                    height: 8.v,
                    margin: EdgeInsets.only(bottom: 83.v),
                    child: AnimatedSmoothIndicator(
                      activeIndex: state.sliderIndex,
                      count:
                          state.onboardingTwoModelObj?.twelveItemList.length ??
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
            ),
          ],
        ),
      ),
    );
  }
}
