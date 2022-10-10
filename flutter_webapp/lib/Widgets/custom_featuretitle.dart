import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webapp/Models/featuretitle.dart';
import 'package:flutter_webapp/Utils/color.dart';
import 'package:flutter_webapp/Utils/typography.dart';

import '../Models/carouselslider.dart';

class FeatureTitle extends StatefulWidget {
  const FeatureTitle({
    Key? key,
    required this.screenSize,
  }) : super(key: key);
  final Size screenSize;

  @override
  State<FeatureTitle> createState() => _FeatureTitleState();
}

class _FeatureTitleState extends State<FeatureTitle> {
  var sliderKey = GlobalKey();

  int currentPage = 0;
  List isSelected = [true, false, false, false, false, false, false];
  var controller = PageController(
    initialPage: 0,
  );
  int current = 0;
  late Timer _timer;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
        if (currentPage < menuList.length) {
          currentPage++;
        } else {
          currentPage = 0;
        }

        controller.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return widget.screenSize.width < 800
        ? Padding(
            padding: EdgeInsets.only(
              left: widget.screenSize.width / 40,
              right: widget.screenSize.width / 40,
            ),
            child: SizedBox(
              height: 250,
              child: PageView.builder(
                scrollBehavior: const ScrollBehavior(),
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    current = index;
                    for (int i = 0; i < list.length; i++) {
                      if (i == index) {
                        isSelected[i] = true;
                      } else {
                        isSelected[i] = false;
                      }
                    }
                  });
                },
                itemCount: menuList.length,
                itemBuilder: (BuildContext context, int index) {
                  return newMethod(featureTitleData: menuList[index]);
                },
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.only(
              top: widget.screenSize.height * 0.06,
              left: widget.screenSize.width / 15,
              right: widget.screenSize.width / 15,
            ),
            child: SizedBox(
              width: widget.screenSize.width,
              height: 250,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return newMethod(featureTitleData: menuList[index]);
                },
                itemCount: menuList.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 50,
                  );
                },
              ),
            ),
          );
  }

  Widget newMethod({required FeatureTitleData featureTitleData}) {
    return widget.screenSize.width < 800
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: widget.screenSize.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                    image: AssetImage(featureTitleData.image),
                    fit: BoxFit.cover),
              ),
              child: Center(
                  child: Text(
                featureTitleData.title,
                style: CustomTextStyle.kTextStyle8.copyWith(
                  fontSize: widget.screenSize.width / 20,
                ),
              )),
            ),
          )
        : Column(
            children: [
              Container(
                width: widget.screenSize.width / 3.8,
                height: widget.screenSize.height / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                      image: AssetImage(featureTitleData.image),
                      fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  featureTitleData.title,
                  style: CustomTextStyle.kTextStyle16.copyWith(
                    color: CustomColors.kGrey,
                  ),
                ),
              ),
            ],
          );
  }
}
