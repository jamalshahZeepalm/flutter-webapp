import 'package:flutter/cupertino.dart';

import 'color.dart';

class CustomTextStyle {
  static TextStyle kTextStyle26 = TextStyle(
    color: CustomColors.kBlue,
    fontSize: 26,
    fontFamily: 'Raleway',
    fontWeight: FontWeight.w900,
    letterSpacing: 3,
  );
  static TextStyle kTextStyle16 = const TextStyle(
    fontSize: 16,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w500,
  );
  static TextStyle kTextStyle8 = TextStyle(
    letterSpacing: 8,
    fontFamily: 'Electrolize',
    
    color: CustomColors.kWhite
  );
  static TextStyle kTextStyle18=TextStyle(
              color: CustomColors.kWhite,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            );
}
