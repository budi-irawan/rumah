import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rumah/detail_screen.dart';
import 'package:rumah/model/data_rumah.dart';
import 'package:rumah/template/border.dart';
import 'package:rumah/template/colors.dart';
import 'package:rumah/template/text_styles.dart';

class MobileView extends StatelessWidget {
  final String satu;

  const MobileView({Key? key, required this.satu}) : super(key: key);

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
                SizedBox(height: height * 0.03),
                Container(
                  width: width,
                  padding: const EdgeInsets.only(top: 3, bottom: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: buttonColor1,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ]),
                  child: Center(
                    child: Text(
                      'Selamat datang , $satu',
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),
                const Text(
                  'Paling direkomendasikan',
                  style: textStyle3,
                ),
                SizedBox(height: height * 0.02),
                SizedBox(
                  width: width,
                  height: height * 0.45,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...listNewModel.map((e) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DetailScreen(rumah: e);
                            }));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: width * 0.04),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius:
                                      getBorderRadiusWidget(context, 0.04),
                                  child: Container(
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        spreadRadius: 3,
                                        blurRadius: 10,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ]),
                                    child: Image.asset(
                                      e.gambarProfil,
                                      width: width * 0.65,
                                      height: height * 0.45,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                                255, 36, 146, 236)
                                            .withOpacity(0.5),
                                        borderRadius: BorderRadius.only(
                                            bottomRight:
                                                Radius.circular(width * 0.04),
                                            bottomLeft:
                                                Radius.circular(width * 0.04))),
                                    padding: const EdgeInsets.all(10),
                                    alignment: Alignment.bottomCenter,
                                    width: width * 0.65,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  e.nama,
                                                  style: textStyle4,
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                RatingBar(
                                                    initialRating: 0,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    itemCount: 3,
                                                    itemSize: 30,
                                                    ratingWidget: RatingWidget(
                                                        full: const Icon(
                                                            Icons.star,
                                                            color: darkColor),
                                                        half: const Icon(
                                                          Icons.star_half,
                                                          color: darkColor,
                                                        ),
                                                        empty: const Icon(
                                                          Icons.star_outline,
                                                          color: darkColor,
                                                        )),
                                                    onRatingUpdate: (value) {
                                                      setState(() {});
                                                    }),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }).toList()
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),
                const Text(
                  'Semua Rumah',
                  style: textStyle3,
                ),
                SizedBox(height: height * 0.02),
                ...listDataRumah
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
                                                  topLeft: Radius.circular(
                                                      width * 0.01),
                                                  bottomLeft: Radius.circular(
                                                      width * 0.01)),
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

  void setState(Null Function() param0) {}
}

