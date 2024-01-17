import 'bloc/confirmation_code_bloc.dart';
import 'models/confirmation_code_model.dart';
import 'package:aman_s_application2/core/app_export.dart';
import 'package:aman_s_application2/widgets/custom_elevated_button.dart';
import 'package:aman_s_application2/widgets/custom_pin_code_text_field.dart';
import 'package:flutter/material.dart';

class ConfirmationCodeScreen extends StatelessWidget {
  const ConfirmationCodeScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<ConfirmationCodeBloc>(
      create: (context) => ConfirmationCodeBloc(ConfirmationCodeState(
        confirmationCodeModelObj: ConfirmationCodeModel(),
      ))
        ..add(ConfirmationCodeInitialEvent()),
      child: ConfirmationCodeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 43.v,
          ),
          child: Column(
            children: [
              Text(
                "msg_enter_confirmation".tr,
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(height: 8.v),
              SizedBox(
                width: 153.h,
                child: Text(
                  "msg_a_4_digit_code_was".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodySmall!.copyWith(
                    height: 1.33,
                  ),
                ),
              ),
              SizedBox(height: 40.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 59.h),
                child: BlocSelector<ConfirmationCodeBloc, ConfirmationCodeState,
                    TextEditingController?>(
                  selector: (state) => state.otpController,
                  builder: (context, otpController) {
                    return CustomPinCodeTextField(
                      context: context,
                      controller: otpController,
                      onChanged: (value) {
                        otpController?.text = value;
                      },
                    );
                  },
                ),
              ),
              Spacer(),
              Text(
                "lbl_resend_code".tr,
                style: CustomTextStyles.labelLargeIndigoA400,
              ),
              SizedBox(height: 28.v),
              CustomElevatedButton(
                height: 48.v,
                text: "lbl_continue".tr,
                margin: EdgeInsets.only(left: 8.h),
                buttonTextStyle: theme.textTheme.labelLarge!,
              ),
              SizedBox(height: 52.v),
            ],
          ),
        ),
      ),
    );
  }
}
