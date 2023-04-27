import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../widgets/on_sale_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _offerImages = [
    "assets/images/offres/Offer1.jpg",
    "assets/images/offres/Offer2.jpg",
    "assets/images/offres/Offer3.jpg",
    "assets/images/offres/Offer4.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    final themeState = utils.themeData;
    Size size = utils.getScreenSize;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.33,
            child: Swiper(
              itemBuilder: (context, index) {
                return Image.asset(
                  _offerImages[index],
                  fit: BoxFit.fill,
                );
              },
              autoplay: true,
              itemCount: _offerImages.length,
              pagination: const SwiperPagination(
                alignment: Alignment.bottomCenter,
                builder: DotSwiperPaginationBuilder(
                  activeColor: Colors.red,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 8,
            ),
            child: TextButton(
              onPressed: () {},
              child: TextWidget(
                text: "View all",
                color: Colors.blue,
                size: 20,
                maxLines: 1,
              ),
            ),
          ),
          Row(
            children: [
              RotatedBox(
                quarterTurns: -1,
                child: Row(
                  children: [
                    TextWidget(
                      text: "On Sale".toUpperCase(),
                      color: Colors.red,
                      size: 22,
                      isTitle: true,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      IconlyLight.discount,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
              Flexible(
                child: SizedBox(
                  height: size.height * 0.24,
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return OnSaleWidget();
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
