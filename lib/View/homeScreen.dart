import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quizmoon/View/screenStart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      // DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage(
                  "images/back2.png",
                ),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const Spacer(),
              SizedBox(
                width: double.infinity,
              ),
              Center(
                child: Container(
                  width: 200,
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "images/LOGOApp-.png",
                          ),
                          fit: BoxFit.contain)),
                ),
              ),
              const Spacer(),
              const Spacer(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Mybutton(
                color: Color.fromARGB(255, 177, 30, 165),
                title: "Play Now",
                fucton: () {
                  Get.to(const ScreenStart());
                },
              ),
              const Spacer(),
            ],
          ),
        ));
  }
}

class Mybutton extends StatelessWidget {
  const Mybutton({
    Key? key,
    required this.color,
    required this.title,
    required this.fucton,
  }) : super(key: key);
  final color, title, fucton;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fucton,
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.08,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
