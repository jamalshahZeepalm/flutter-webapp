import 'package:flutter/material.dart';
import 'package:flutter_webapp/Utils/typography.dart';

class FeatureHeading extends StatelessWidget {
  const FeatureHeading({Key? key, required this.screenSize}) : super(key: key);
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: screenSize.height * 0.06,
          left: screenSize.width / 15,
          right: screenSize.width / 15),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          'Featured',
          style: CustomTextStyle.kTextStyle26
              .copyWith(fontSize: screenSize.width < 800 ? 20 : 36),
        ),
        screenSize.width < 800
            ? const SizedBox()
            : const Text(
                'Clue of the wooden cottage',
                textAlign: TextAlign.end,
              )
      ]),
    );
  }
}
