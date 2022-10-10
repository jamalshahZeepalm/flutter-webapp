import 'package:flutter/material.dart';
import 'package:flutter_webapp/Utils/color.dart';
import 'package:flutter_webapp/Utils/typography.dart';

import 'bottom_column.dart';
import 'customtextinfo.dart';

class BottomBar extends StatelessWidget {
  const BottomBar(
      {Key? key,
      required this.screenSize,
      required this.gradentone,
      required this.gradentTwo})
      : super(key: key);
  final Size screenSize;
  final Color gradentone;
  final Color gradentTwo;
  @override
  Widget build(BuildContext context) {
    return screenSize.width < 800
        ? Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.0),
                gradient: LinearGradient(
                  colors: [gradentone, gradentTwo],
                  begin: const FractionalOffset(0.2, 0.2),
                  end: const FractionalOffset(1.0, 1.0),
                  stops: const [0.1, 1.0],
                  tileMode: TileMode.clamp,
                )),
            padding: const EdgeInsets.only(top: 10, bottom: 10, left: 5),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 7),
                      child: BottomColumn(
                        heading: 'ABOUT',
                        s1: 'Contact Us',
                        s2: 'About Us',
                        s3: 'Careers',
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: BottomColumn(
                        heading: 'HELP',
                        s1: 'Payment',
                        s2: 'Cancellation',
                        s3: 'FQA',
                      ),
                    ),
                    const BottomColumn(
                      heading: 'SOCAIL',
                      s1: 'Twitter',
                      s2: 'Slack',
                      s3: 'Facebook',
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: screenSize.width < 800 ? 50 : 180,
                      width: 2,
                      color: CustomColors.kWhite,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        TextInfoWidget(
                            heading: 'Email   ',
                            title: 'zeepalmtechnologies.slack.com'),
                        SizedBox(
                          height: 5,
                        ),
                        TextInfoWidget(
                            heading: 'Address', title: 'Trymore Road,')
                      ],
                    )
                  ],
                ),
                const Divider(
                  color: Colors.white,
                ),
                SizedBox(height: screenSize.width < 800 ? 5 : 20),
                Text('Copyright © 2022 | Zee Palm Technologies',
                    style: screenSize.width < 800
                        ? CustomTextStyle.kTextStyle16.copyWith(
                            color: CustomColors.kGrey100,
                            fontSize: 10,
                            letterSpacing: 0)
                        : CustomTextStyle.kTextStyle16
                            .copyWith(color: Colors.white60)),
              ],
            ),
          )
        : Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.0),
                gradient: LinearGradient(
                  colors: [gradentone, gradentTwo],
                  begin: const FractionalOffset(0.2, 0.2),
                  end: const FractionalOffset(1.0, 1.0),
                  stops: const [0.1, 1.0],
                  tileMode: TileMode.clamp,
                )),
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 7),
                      child: BottomColumn(
                        heading: 'ABOUT',
                        s1: 'Contact Us',
                        s2: 'About Us',
                        s3: 'Careers',
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: BottomColumn(
                        heading: 'HELP',
                        s1: 'Payment',
                        s2: 'Cancellation',
                        s3: 'FQA',
                      ),
                    ),
                    const BottomColumn(
                      heading: 'SOCAIL',
                      s1: 'Twitter',
                      s2: 'Slack',
                      s3: 'Facebook',
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 180,
                      width: 2,
                      color: CustomColors.kWhite,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        TextInfoWidget(
                            heading: 'Email   ',
                            title: 'zeepalmtechnologies.slack.com'),
                        TextInfoWidget(
                            heading: 'Address', title: 'Trymore Road,')
                      ],
                    )
                  ],
                ),
                const Divider(
                  color: Colors.white,
                ),
                const SizedBox(height: 10),
                Text('Copyright © 2022 | Zee Palm Technologies',
                    style: CustomTextStyle.kTextStyle16
                        .copyWith(color: Colors.white60)),
              ],
            ),
          );
  }
}
