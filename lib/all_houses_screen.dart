import 'package:flutter/material.dart';
import 'package:rumah/page/all_houses/mobile_view.dart';
import 'package:rumah/page/all_houses/web_view.dart';
import 'package:rumah/template/colors.dart';

class AllHouses extends StatelessWidget {
  const AllHouses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          backgroundColor: backGroundColor,
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth <= 600) {
                return const MobileViewAllHouses();
              } else if (constraints.maxWidth <= 900) {
                return const MobileViewAllHouses();
              } else if (constraints.maxWidth <= 1200) {
                return const WebViewAllHouses(gridCount: 2);
              } else {
                return const WebViewAllHouses(gridCount: 3);
              }
            },
          ),
        );
      },
    );
  }
}

