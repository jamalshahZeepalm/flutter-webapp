import 'package:flutter_webapp/Utils/images_path.dart';

class CarouselSliderData {
  String title;
  String image;
  CarouselSliderData({
    required this.title,
    required this.image,
  });
}

List<CarouselSliderData> list = [
  CarouselSliderData(title: 'ASIA', image: CustomAssets.kAsia),
  CarouselSliderData(title: 'AFRICA', image: CustomAssets.kAfrica),
  CarouselSliderData(title: 'EUROPE', image: CustomAssets.kEurope),
  CarouselSliderData(title: 'SOUTH AMERICA', image: CustomAssets.kSouthAmerica),
  CarouselSliderData(title: 'NORTH AMERICA', image: CustomAssets.kNorthAmerica),
  CarouselSliderData(title: 'ANTARCTICA', image: CustomAssets.kAntarctica)
];
