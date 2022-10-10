import 'package:flutter/material.dart';
import 'package:flutter_webapp/Utils/color.dart';

import '../Utils/typography.dart';

class MobileViewAppBar extends StatelessWidget {
  const MobileViewAppBar({
    Key? key,
    required this.opacty,
  }) : super(key: key);
  final double opacty;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      iconTheme: IconThemeData(color: CustomColors.kBlue),
      elevation: 0,
      backgroundColor: CustomColors.kWhite.withOpacity(opacty),
      title: Text(
        'Author',
        style: CustomTextStyle.kTextStyle26,
      ),
    );
  }
}
