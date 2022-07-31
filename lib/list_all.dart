import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rumah/page/about/mobile_view.dart';
import 'package:rumah/page/all_houses/mobile_view.dart';
import 'package:rumah/page/list_all/mobile_view.dart';
import 'package:rumah/page/list_all/web_view.dart';
import 'package:rumah/page/recommended/mobile_view.dart';
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
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      color: Colors.white,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.asset('assets/images/question.png', width: width * 0.14, height: width * 0.14, ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                                'Apakah anda yakin akan keluar dari aplikasi ?',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      SystemNavigator.pop();
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              buttonColor1),
                                    ),
                                    child: const Text(
                                      'Keluar',
                                    )),
                                OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                          width: 1.0, color: Colors.blue),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop(false);
                                    },
                                    child: const Text('Batal')),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
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

