import 'package:flutter/material.dart';
import 'package:rumah/page/login_page/mobile_view.dart';
import 'package:rumah/page/login_page/web_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth <= 600) {
                return const MobileViewLoginPage();
              } else {
                return const WebViewLoginPage();
              }
            },
          ),
        );
      },
    );
  }
}

