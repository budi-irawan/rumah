import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rumah/about.dart';
import 'package:rumah/all_houses_screen.dart';
import 'package:rumah/carousel.dart';
import 'package:rumah/detail_screen.dart';
import 'package:rumah/model/data_rumah.dart';
import 'package:rumah/recommended_screen.dart';
import 'package:rumah/template/border.dart';
import 'package:rumah/template/colors.dart';
import 'package:rumah/template/text_styles.dart';

class ListAll extends StatelessWidget {
  final String satu;
  const ListAll({Key? key, required this.satu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth <= 600) {
                return MainNav(
                  satu: satu,
                );
              } else if (constraints.maxWidth <= 900) {
                return MainNav(
                  satu: satu,
                );
              } else if (constraints.maxWidth <= 1200) {
                return const Webview(gridCount: 2);
              } else {
                return const Webview(gridCount: 3);
              }
            },
          ),
        );
      },
    );
  }
}

class MainNav extends StatefulWidget {
  final String satu;
  const MainNav({Key? key, required this.satu}) : super(key: key);

  @override
  State<MainNav> createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  int index = 0;
  // final MobileView _mobileView = MobileView(satu: '${widget.satu}',);
  final MobileViewRecommended _mobileViewRecommended =
      const MobileViewRecommended();
  final MobileViewAllHouses _mobileViewAllHouses = const MobileViewAllHouses();
  final MobileViewAboutMe _mobileViewAboutMe = const MobileViewAboutMe();

  getSelectedWidget({required int index}) {
    switch (index) {
      case 0:
        return MobileView(
          // ignore: unnecessary_string_interpolations
          satu: '${widget.satu}',
        );
        // ignore: dead_code
        break;
      case 1:
        return _mobileViewRecommended;
        // ignore: dead_code
        break;
      case 2:
        return _mobileViewAllHouses;
        // ignore: dead_code
        break;
      case 3:
        return _mobileViewAboutMe;
        // ignore: dead_code
        break;
      default:
        return MobileView(
          // ignore: unnecessary_string_interpolations
          satu: '${widget.satu}',
        );
    }
  }

  Future exitDialog() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Apakah anda yakin ?'),
              content: const Text('Tekan Keluar untuk keluar dari aplikasi.'),
              actions: [
                OutlinedButton(
                    child: const Text('Keluar'),
                    onPressed: () {
                      SystemNavigator.pop();
                    }),
                OutlinedButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    }),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: buttonColor1,
      ),
      extendBody: true,
      backgroundColor: backGroundColor,
      body: Container(
        child: getSelectedWidget(index: index),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(
                  color: buttonColor1,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                  ),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          const AssetImage('assets/images/avatar2.jpeg'),
                      radius: width * 0.1,
                    ),
                    SizedBox(width: width * 0.04),
                    Text(
                      'Hello , ${widget.satu}',
                      style: textStyle7,
                    )
                  ],
                )),
            ListTile(
              leading: const Icon(
                Icons.exit_to_app,
                color: buttonColor1,
              ),
              title: const Text(
                'Logout',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                exitDialog();
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: buttonColor1,
        items: const [
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.recommend, size: 30, color: Colors.white),
          Icon(Icons.select_all, size: 30, color: Colors.white),
          Icon(Icons.person_outline, size: 30, color: Colors.white),
        ],
        index: index,
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
      ),
    );
  }
}

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
                  height: height * 0.05,
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
                  height: height * 0.4,
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
                                    alignment: Alignment.bottomCenter,
                                    width: width * 0.65,
                                    height: height * 0.12,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: width * 0.02,
                                          vertical: height * 0.02),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                e.nama,
                                                style: textStyle2,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
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
                    .map((e) => Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: darkColor,
                              borderRadius:
                                  getBorderRadiusWidget(context, 0.01),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 3,
                                  blurRadius: 10,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ]),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DetailScreen(rumah: e);
                              }));
                            },
                            child: Stack(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: width * 0.3,
                                      height: height * 0.125,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(e.gambarProfil),
                                              fit: BoxFit.cover),
                                          borderRadius: getBorderRadiusWidget(
                                              context, 0.01),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.1),
                                              spreadRadius: 3,
                                              blurRadius: 10,
                                              offset: const Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ]),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(e.nama, style: textStyle3),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Icon(
                                                Icons.monetization_on_rounded,
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
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ))
                    .toList(),
                SizedBox(height: height * 0.02)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class Webview extends StatelessWidget {
//   final int gridCount;
//   const Webview({Key? key, required this.gridCount}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     return SingleChildScrollView(
//       child: Center(
//         child: SizedBox(
//           width: width * 0.6,
//           height: height,
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(10),
//                     child: GridView.count(
//                                         crossAxisCount: gridCount,
//                                         children: [
//                                     ...listDataRumah
//                                         .map((e) => Container(
//                                               margin: const EdgeInsets.all(10),
//                                               padding: const EdgeInsets.all(10),
//                                               decoration: BoxDecoration(
//                                                   color: darkColor,
//                                                   borderRadius: getBorderRadiusWidget(
//                                                       context, 0.01),
//                                                   boxShadow: [
//                                                     BoxShadow(
//                                                       color:
//                                                           Colors.black.withOpacity(0.1),
//                                                       spreadRadius: 3,
//                                                       blurRadius: 10,
//                                                       offset: const Offset(0,
//                                                           3), // changes position of shadow
//                                                     ),
//                                                   ]),
//                                               child: InkWell(
//                                                 onTap: () {
//                                                   Navigator.push(context,
//                                                       MaterialPageRoute(
//                                                           builder: (context) {
//                                                     return DetailScreen(rumah: e);
//                                                   }));
//                                                 },
//                                                 child: Card(
//                                                   child: Column(
//                                                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                                                     children: [
//                                                       Expanded(
//                                                         child: Image.asset(
//                                                           e.gambarProfil,
//                                                           fit: BoxFit.cover,
//                                                         ),
//                                                       )
//                                                     ],
//                                                   ),
//                                                 )
//                                               ),
//                                             ))
//                                         .toList(),
//                                   ]),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class Webview extends StatelessWidget {
  final int gridCount;
  const Webview({Key? key, required this.gridCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: kIsWeb
          ? null
          : AppBar(
              title: const Text('Home'),
              backgroundColor: buttonColor1,
            ),
      backgroundColor: backGroundColor,
      body: Scrollbar(
        thumbVisibility: true,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Container(
              width: width * 0.6,
              decoration: BoxDecoration(color: darkColor, boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ]),
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
                    flex: 3,
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
                                              color:
                                                  Colors.black.withOpacity(0.1),
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
                                                            image: AssetImage(
                                                                e.gambarProfil),
                                                            fit: BoxFit.cover),
                                                        borderRadius:
                                                            getBorderRadiusWidget(
                                                                context, 0.01),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.1),
                                                            spreadRadius: 3,
                                                            blurRadius: 10,
                                                            offset: const Offset(
                                                                0,
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
                                                      CrossAxisAlignment.start,
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
                                                            color: Colors.grey),
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
