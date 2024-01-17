import '../models/titledescription1_item_model.dart';
import 'package:aman_s_application2/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Titledescription1ItemWidget extends StatelessWidget {
  Titledescription1ItemWidget(
    this.titledescription1ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Titledescription1ItemModel titledescription1ItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 261.h,
          child: Text(
            "msg_join_the_savings".tr,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleLarge!.copyWith(
              height: 1.39,
            ),
          ),
        ),
        SizedBox(height: 5.v),
        Text(
          "msg_join_the_deal_dash".tr,
          style: theme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
