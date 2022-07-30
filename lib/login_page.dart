import 'package:flutter/material.dart';
import 'package:rumah/list_all.dart';
import 'package:rumah/template/colors.dart';

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

class MobileViewLoginPage extends StatefulWidget {
  const MobileViewLoginPage({super.key});

  @override
  State<MobileViewLoginPage> createState() => _MobileViewLoginPageState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MobileViewLoginPageState extends State<MobileViewLoginPage> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final TextEditingController _satu = TextEditingController();
  bool hide = true;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    TextEditingController().dispose();
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
                "Welcome \nBack",
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
                    "Sign In",
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: _satu,
                    decoration: const InputDecoration(
                      hintText: "Your Name",
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

class WebViewLoginPage extends StatefulWidget {
  const WebViewLoginPage({super.key});

  @override
  State<WebViewLoginPage> createState() => _WebViewLoginPageState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _WebViewLoginPageState extends State<WebViewLoginPage> {
  final TextEditingController _satu = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    TextEditingController().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 10,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ]),
          width: width * 0.5,
          child: Stack(
            children: [
              Container(
                width: width,
                height: height,
                color: buttonColor1,
                child: const Padding(
                  padding: EdgeInsets.only(top: 40, left: 40),
                  child: Text(
                    "Selamat \nDatang",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                margin: EdgeInsets.only(top: height * 0.45),
                width: double.infinity,
                height: 450,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(50))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sign In",
                      style:
                          TextStyle(fontSize: 45, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: _satu,
                      decoration: const InputDecoration(
                        hintText: "Your Name",
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
                                  vertical: 8, horizontal: 80)),
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
      ),
    );
  }
}
