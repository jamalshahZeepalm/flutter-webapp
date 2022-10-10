import 'package:flutter/material.dart';
import 'package:flutter_webapp/Utils/color.dart';
import 'package:flutter_webapp/Utils/typography.dart';

class TextInfoWidget extends StatelessWidget {
  const TextInfoWidget({Key? key, required this.heading, required this.title})
      : super(key: key);
  final String heading;
  final String title;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return screenSize.width < 800
        ? Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  heading,
                  style: screenSize.width < 800
                      ? CustomTextStyle.kTextStyle8
                          .copyWith(fontSize: 12, letterSpacing: 0)
                      : CustomTextStyle.kTextStyle18,
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: screenSize.width < 800 ? 82 : 300,
                  child: Text(
                    title,
                    style: screenSize.width < 800
                        ? CustomTextStyle.kTextStyle16.copyWith(
                            color: CustomColors.kGrey100,
                            fontSize: 10,
                            letterSpacing: 0)
                        : CustomTextStyle.kTextStyle16.copyWith(
                            color: CustomColors.kGrey100,
                          ),
                  ),
                ),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  heading,
                  style: CustomTextStyle.kTextStyle18,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: CustomTextStyle.kTextStyle16.copyWith(
                    color: CustomColors.kGrey100,
                  ),
                ),
              ],
            ),
          );
  }
}
