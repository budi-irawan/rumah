import 'package:flutter/material.dart';
import 'package:rumah/list_all.dart';
import 'package:rumah/template/colors.dart';

class MobileViewLoginPage extends StatefulWidget {
  const MobileViewLoginPage({super.key});

  @override
  State<MobileViewLoginPage> createState() => _MobileViewLoginPageState();
}

class _MobileViewLoginPageState extends State<MobileViewLoginPage> {
  final _satu = TextEditingController();
  bool hide = true;

  @override
  void dispose() {
    _satu.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: buttonColor1,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 40, left: 40),
              child: Text(
                "Selamat \nDatang",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              margin: EdgeInsets.only(top: height * 0.45),
              width: double.infinity,
              height: 450,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Silahkan Masuk",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: _satu,
                    decoration: const InputDecoration(
                      hintText: "Masukkan nama anda",
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: ElevatedButton(
                        style: TextButton.styleFrom(
                            backgroundColor: buttonColor1,
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 60)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ListAll(satu: _satu.text)));
                        },
                        child: const Text("Sign In")),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

