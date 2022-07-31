import 'package:flutter/material.dart';
import 'package:rumah/page/recommended/mobile_view.dart';
import 'package:rumah/page/recommended/web_view.dart';
import 'package:rumah/template/colors.dart';

class Recommended extends StatelessWidget {
  final String satu;
  const Recommended({Key? key, required this.satu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          backgroundColor: backGroundColor,
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth <= 600) {
                return const MobileViewRecommended();
              } else if (constraints.maxWidth <= 900) {
                return const MobileViewRecommended();
              } else if (constraints.maxWidth <= 1200) {
                return const WebViewRecommended(gridCount: 2);
              } else {
                return const WebViewRecommended(gridCount: 3);
              }
            },
          ),
        );
      },
    );
  }
}

