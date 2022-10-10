import 'package:flutter/material.dart';
import 'package:flutter_webapp/Utils/color.dart';
import 'package:flutter_webapp/Utils/typography.dart';

class TopBarContent extends StatefulWidget {
  const TopBarContent({Key? key, required this.opacitys}) : super(key: key);
  final double opacitys;

  @override
  State<TopBarContent> createState() => _TopBarContentState();
}

class _TopBarContentState extends State<TopBarContent> {
  List isHovering = [
    false,
    false,
    false,
    false,
  ];
  List menuList = [
    'Home',
    'About',
    'History',
    'Contact',
  ];

  late Size screenSize;
  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Container(
      color: CustomColors.kWhite.withOpacity(widget.opacitys),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: screenSize.width / 4,
            ),
            Text(
              'Author',
              style: CustomTextStyle.kTextStyle26,
            ),
            topBarMenu(index: 0, title: 'Home'),
            topBarMenu(index: 1, title: 'About'),
            topBarMenu(index: 2, title: 'History'),
            topBarMenu(index: 3, title: 'Contact'),
          ],
        ),
      ),
    );
  }

  Widget topBarMenu({required int index, required String title}) {
    return Row(
      children: [
        SizedBox(
          width: screenSize.width / 15,
        ),
        InkWell(
          splashColor: CustomColors.kTransparent,
          hoverColor: CustomColors.kBlue,
          onHover: ((value) {
            setState(() {
              value ? isHovering[index] = true : isHovering[index] = false;
            });
          }),
          onTap: () {},
          child: Column(
            children: [
              Text(
                title,
                style: CustomTextStyle.kTextStyle26.copyWith(
                    color: isHovering[index]
                        ? CustomColors.kGrey
                        : CustomColors.kBlue,
                    fontSize: 16),
              ),
              const SizedBox(
                height: 5,
              ),
              Visibility(
                  maintainAnimation: true,
                  maintainSize: true,
                  maintainState: true,
                  visible: isHovering[index],
                  child: Container(
                    width: 50,
                    height: 2,
                    color: CustomColors.kDarkBlue,
                  ))
            ],
          ),
        )
      ],
    );
  }
}
