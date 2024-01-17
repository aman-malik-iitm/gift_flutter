import 'bloc/login_bloc.dart';
import 'models/login_model.dart';
import 'package:aman_s_application2/core/app_export.dart';
import 'package:aman_s_application2/core/utils/validation_functions.dart';
import 'package:aman_s_application2/widgets/app_bar/appbar_subtitle.dart';
import 'package:aman_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:aman_s_application2/widgets/custom_elevated_button.dart';
import 'package:aman_s_application2/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Final keyword added
  LoginScreen({Key? key})
      : super(
          key: key,
        );


  static Widget builder(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(LoginState(
        loginModelObj: LoginModel(),
      ))
        ..add(LoginInitialEvent()),
      child: LoginScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 24.h,
                  vertical: 99.v,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 28.v),
                    Text(
                      "lbl_logo".tr,
                      style: CustomTextStyles.interBlack900,
                    ),
                    Spacer(),
                    BlocSelector<LoginBloc, LoginState, TextEditingController?>(
                      selector: (state) => state.nameController,
                      builder: (context, nameController) {
                        return CustomTextFormField(
                          controller: nameController,
                          hintText: "lbl_name".tr,
                          validator: (value) {
                            if (!isText(value)) {
                              return "err_msg_please_enter_valid_text".tr;
                            }
                            return null;
                          },
                        );
                      },
                    ),
                    SizedBox(height: 16.v),
                    BlocSelector<LoginBloc, LoginState, TextEditingController?>(
                      selector: (state) => state.mobileNumberController,
                      builder: (context, mobileNumberController) {
                        return CustomTextFormField(
                          controller: mobileNumberController,
                          hintText: "lbl_mobile_number".tr,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.phone,
                          validator: (value) {
                            if (!isValidPhone(value)) {
                              return "err_msg_please_enter_valid_phone_number"
                                  .tr;
                            }
                            return null;
                          },
                        );
                      },
                    ),
                    SizedBox(height: 24.v),
                    CustomElevatedButton(
                      height: 48.v,
                      text: "lbl_login".tr,
                      buttonTextStyle: theme.textTheme.labelLarge!,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: AppbarSubtitle(
        text: "lbl_welcome".tr,
        margin: EdgeInsets.only(left: 24.h),
      ),
    );
  }
}
