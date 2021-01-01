import 'package:flutter/material.dart';
import 'package:quicklink/colors.dart';
import 'package:slimy_card/slimy_card.dart';

class ContactMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 1.0,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: SlimyCard(
              color: ThemeColor.mainColor,
              width: MediaQuery.of(context).size.width * 0.9,
              topCardHeight: 300,
              bottomCardHeight: 100,
              borderRadius: 15,
              topCardWidget: topCardWidget(
                  'https://dt2sdf0db8zob.cloudfront.net/wp-content/uploads/2019/12/9-Best-Online-Avatars-and-How-to-Make-Your-Own-for-Free-image1-5.png'),
              bottomCardWidget: bottomCardWidget(),
              slimeEnabled: true,
            ),
          ),
        ],
      ),
    );
  }
}

Widget topCardWidget(String imagePath) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(image: NetworkImage(imagePath)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              spreadRadius: 1,
            ),
          ],
        ),
      ),
      SizedBox(height: 15),
      Text(
        'Surendra Vadaparthy',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      SizedBox(height: 15),
      Text(
        'Freelancer Developer\n       Open to work',
        style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 12,
            fontWeight: FontWeight.w500),
      ),
      SizedBox(height: 10),
    ],
  );
}

Widget bottomCardWidget() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        '+919676258512',
        style: TextStyle(
          color: Colors.white.withOpacity(0.8),
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          'vadaparthysurendra@gmail.com',
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ],
  );
}
