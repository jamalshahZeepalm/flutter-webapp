import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webapp/Models/carouselslider.dart';
import 'package:flutter_webapp/Utils/color.dart';
import 'package:flutter_webapp/Utils/typography.dart';

class CarouselSliderContainer extends StatefulWidget {
  const CarouselSliderContainer({Key? key, required this.screenSize})
      : super(key: key);
  final Size screenSize;

  @override
  State<CarouselSliderContainer> createState() =>
      _CarouselSliderContainerState();
}

class _CarouselSliderContainerState extends State<CarouselSliderContainer> {
  var sliderKey = GlobalKey();
  int currentPage = 0;
  var controller = PageController(
    initialPage: 0,
  );
  List isHovering = [false, false, false, false, false, false, false];
  List isSelected = [true, false, false, false, false, false, false];
  List<Widget> newList = [];
  List<String> cardList = [
    'ASIA',
    'AFRICA',
    'EUROPE',
    'SOUTH AMERICA',
    'NORTH AMERICA',
    'ANTARCTICA',
  ];
  int current = 0;
  late Timer _timer;
  @override
  void initState() {
    super.initState();
   WidgetsBinding.instance.addPostFrameCallback((_) {
      _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
        if (currentPage < list.length) {
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
        ? Stack(
            children: [
              Padding(
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
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildItem(carouselSliderData: list[index]);
                    },
                  ),
                ),
              ),
            ],
          )
        : Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: widget.screenSize.width / 20,
                  right: widget.screenSize.width / 20,
                ),
                child: SizedBox(
                  height: 500,
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
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildItem(carouselSliderData: list[index]);
                    },
                  ),
                ),
              ),
              AspectRatio(
                aspectRatio: 21 / 8,
                child: Center(
                  heightFactor: 1,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: widget.screenSize.width / 8,
                        right: widget.screenSize.height / 4,
                      ),
                      child: Card(
                          child: Padding(
                        padding: EdgeInsets.only(
                          top: widget.screenSize.height / 50,
                          bottom: widget.screenSize.height / 50,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: cardMethod(),
                        ),
                      )),
                    ),
                  ),
                ),
              )
            ],
          );
  }

  cardMethod() {
    newList.clear();

    for (int i = 0; i < cardList.length; i++) {
      newList.add(InkWell(
        splashColor: CustomColors.kTransparent,
        hoverColor: CustomColors.kTransparent,
        onHover: ((value) {
          setState(() {
            value ? isHovering[i] = true : isHovering[i] = false;
          });
        }),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              cardList[i].toString(),
              style: TextStyle(
                color: isHovering[i] ? CustomColors.kGrey : CustomColors.kBlue,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Visibility(
                maintainAnimation: true,
                maintainSize: true,
                maintainState: true,
                visible: isHovering[i],
                child: Container(
                  width: 100,
                  height: 2,
                  color: CustomColors.kDarkBlue,
                ))
          ],
        ),
        onTap: () {
          controller.animateToPage(
            i,
            duration: const Duration(microseconds: 100),
            curve: Curves.easeIn,
          );
        },
      ));
    }
    return newList;
  }

  Widget buildItem({required CarouselSliderData carouselSliderData}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: widget.screenSize.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(carouselSliderData.image), fit: BoxFit.cover),
          ),
          child: Center(
              child: Text(
            carouselSliderData.title,
            style: CustomTextStyle.kTextStyle8.copyWith(
              fontSize: widget.screenSize.width / 25,
            ),
          )),
        ),
      ),
    );
  }
}
