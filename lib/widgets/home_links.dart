import 'package:flutter/material.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/services.dart';
import 'package:nice_button/NiceButton.dart';
import 'package:provider/provider.dart';
import 'package:quicklink/colors.dart';
import 'package:quicklink/logic/link_controller.dart';
import 'buttons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_share/flutter_share.dart';

class HomeLinkContainer extends StatefulWidget {
  @override
  _HomeLinkContainerState createState() => _HomeLinkContainerState();
}

class _HomeLinkContainerState extends State<HomeLinkContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1.0,
      width: double.infinity,
      padding: EdgeInsets.all(10.0),
      child: Consumer<Links>(
        builder: (ctx, links, child) => ListView.builder(
          itemBuilder: (context, index) => LinkCard(
            links.links[index],
          ),
          itemCount: links.links.length,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class LinkCard extends StatelessWidget {
  Link _link;
  LinkCard(this._link);
  final GlobalKey<ScaffoldState> _scaffold = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Links>(context, listen: false);
    return Padding(
      key: _scaffold,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          color: ThemeColor.mainColor,
        ),
        child: ExpansionCard(
          borderRadius: 20,
          leading: CircleAvatar(
            backgroundColor: ThemeColor.secondaryColor,
            child: Text(
              _link.count.toString(),
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
          ),
          title: Padding(
            padding: EdgeInsets.all(0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _link.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                  ),
                  child: Text(
                    _link.category,
                    style: TextStyle(
                      color: ThemeColor.secondaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  Buttons(Icons.share, () => share(_link.title, _link.url),
                      ThemeColor.shareColor),
                  Buttons(
                    Icons.open_in_browser_sharp,
                    () => _launchURL(_link.url,
                        () => provider.updateLink(_link.id), _scaffold),
                    ThemeColor.openColor,
                  ),
                  NiceButton(
                    width: 35,
                    mini: true,
                    icon: Icons.content_copy,
                    background: ThemeColor.editColor,
                    onPressed: () {
                      Clipboard.setData(
                        new ClipboardData(
                          text: _link.url,
                        ),
                      );
                      // ignore: deprecated_member_use
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Copied to Clipboard'),
                        ),
                      );
                    },
                    text: "",
                  ),
                  NiceButton(
                    width: 35,
                    mini: true,
                    icon: Icons.delete,
                    background: ThemeColor.deleteColor,
                    onPressed: () {
                      provider.removeLink(_link.id);
                      // ignore: deprecated_member_use
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Link succesfully deleted'),
                        ),
                      );
                    },
                    text: "",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

_launchURL(String link, Function function, var key) async {
  final url = link;
  if (await canLaunch(url)) {
    await launch(url);
    function();
  } else {
    key.currentState.showSnackBar(
      SnackBar(
        content: Text("Unable to open the link "),
      ),
    );
  }
}

share(String title, String url) async {
  await FlutterShare.share(
      title: 'QuickLinks',
      text: title,
      linkUrl: url,
      chooserTitle: 'Choose App');
}
