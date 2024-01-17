import '../models/twelve_item_model.dart';
import 'package:aman_s_application2/core/app_export.dart';
import 'package:aman_s_application2/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TwelveItemWidget extends StatelessWidget {
  TwelveItemWidget(
    this.twelveItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  TwelveItemModel twelveItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: CustomElevatedButton(
        width: 327.h,
        text: "lbl_get_started".tr,
        margin: EdgeInsets.only(top: 139.v),
      ),
    );
  }
}
