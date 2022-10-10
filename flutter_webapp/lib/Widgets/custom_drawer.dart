import 'package:flutter/material.dart';
import 'package:flutter_webapp/Utils/color.dart';

import '../Utils/typography.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key, required this.screenSize}) : super(key: key);
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColors.kBlue.withOpacity(0.3),
      child: Column(children: [
        DrawerHeader(
          padding: const EdgeInsets.all(0),
          child: Container(
            color: CustomColors.kBlue.withOpacity(0.6),
            child: Center(
              child: Text(
                'Author',
                style: CustomTextStyle.kTextStyle26
                    .copyWith(color: CustomColors.kWhite),
              ),
            ),
          ),
        ),
        buildItems(title: 'Home'),
        Divider(
          color: CustomColors.kWhite,
        ),
        buildItems(title: 'About'),
        Divider(
          color: CustomColors.kWhite,
        ),
        buildItems(title: 'Read'),
        Divider(
          color: CustomColors.kWhite,
        ),
        buildItems(title: 'Contact Us'),
        Divider(
          color: CustomColors.kWhite,
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 7),
              child: Text('Copyright © 2022 | Zee Palm Technologies',
                  style: CustomTextStyle.kTextStyle16
                      .copyWith(color: Colors.white60, fontSize: 13)),
            ),
          ),
        )
      ]),
    );
  }

  Widget buildItems({required String title}) {
    return Padding(
      padding: const EdgeInsets.only(left: 7),
      child: Row(
        children: [
          Text(title,
              style: CustomTextStyle.kTextStyle16
                  .copyWith(color: Colors.white60, fontSize: 13))
        ],
      ),
    );
  }
}
