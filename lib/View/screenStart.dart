import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:quizmoon/Controller/var.dart';
import 'package:quizmoon/View/screenQuiz.dart';
import 'package:quizmoon/View/screen_score.dart';
import 'package:quizmoon/View/table.dart';

import '../Model/mawad.dart';

class ScreenStart extends StatefulWidget {
  const ScreenStart({super.key});

  @override
  State<ScreenStart> createState() => _ScreenStartState();
}

class _ScreenStartState extends State<ScreenStart> {
  @override
  void initState() {
    setState(() {});
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
            image: DecorationImage(
                image: AssetImage(
                  "images/back2.png",
                ),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      for (var i = 0; i < listmwad.length; i++)
                        ModuleButton(
                          title: listmwad[i].name,
                          scr: listscr[i],
                          function: () {
                            setState(() {
                              cunt = 0;
                            });
                            Get.to(ScreenQuiz(
                                mape: listmwad[i].qst, name: listmwad[i].name));
                          },
                        ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 49, left: 20),
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset("images/backoff.png")),
              ),
              Positioned(
                  right: 10,
                  top: 49,
                  child: InkWell(
                    onTap: () {
                      if (kIsWeb) {
                        // code for web in flutter
                        Get.to(const ScreenClassment());
                      } else {
                        // code for android
                        Get.to(ScreenScore(
                          score: score,
                          name: "المجموع الكلى",
                        ));
                      }
                    },
                    child: Image.asset(
                      'images/scorelogo.png',
                      height: 40,
                    ),
                  ))
            ],
          ),
        ));
  }
}

class ModuleButton extends StatelessWidget {
  const ModuleButton({
    Key? key,
    this.title,
    this.function,
    required this.scr,
  }) : super(key: key);
  final title, function, scr;
  reurnscr(name) {
    switch (name) {
      case "اعلام الي ":
        return info;
        break;
      case "انجليزية":
        return ingl;

        break;
      case "عربية":
        return arb;
        break;
      case " علوم الطيعة":
        return fr;
        break;

      case "فرنسية":
        return fzk;
        break;
      case "اجتماعيات":
        return ijtm;
        break;
      case "رياضيات":
        return math;
      case "فيزياء":
        return math;
        break;

      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        onTap: reurnscr(title) != 0 ? () {} : function,
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width * 0.66,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    reurnscr(title) >= 5
                        ? "images/button3.png"
                        : (reurnscr(title) < 5 && reurnscr(title) > 0
                            ? "images/button2.png"
                            : "images/button1.png"),
                  ),
                  fit: BoxFit.fill)),
          child: Center(
            child: Row(
              children: [
                Spacer(),
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                ),
                reurnscr(title) != 0 ? Spacer() : Container(),
                reurnscr(title) != 0
                    ? Text(
                        reurnscr(title).toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 25),
                      )
                    : Container(),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
