import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quicklink/colors.dart';
import 'package:quicklink/logic/link_controller.dart';
import 'package:quicklink/screens/add_form.dart';
import 'package:quicklink/widgets/sidemenu.dart';
import '../widgets/home_links.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class Home extends StatefulWidget {
  static final route = "/";
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();

  @override
  void initState() {
    Provider.of<Links>(context, listen: false).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Todo: var provider = Provider.of<Links>(context, listen: false);
    return SideMenu(
      key: _sideMenuKey,
      background: ThemeColor.mainColor,
      menu: BuildMenu(),
      type: SideMenuType.shrinkNSlide, // check above images
      child: Scaffold(
        backgroundColor: ThemeColor.secondaryColor,
        appBar: AppBar(
          title: Text("Home"),
          centerTitle: true,
          elevation: 0,
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
          actions: [
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Addform(),
                ),
              ),
            ),
          ],
        ),
        body: Consumer<Links>(
          builder: (ctx, links, child) => links.isLoading
              ? Center(child: CircularProgressIndicator())
              : (links.links.isEmpty ? Alternative() : HomeLinkContainer()),
        ),
      ),
    );
  }
}

class Alternative extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 1.0,
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                  image: AssetImage('assets/undraw_empty_xct9.png'),
                  fit: BoxFit.fill),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.1),
                  blurRadius: 20,
                  spreadRadius: 1,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Quick links is empty',
              style: TextStyle(
                fontFamily: 'poppins',
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          FlatButton.icon(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Addform(),
              ),
            ),
            icon: Icon(Icons.add, color: Colors.white),
            label: Text(
              "Add Link",
              style: TextStyle(
                fontFamily: 'poppins',
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            color: ThemeColor.mainColor,
          )
        ],
      ),
    );
  }
}

