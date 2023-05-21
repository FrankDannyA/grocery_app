import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../services/utils.dart';
import '../widgets/feed_items.dart';
import '../widgets/text_widget.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({Key? key}) : super(key: key);
  static const routeName = "/FeedsScreenState";
  @override
  _FeedsScreenState createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  final TextEditingController? _searchController = TextEditingController();
  final FocusNode _searchTextFocusNode = FocusNode();

  @override
  void dispose() {
    _searchTextFocusNode.dispose();
    _searchController!.dispose();
    super.dispose();
  }

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: kBottomNavigationBarHeight,
                child: TextField(
                  focusNode: _searchTextFocusNode,
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.greenAccent,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.greenAccent,
                        width: 1,
                      ),
                    ),
                    hintText: "What's in your mind?",
                    prefixIcon: const Icon(Icons.search),
                    suffix: IconButton(
                      icon: Icon(
                        Icons.close,
                        color:
                            _searchTextFocusNode.hasFocus ? Colors.red : color,
                      ),
                      onPressed: () {
                        _searchController!.clear();
                        _searchTextFocusNode.unfocus();
                      },
                    ),
                  ),
                ),
              ),
            ),
            GridView.count(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: size.width / (size.height * 0.6),
              children: List.generate(10, (index) {
                return FeedItems();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
