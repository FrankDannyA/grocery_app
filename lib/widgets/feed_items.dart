import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/widgets/heartBTN.dart';
import 'package:grocery_app/widgets/price_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../services/utils.dart';

class FeedItems extends StatefulWidget {
  const FeedItems({Key? key}) : super(key: key);

  @override
  _FeedItemsState createState() => _FeedItemsState();
}

class _FeedItemsState extends State<FeedItems> {
  final _quantityController = TextEditingController();

  @override
  void initState() {
    _quantityController.text = "1";
    super.initState();
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    final Color color = utils.color;
    Size size = utils.getScreenSize;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Column(
            children: [
              FancyShimmerImage(
                imageUrl: "https://i.ibb.co/F0s3FHQ/Apricots.png",
                height: size.width * 0.21,
                width: size.width * 0.21,
                boxFit: BoxFit.fill,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: "Title",
                        color: color,
                        size: 20,
                        isTitle: true,
                      ),
                      HeartBTN(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Flexible(
                      child: PriceWidget(
                        price: 5.9,
                        salePrice: 2.99,
                        textPrice: _quantityController.text,
                        isOnSale: true,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Row(
                        children: [
                          FittedBox(
                            child: TextWidget(
                              text: 'KG',
                              color: color,
                              size: 18,
                              isTitle: true,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Flexible(
                            child: TextFormField(
                              controller: _quantityController,
                              key: const ValueKey("10"),
                              style: TextStyle(color: color, fontSize: 18),
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                              enabled: true,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(
                                    "[0-9.]",
                                  ),
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: TextWidget(
                    text: "Add to cart",
                    color: color,
                    size: 20,
                    maxLines: 1,
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).cardColor),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        )),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
