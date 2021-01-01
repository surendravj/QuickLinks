import 'package:flutter/material.dart';
import 'package:quicklink/screens/contactme.dart';
import 'package:quicklink/screens/home.dart';

class BuildMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        height: MediaQuery.of(context).size.height * 1.0,
        width: double.infinity,
        color: Colors.transparent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MenuItem("Home", Icons.home, Home.route),
              MenuItem("Links", Icons.link, null),
              MenuItem("Categories", Icons.category, null),
              MenuItem("Contact Me", Icons.contact_page, ContactPage.route),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MenuItem extends StatelessWidget {
  String _text;
  IconData _iconData;
  String _widgetRoute;

  MenuItem(this._text, this._iconData, this._widgetRoute);

  @override
  Widget build(BuildContext context) {
    navigatePage() {
      Navigator.pushNamed(context, _widgetRoute);
    }

    return GestureDetector(
      onTap: navigatePage,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        child: Row(
          children: [
            Icon(
              _iconData,
              color: Colors.white,
              size: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _text,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
