import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  final TextEditingController _controller = TextEditingController(text: "");

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //user info
                Text.rich(
                  TextSpan(
                    text: "Hi,    ",
                    style: const TextStyle(
                      color: Colors.cyan,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: "My Name",
                        style: TextStyle(
                          color: color,
                          fontSize: 27,
                          fontWeight: FontWeight.normal,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("My name is TAPPED!");
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextWidget(
                  text: "email123@email.com",
                  color: color,
                  size: 18,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 20,
                ),

                //user methods
                _listTile(
                  color: color,
                  title: "Address",
                  iconData: IconlyLight.profile,
                  subtitle: "Subtitle here",

                  //aller dialog method
                  onPress: () async {
                    await _showAddressDialog();
                  },
                ),
                _listTile(
                  color: color,
                  title: "Orders",
                  iconData: IconlyLight.bag,
                  onPress: () {},
                ),
                _listTile(
                  color: color,
                  title: "Wishlist",
                  iconData: IconlyLight.heart,
                  onPress: () {},
                ),
                _listTile(
                  color: color,
                  title: "Viewed",
                  iconData: IconlyLight.show,
                  onPress: () {},
                ),
                _listTile(
                  color: color,
                  title: "Forget Password",
                  iconData: IconlyLight.unlock,
                  onPress: () {},
                ),

                //swith light / dark themes
                SwitchListTile(
                  //TODO: Изменить цвет переключателя
                  secondary: Icon(
                    themeState.getDarkTheme
                        ? Icons.dark_mode_outlined
                        : Icons.light_mode_outlined,
                  ),
                  title: TextWidget(
                    color: color,
                    size: 18,
                    text: "Theme",
                    isTitle: true,
                  ),
                  onChanged: (bool value) {
                    setState(() {
                      themeState.setDarkTheme = value;
                    });
                  },
                  value: themeState.getDarkTheme,
                ),
                _listTile(
                  color: color,
                  title: "Logout",
                  iconData: IconlyLight.logout,
                  onPress: () async {
                    await _showLogoutDialog();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //methods

  Future<void> _showLogoutDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Image.asset(
                "assets/images/warning-sign.png",
                height: 20,
                width: 20,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: 5,
              ),
              const Text("Sign out"),
            ],
          ),
          content: const Text("Do you want sign out?"),
          actions: [
            TextButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: TextWidget(
                text: "Cancel",
                color: Colors.cyan,
                size: 18,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: TextWidget(
                text: "OK",
                color: Colors.red,
                size: 18,
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showAddressDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Update Address"),
          content: TextField(
            onChanged: (value) {
              _controller.text;
            },
            controller: _controller,
            maxLines: 5,
            decoration: const InputDecoration(
              hintText: "Your address",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text("Update"),
            )
          ],
        );
      },
    );
  }

  Widget _listTile({
    required Color color,
    required String title,
    String? subtitle,
    required IconData iconData,
    required Function onPress,
  }) {
    return ListTile(
      title: TextWidget(
        color: color,
        size: 18,
        text: title,
        isTitle: true,
      ),
      subtitle: Text(subtitle ?? ""),
      leading: Icon(iconData),
      trailing: const Icon(Icons.keyboard_arrow_right_outlined),
      onTap: () {
        onPress();
      },
    );
  }
}
