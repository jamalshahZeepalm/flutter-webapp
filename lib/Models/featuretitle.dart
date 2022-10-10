import 'package:flutter_webapp/Utils/images_path.dart';

class FeatureTitleData {
  String title;
  String image;

  FeatureTitleData({
    required this.title,required this.image
  });
}

List<FeatureTitleData> menuList = [
  FeatureTitleData(title: 'Sci-fi',image: CustomAssets.kTest1),
  FeatureTitleData(title: 'Photography',image: CustomAssets.kTest2),
  FeatureTitleData(title: 'Romance',image: CustomAssets.kTest3),
  
];
