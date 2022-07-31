import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:rumah/favorite_button.dart';
import 'package:rumah/model/data_rumah.dart';
import 'package:rumah/template/border.dart';
import 'package:rumah/template/colors.dart';
import 'package:rumah/template/text_styles.dart';

class DetailScreen extends StatelessWidget {
  final DataRumah rumah;
  const DetailScreen({Key? key, required this.rumah}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return DetailWebPage(rumah: rumah);
        } else {
          return DetailMobilePage(rumah: rumah);
        }
      },
    );
  }
}

class DetailMobilePage extends StatelessWidget {
  final DataRumah rumah;
  const DetailMobilePage({Key? key, required this.rumah}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              width: width,
              height: height,
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    rumah.gambarProfil,
                    width: width,
                    height: height * 0.5,
                    fit: BoxFit.cover,
                  ),
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: height * 0.05,
                        horizontal: width * 0.03,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(width * 0.01),
                            decoration: BoxDecoration(
                                borderRadius:
                                    getBorderRadiusWidget(context, 0.04),
                                color: Colors.white38),
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(width * 0.01),
                            decoration: BoxDecoration(
                                borderRadius:
                                    getBorderRadiusWidget(context, 0.04),
                                color: Colors.white38),
                            child: const FavoriteButton(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: width,
                      height: height * 0.55,
                      decoration: BoxDecoration(
                        color: darkColorDetail,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(width * 0.08),
                          topRight: Radius.circular(width * 0.08),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.05,
                        vertical: height * 0.02,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      rumah.nama,
                                      style: textStyle1,
                                    )
                                  ],
                                ),
                                ...rumah.galeriGambar
                                    .map((e) => ClipRRect(
                                      borderRadius: getBorderRadiusWidget(
                                          context, 0.04),
                                      child: Image.asset(
                                        e,
                                        height: height * 0.13,
                                        width: width * 0.16,
                                        fit: BoxFit.cover,
                                      ),
                                    ))
                                    .toList()
                              ],
                            ),
                            SizedBox(height: height * 0.03),
                            const Text(
                              'Description',
                              style: textStyle5,
                            ),
                            Text(
                              rumah.deskripsi,
                              style: textStyle7a,
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(height: height * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Price',
                                      style: textStyle7,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          rumah.harga,
                                          style: textStyle2,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: height * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    MotionToast.success(
                                      title: const Text(
                                        'Sukses',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      description: const Text(
                                        'Rumah pesanan anda akan segera kami proses.',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      layoutOrientation: ToastOrientation.rtl,
                                      animationType: AnimationType.fromRight,
                                      width: width,
                                      height: height * 0.2,
                                      position: MotionToastPosition.top,
                                      dismissable: true,
                                    ).show(context);
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(darkColor),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    elevation: MaterialStateProperty.all(15),
                                  ),
                                  child: const Text(
                                    'Book Now',
                                    style: textStyle3,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailWebPage extends StatelessWidget {
  final DataRumah rumah;
  const DetailWebPage({Key? key, required this.rumah}) : super(key: key);

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
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: width * 0.6,
              color: darkColorDetail,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Container(
                                padding: EdgeInsets.all(width * 0.01),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        spreadRadius: 3,
                                        blurRadius: 10,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius:
                                        getBorderRadiusWidget(context, 0.04),
                                    color: Colors.white38),
                                child: const FavoriteButton(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 3,
                                  blurRadius: 10,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ]),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                ),
                                child: Image.asset(rumah.gambarProfil),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            const Text(
                              'Description',
                              style: textStyle2,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              rumah.deskripsi,
                              style: textStyle7a,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              rumah.lokasi,
                              style: textStyle7a,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              rumah.harga,
                              style: textStyle5,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                MotionToast.success(
                                  title: const Text(
                                    'Sukses',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  description: const Text(
                                    'Rumah pesanan anda akan segera kami proses.',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  layoutOrientation: ToastOrientation.rtl,
                                  animationType: AnimationType.fromRight,
                                  width: width,
                                  height: height * 0.2,
                                  position: MotionToastPosition.top,
                                  dismissable: true,
                                ).show(context);
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(darkColor),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                elevation: MaterialStateProperty.all(15),
                              ),
                              child: const Text(
                                'Book Now',
                                style: textStyle3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            'Galeri Ruang',
                            style: textStyle2,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    children: [
                                      ...rumah.galeriGambar
                                          .map((e) => Container(
                                                margin: const EdgeInsets.all(5),
                                                width: width * 0.18,
                                                height: height * 0.15,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(e),
                                                      fit: BoxFit.cover),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.1),
                                                      spreadRadius: 3,
                                                      blurRadius: 10,
                                                      offset: const Offset(0,
                                                          3), // changes position of shadow
                                                    ),
                                                  ],
                                                ),
                                              ))
                                          .toList()
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

