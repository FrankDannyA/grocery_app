import 'package:flutter/material.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/categories_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class Categories extends StatelessWidget {
  Categories({Key? key}) : super(key: key);

  List<Map<String, dynamic>> catInfo = [
    {
      "imgPath": "assets/images/cat/fruits.png",
      "catText": "Fruits",
    },
    {
      "imgPath": "assets/images/cat/veg.png",
      "catText": "Vegetables",
    },
    {
      "imgPath": "assets/images/cat/Spinach.png",
      "catText": "Herbs",
    },
    {
      "imgPath": "assets/images/cat/nuts.png",
      "catText": "Nuts",
    },
    {
      "imgPath": "assets/images/cat/spices.png",
      "catText": "Spices",
    },
    {
      "imgPath": "assets/images/cat/grains.png",
      "catText": "Grains",
    },
  ];

  List<Color> gridColors = [
    const Color(0xff538175),
    const Color(0xffF8A44C),
    const Color(0xffF7A593),
    const Color(0xffD3B0E0),
    const Color(0xffFDE598),
    const Color(0xffB7DFF5),
  ];

  @override
  Widget build(BuildContext context) {
    final util = Utils(context);
    Color color = util.color;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          title: TextWidget(
            text: "Categories",
            color: color,
            size: 24,
            isTitle: true,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 240 / 250,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: List.generate(6, (index) {
              return CategoriesWidget(
                catText: catInfo[index]["catText"],
                colorCat: gridColors[index],
                imgPath: catInfo[index]["imgPath"],
              );
            }),
          ),
        ));
  }
}
