import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/widgets/on_sale_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../services/utils.dart';

class OnSaleScreen extends StatelessWidget {
  static const routeName = "/onSaleScreen";
  const OnSaleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //params
    bool _isEmpty = false;
    final utils = Utils(context);
    final Color color = utils.color;
    Size size = utils.getScreenSize;

    return Scaffold(
      //appbar
      appBar: AppBar(
        leading: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            IconlyLight.arrowLeft2,
            color: color,
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          text: "Products on sale",
          color: color,
          size: 24.0,
          isTitle: true,
        ),
      ),

      //body
      body: _isEmpty
          //no data
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Image.asset("assets/images/box.png"),
                  ),
                  Center(
                    child: TextWidget(
                      text: "No products on sale yet!, \nStay tuned",
                      color: color,
                      size: 30,
                      isTitle: true,
                    ),
                  ),
                ],
              ),
            )
          //has data
          : GridView.count(
              padding: EdgeInsets.zero,
              crossAxisCount: 2,
              childAspectRatio: size.width / (size.height * 0.45),
              children: List.generate(16, (index) {
                return const OnSaleWidget();
              }),
            ),
    );
  }
}
