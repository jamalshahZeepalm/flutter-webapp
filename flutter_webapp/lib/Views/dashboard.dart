import 'package:flutter/material.dart';
import 'package:flutter_webapp/Utils/color.dart';
import 'package:flutter_webapp/Utils/images_path.dart';
import 'package:flutter_webapp/Widgets/custom_bottombar.dart';

import '../Widgets/custom_carouselsilde.dart';
import '../Widgets/custom_drawer.dart';
import '../Widgets/custom_featureheading.dart';
import '../Widgets/custom_featuretitle.dart';
import '../Widgets/custom_mainheading.dart';
import '../Widgets/custom_mobileappbar.dart';
import '../Widgets/custom_quickaccesbar.dart';
import '../Widgets/custom_topcontent.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  double _opacity = 0;
  double scrollPosition = 0;
  ScrollController scrollController = ScrollController();

  _scrollListener() {
    setState(() {
      scrollPosition = scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    _opacity = scrollPosition < screenSize.height * 0.40
        ? scrollPosition / (screenSize.height * 0.40)
        : 1;
    debugPrint(_opacity.toString());
    return Scaffold(
      extendBodyBehindAppBar: screenSize.width < 800 ? false : true,
      appBar: screenSize.width < 800
          ? PreferredSize(
              preferredSize: Size(screenSize.width, 70),
              child: MobileViewAppBar(
                opacty: _opacity,
              ))
          : PreferredSize(
              preferredSize: Size(screenSize.width, 70),
              child: TopBarContent(opacitys: _opacity),
            ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(children: [
          Stack(
            children: [
              // SizedBox(height: screenSize.width < 800 ? 50 : 0),
              SizedBox(
                width: screenSize.width < 800
                    ? screenSize.width
                    : screenSize.width,
                height: screenSize.width < 800
                    ? screenSize.height * 0.35
                    : screenSize.height * 0.65,
                child: Image(
                  image: AssetImage(CustomAssets.kbackground),
                  fit: BoxFit.cover,
                ),
              ),
              Column(children: [
                // SizedBox(
                //   height: screenSize.height < 800
                //       ? screenSize.height * 0
                //       : screenSize.height * 0.60,
                // ),
                const QuickAccessBar( ///yes haa sir 
                   
                ),
                FeatureHeading(screenSize: screenSize),
                FeatureTitle(
                  screenSize: screenSize,
                ),
                MainHeading(
                  screenSize: screenSize,
                ),
                CarouselSliderContainer(screenSize: screenSize),
                const SizedBox(
                  height: 50,
                ),
                BottomBar(
                  screenSize: screenSize,
                  gradentone: CustomColors.kSimeGreen,
                  gradentTwo: CustomColors.kSimeBlue,
                ),
              ]),
            ],
          )
        ]),
      ),
      drawer: CustomDrawer(
        screenSize: screenSize,
      ),
    );
  }
}
