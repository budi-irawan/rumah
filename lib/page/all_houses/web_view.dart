import 'package:flutter/material.dart';
import 'package:rumah/carousel.dart';
import 'package:rumah/detail_screen.dart';
import 'package:rumah/model/data_rumah.dart';
import 'package:rumah/template/border.dart';
import 'package:rumah/template/colors.dart';
import 'package:rumah/template/text_styles.dart';

class WebViewAllHouses extends StatelessWidget {
  final int gridCount;
  const WebViewAllHouses({Key? key, required this.gridCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: darkColor,
      ),
      backgroundColor: backGroundColor,
      body: Scrollbar(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Container(
              color: darkColor,
              width: width * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Paling direkomendasikan',
                          style: textStyle3,
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height * 0.25,
                          width: width * 0.6,
                          child: const CarouselDemo(),
                        )
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Semua Rumah',
                          style: textStyle3,
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width * 0.6,
                          child: GridView
                              .count(crossAxisCount: gridCount, children: [
                            ...listDataRumah
                                .map((e) => Container(
                                      margin: const EdgeInsets.all(10),
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: darkColor,
                                          borderRadius: getBorderRadiusWidget(
                                              context, 0.01),
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
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return DetailScreen(rumah: e);
                                          }));
                                        },
                                        child: Stack(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    width: width,
                                                    height: height * 0.125,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(e
                                                                .gambarProfil),
                                                            fit:
                                                                BoxFit.cover),
                                                        borderRadius:
                                                            getBorderRadiusWidget(
                                                                context,
                                                                0.01),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors
                                                                .black
                                                                .withOpacity(
                                                                    0.1),
                                                            spreadRadius: 3,
                                                            blurRadius: 10,
                                                            offset: const Offset(0,
                                                                3), // changes position of shadow
                                                          ),
                                                        ]),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: height * 0.02,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                  children: [
                                                    Text(e.nama,
                                                        style: textStyle3),
                                                    SizedBox(
                                                      height: height * 0.02,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Icon(
                                                            Icons
                                                                .monetization_on_rounded,
                                                            color:
                                                                Colors.grey),
                                                        const SizedBox(
                                                            width: 10),
                                                        Text(
                                                          e.harga,
                                                          style: textStyle8,
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Icon(
                                                          Icons.location_city,
                                                          color: Colors.grey,
                                                        ),
                                                        const SizedBox(
                                                            width: 10),
                                                        Text(
                                                          e.lokasi,
                                                          style: textStyle9,
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ]),
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
