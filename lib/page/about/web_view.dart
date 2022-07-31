import 'package:flutter/material.dart';
import 'package:rumah/template/border.dart';
import 'package:rumah/template/text_styles.dart';

import '../../template/colors.dart';

class AboutWeb extends StatelessWidget {
  const AboutWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBody: true,
      backgroundColor: backGroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: width,
                    height: height * 0.6,
                    decoration: BoxDecoration(
                      color: darkColor,
                      borderRadius: getBorderRadiusWidget(context, 0.02),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              child: CircleAvatar(
                                backgroundImage: const AssetImage(
                                    'assets/images/avatar.jpeg'),
                                radius: width * 0.1,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'Budi Irawan',
                                style: textStyle3,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'irawanalkarim@gmail.com',
                                style: textStyle8,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: height * 0.2),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.06,
                            vertical: height * 0.02,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: getBorderRadiusWidget(context, 8),
                              color: buttonColor1),
                          child: const Text(
                            'Contact Me',
                            style: textStyle7,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
