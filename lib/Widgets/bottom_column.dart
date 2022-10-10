import 'package:flutter/material.dart';
import 'package:flutter_webapp/Utils/typography.dart';

import '../Utils/color.dart';

class BottomColumn extends StatelessWidget {
  const BottomColumn(
      {Key? key,
      required this.heading,
      required this.s1,
      required this.s2,
      required this.s3})
      : super(key: key);
  final String heading;
  final String s1;
  final String s2;
  final String s3;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: screenSize.width < 800
              ? CustomTextStyle.kTextStyle8
                  .copyWith(fontSize: 10, letterSpacing: 0)
              : CustomTextStyle.kTextStyle18,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          s1,
          style: screenSize.width < 800
              ? CustomTextStyle.kTextStyle16.copyWith(
                  color: CustomColors.kGrey100, fontSize: 10, letterSpacing: 0)
              : CustomTextStyle.kTextStyle8
                  .copyWith(letterSpacing: 1, color: CustomColors.kGrey100),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          s2,
          style: screenSize.width < 800
              ? CustomTextStyle.kTextStyle16.copyWith(
                  color: CustomColors.kGrey100, fontSize: 10, letterSpacing: 0)
              : CustomTextStyle.kTextStyle8
                  .copyWith(letterSpacing: 1, color: CustomColors.kGrey100),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          s3,
          style: screenSize.width < 800
              ? CustomTextStyle.kTextStyle16.copyWith(
                  color: CustomColors.kGrey100, fontSize: 10, letterSpacing: 0)
              : CustomTextStyle.kTextStyle8
                  .copyWith(letterSpacing: 1, color: CustomColors.kGrey100),
        )
      ],
    );
  }
}
