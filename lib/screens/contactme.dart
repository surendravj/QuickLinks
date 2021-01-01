import 'package:flutter/material.dart';
import 'package:quicklink/widgets/contact_me.dart';
import 'package:quicklink/widgets/sidemenu.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import '../colors.dart';

class ContactPage extends StatelessWidget {
  static final route = "/contact";
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  @override
  Widget build(BuildContext context) {
    return SideMenu(
      key: _sideMenuKey,
      background: ThemeColor.mainColor,
      menu: BuildMenu(),
      type: SideMenuType.shrinkNSlide,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Contact Me"),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              final _state = _sideMenuKey.currentState;
              if (_state.isOpened)
                _state.closeSideMenu(); // close side menu
              else
                _state.openSideMenu(); // open side menu
            },
          ),
        ),
        body: ContactMe(),
      ),
    );
  }
}
