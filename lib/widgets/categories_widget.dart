import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import '../services/utils.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget(
      {Key? key,
      required this.catText,
      required this.imgPath,
      required this.colorCat})
      : super(key: key);

  final String catText, imgPath;
  final Color colorCat;

  @override
  Widget build(BuildContext context) {
    final util = Utils(context);
    Color color = util.color;
    double _screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        print("Categories pressed");
      },
      child: Container(
        decoration: BoxDecoration(
          color: colorCat.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 2, color: colorCat.withOpacity(0.7)),
        ),
        child: Column(
          children: [
            Container(
              width: _screenWidth * 0.3,
              height: _screenWidth * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imgPath),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            TextWidget(
              text: catText,
              color: color,
              size: 20,
              isTitle: true,
            )
          ],
        ),
      ),
    );
  }
}
