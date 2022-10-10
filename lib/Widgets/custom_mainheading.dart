import 'package:flutter/material.dart';
import 'package:flutter_webapp/Utils/color.dart';
import 'package:flutter_webapp/Utils/typography.dart';

class MainHeading extends StatelessWidget {
  const MainHeading({
    Key? key,
    required this.screenSize,
  }) : super(key: key);
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: screenSize.height / 10, bottom: screenSize.height / 15),
      width: screenSize.width,
      child: Center(
        child: Text(
          'Knowledge diversity',
          style: CustomTextStyle.kTextStyle16.copyWith(
              fontSize: screenSize.width < 800 ? 20 : 40,
              fontWeight: FontWeight.w800,
              color: CustomColors.kBlue),
        ),
      ),
    );
  }
}
