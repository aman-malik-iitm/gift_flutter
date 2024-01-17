import '../onboarding_four_screen/widgets/titledescription1_item_widget.dart';
import 'bloc/onboarding_four_bloc.dart';
import 'models/onboarding_four_model.dart';
import 'models/titledescription1_item_model.dart';
import 'package:aman_s_application2/core/app_export.dart';
import 'package:aman_s_application2/widgets/custom_elevated_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingFourScreen extends StatelessWidget {
  const OnboardingFourScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<OnboardingFourBloc>(
      create: (context) => OnboardingFourBloc(OnboardingFourState(
        onboardingFourModelObj: OnboardingFourModel(),
      ))
        ..add(OnboardingFourInitialEvent()),
      child: OnboardingFourScreen(),
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
                imagePath: ImageConstant.imgUntitledDesign343x369,
                height: 343.v,
                width: 369.h,
              ),
              Spacer(),
              _buildOnboardingFourColumn(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildOnboardingFourColumn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 22.h,
        vertical: 24.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 33.h),
            child: BlocBuilder<OnboardingFourBloc, OnboardingFourState>(
              builder: (context, state) {
                return CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 90.v,
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
                  itemCount: state.onboardingFourModelObj
                          ?.titledescription1ItemList.length ??
                      0,
                  itemBuilder: (context, index, realIndex) {
                    Titledescription1ItemModel model = state
                            .onboardingFourModelObj
                            ?.titledescription1ItemList[index] ??
                        Titledescription1ItemModel();
                    return Titledescription1ItemWidget(
                      model,
                    );
                  },
                );
              },
            ),
          ),
          SizedBox(height: 16.v),
          BlocBuilder<OnboardingFourBloc, OnboardingFourState>(
            builder: (context, state) {
              return SizedBox(
                height: 8.v,
                child: AnimatedSmoothIndicator(
                  activeIndex: state.sliderIndex,
                  count: state.onboardingFourModelObj?.titledescription1ItemList
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
          SizedBox(height: 7.v),
        ],
      ),
    );
  }
}
