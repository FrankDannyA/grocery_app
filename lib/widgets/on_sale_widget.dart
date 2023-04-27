import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/widgets/price_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../services/utils.dart';

class OnSaleWidget extends StatefulWidget {
  const OnSaleWidget({Key? key}) : super(key: key);

  @override
  _OnSaleWidgetState createState() => _OnSaleWidgetState();
}

class _OnSaleWidgetState extends State<OnSaleWidget> {
  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    final themeState = utils.themeData;
    final Color color = utils.color;
    Size size = utils.getScreenSize;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      "https://i.ibb.co/F0s3FHQ/Apricots.png",
                      //height: size.height * 0.22,
                      width: size.width * 0.22,
                      fit: BoxFit.fill,
                    ),
                    Column(
                      children: [
                        TextWidget(
                          text: "1KG",
                          color: color,
                          size: 22,
                          isTitle: true,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Icon(
                                IconlyLight.bag2,
                                size: 22,
                                color: color,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Icon(
                                IconlyLight.heart,
                                size: 22,
                                color: color,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                PriceWidget(),
                const SizedBox(
                  height: 5,
                ),
                TextWidget(
                  text: "ProductTitle",
                  color: color,
                  size: 16,
                  isTitle: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
