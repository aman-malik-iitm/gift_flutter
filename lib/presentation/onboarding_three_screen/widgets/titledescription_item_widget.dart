import '../models/titledescription_item_model.dart';
import 'package:aman_s_application2/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TitledescriptionItemWidget extends StatelessWidget {
  TitledescriptionItemWidget(
    this.titledescriptionItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  TitledescriptionItemModel titledescriptionItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 246.h,
          child: Text(
            "msg_from_click_to_claim".tr,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineSmall!.copyWith(
              height: 1.33,
            ),
          ),
        ),
        SizedBox(height: 5.v),
        Text(
          "msg_click_claim_conquer".tr,
          style: theme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
