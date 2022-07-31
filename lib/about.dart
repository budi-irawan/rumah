import 'package:flutter/material.dart';
import 'package:rumah/page/about/mobile_view.dart';
import 'package:rumah/page/about/web_view.dart';
import 'package:rumah/template/colors.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          backgroundColor: backGroundColor,
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth <= 600) {
                return const MobileViewAboutMe();
              } else if (constraints.maxWidth <= 900) {
                return const MobileViewAboutMe();
              } else if (constraints.maxWidth <= 1200) {
                return const AboutWeb();
              } else {
                return const AboutWeb();
              }
            },
          ),
        );
      },
    );
  }
}

