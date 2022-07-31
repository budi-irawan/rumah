import 'package:flutter/material.dart';
import 'package:rumah/detail_screen.dart';
import 'package:rumah/model/data_rumah.dart';
import 'package:rumah/template/colors.dart';
import 'package:rumah/template/text_styles.dart';

class MobileViewRecommended extends StatelessWidget {
  const MobileViewRecommended({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBody: true,
      backgroundColor: backGroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.02),
                const Text(
                  'Paling direkomendasikan',
                  style: textStyle3,
                ),
                SizedBox(height: height * 0.02),
                ...listNewModel
                    .map((e) => InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DetailScreen(rumah: e);
                            }));
                          },
                          child: Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ]),
                            child: Card(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 100,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      e.gambarProfil),
                                                  fit: BoxFit.cover),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(width * 0.01),
                                                bottomLeft: Radius.circular(width * 0.01)
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  spreadRadius: 3,
                                                  blurRadius: 10,
                                                  offset: const Offset(0,
                                                      3), // changes position of shadow
                                                ),
                                              ]),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(e.nama, style: textStyle3),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const Icon(
                                                      Icons
                                                          .monetization_on_rounded,
                                                      color: Colors.grey),
                                                  const SizedBox(width: 10),
                                                  Text(
                                                    e.harga,
                                                    style: textStyle8,
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const Icon(
                                                    Icons.location_city,
                                                    color: Colors.grey,
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Text(
                                                    e.lokasi,
                                                    style: textStyle9,
                                                  )
                                                ],
                                              )
                                            ])),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ))
                    .toList(),
                SizedBox(height: height * 0.04)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

