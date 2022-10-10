import 'package:flutter/material.dart';
import 'package:flutter_webapp/Utils/color.dart';
import 'package:flutter_webapp/Utils/icondata.dart';

class QuickAccessBar extends StatefulWidget {
  const QuickAccessBar({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<QuickAccessBar> createState() => _QuickAccessBarState();
}

class _QuickAccessBarState extends State<QuickAccessBar> {
  List<Widget> newList = [];
  List isHovering = [
    false,
    false,
    false,
    false,
  ];
  List<IconData> iconsList = [
    CustomIconData.kLocationon,
    CustomIconData.kDateRange,
    CustomIconData.kPeople,
    CustomIconData.kWbSunny,
  ];
  List<String> menuList = ['History', 'Science', 'Philosophy', 'Novels'];

  @override
  Widget build(BuildContext context) {
    return Center(child: LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 800) {
          return Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.33,
              left: MediaQuery.of(context).size.width / 50,
              right: MediaQuery.of(context).size.width / 50,
            ),
            child: Column(children: quickAccessBarMobile()),
          );
        } else {
          return Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.60,
              left: MediaQuery.of(context).size.width / 5,
              right: MediaQuery.of(context).size.width / 5,
            ),
            child: Card(
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 50,
                  bottom: MediaQuery.of(context).size.height / 50,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: quickAccessBar(),
                ),
              ),
            ),
          );
        }
      },
    ));
  }

  quickAccessBar() {
    newList.clear();
    for (int i = 0; i < menuList.length; i++) {
      Widget newWidget = InkWell(
        splashColor: CustomColors.kTransparent,
        hoverColor: CustomColors.kTransparent,
        onHover: ((value) {
          setState(() {
            value ? isHovering[i] = true : isHovering[i] = false;
          });
        }),
        child: Text(
          menuList[i].toString(),
          style: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: isHovering[i] ? CustomColors.kGrey : CustomColors.kBlue,
          ),
        ),
        onTap: () {},
      );
      Widget space = SizedBox(
        height: MediaQuery.of(context).size.height / 20,
        child: VerticalDivider(
          width: 1,
          color: CustomColors.kGrey100,
          thickness: 1,
        ),
      );
      newList.add(newWidget);
      if (i < menuList.length - 1) {
        newList.add(space);
      }
    }
    return newList;
  }

  quickAccessBarMobile() {
    newList.clear();
    for (int i = 0; i < menuList.length; i++) {
      newList.add(Card(
        elevation: 3,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.50,
          height: MediaQuery.of(context).size.height * 0.08,
          child: InkWell(
            splashColor: CustomColors.kTransparent,
            hoverColor: CustomColors.kTransparent,
            onHover: ((value) {
              setState(() {
                value ? isHovering[i] = true : isHovering[i] = false;
              });
            }),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(13),
                  child: Icon(
                    iconsList[i],
                    color: CustomColors.kGrey,
                    size: 22,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  menuList[i].toString(),
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color:
                        isHovering[i] ? CustomColors.kGrey : CustomColors.kBlue,
                  ),
                ),
              ],
            ),
            onTap: () {},
          ),
        ),
      ));
    }
    return newList;
  }
}


