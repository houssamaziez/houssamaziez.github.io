import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:quizmoon/Controller/var.dart';
import 'package:quizmoon/View/screenLogo.dart';
import 'package:quizmoon/View/screen_score.dart';

class ScreenQuiz extends StatefulWidget {
  const ScreenQuiz({super.key, required this.mape, required this.name});
  final mape, name;

  @override
  State<ScreenQuiz> createState() => _ScreenQuizState();
}

class _ScreenQuizState extends State<ScreenQuiz> {
  var data;
  @override
  void initState() {
    cunt = 0;
    data = widget.mape;
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  var color2 = const Color.fromARGB(255, 75, 75, 75);

  var color1 = const Color.fromARGB(255, 133, 133, 133);
  int q1 = 0, q2 = 0, q3 = 0, q4 = 0;
  final CountDownController controller = CountDownController();
  late int time = 600;
  bool isselct1 = false;
  bool isselct2 = false;
  bool isselct3 = false;
  bool isselct4 = false;
  bool isclick = false;
  int indextmap = 0;
  @override
  Widget build(BuildContext context) {
    isclick == true
        ? Timer(const Duration(seconds: 2), () {
            if (data[indextmap]["id"] == 1) {
              Get.off(ScreenScore(score: cunt, name: widget.name));
            } else {
              setState(() {
                indextmap++;
                isclick = false;
                isselct1 = false;
                q1 = 0;
                q2 = 0;
                q3 = 0;
                q4 = 0;
                isselct2 = false;
                isselct3 = false;
                isselct4 = false;
                isclick = false;
              });
            }
          })
        : () {};
    return WillPopScope(
      onWillPop: () {
        Get.off(ScreenScore(score: cunt, name: widget.name));
        return Future.value(true);
      },
      child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "images/back2.png",
                  ),
                  fit: BoxFit.fitWidth)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.30),
                    child: Center(child: LogoZoomInAnimation()),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 36,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        appbar(context, indextmap),
                        Spacer(),
                        qst(name: data[indextmap]["question"]),
                        const Spacer(
                          flex: 1,
                        ),
                        rpns(
                            options: data[indextmap]["options"],
                            answer_index: data[indextmap]["answer_index"]),
                        const Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Column rpns({required options, required answer_index}) {
    return Column(
      children: [
        Row(
          children: [
            RpnsButton(
              isclick: isclick,
              isselct: isselct2,
              title: options[1],
              indext: 1,
              rpnsindext: answer_index,
              function: () {
                setState(() {
                  isclick = true;

                  q2 = answer_index;
                  isselct2 = true;
                });
              },
            ),
            RpnsButton(
              isclick: isclick,
              isselct: isselct1,
              title: options[0],
              indext: 0,
              rpnsindext: answer_index,
              function: () {
                setState(() {
                  isclick = true;
                  q1 = answer_index;
                  isselct1 = true;
                });
              },
            ),
          ],
        ),
        Row(
          children: [
            RpnsButton(
              isselct: isselct3,
              title: options[2],
              indext: 2,
              rpnsindext: answer_index,
              function: () {
                setState(() {
                  isclick = true;

                  q3 = answer_index;
                  isselct3 = true;
                });
              },
              isclick: isclick,
            ),
            RpnsButton(
              isclick: isclick,
              isselct: isselct4,
              title: options[3],
              indext: 3,
              rpnsindext: answer_index,
              function: () {
                setState(() {
                  isclick = true;

                  q4 = answer_index;
                  isselct4 = true;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Padding qst({name}) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Text(
        name,
        style: const TextStyle(color: Colors.white, fontSize: 30),
        textAlign: TextAlign.center,
      ),
    );
  }

  Row appbar(BuildContext context, numdeqst) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 0, left: 20),
          child: InkWell(
              onTap: () {
                Get.off(ScreenScore(score: cunt, name: widget.name));
                SystemChrome.setPreferredOrientations([
                  // DeviceOrientation.landscapeRight,
                  // DeviceOrientation.landscapeLeft,
                  DeviceOrientation.portraitUp,
                  DeviceOrientation.portraitDown,
                ]);
              },
              child: Image.asset("images/backoff.png")),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Text(
            number[numdeqst],
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height * 0.088,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            height: 60,
            width: 60,
            child: NeonCircularTimer(
                onComplete: () {
                  setState(() {
                    color1 = Colors.red;
                    color2 = Colors.red;
                    Get.off(ScreenScore(
                      score: cunt,
                      name: widget.name,
                    ));
                  });
                  // controller.restart();
                },
                width: 50,
                controller: controller,
                duration: time,
                strokeWidth: 2,
                isTimerTextShown: true,
                neumorphicEffect: true,
                outerStrokeColor: Colors.grey.shade100,
                innerFillGradient: LinearGradient(colors: [color1, color2]),
                neonGradient: LinearGradient(colors: [
                  const Color.fromARGB(255, 105, 217, 240).withOpacity(0),
                  Colors.blueAccent.shade400.withOpacity(0)
                ]),
                strokeCap: StrokeCap.round,
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
                innerFillColor: Colors.white,
                backgroudColor: Colors.grey.shade100.withOpacity(0),
                neonColor: Colors.blue.shade900),
          ),
        ),
      ],
    );
  }
}

class RpnsButton extends StatefulWidget {
  const RpnsButton({
    Key? key,
    required this.title,
    required this.function,
    required this.indext,
    required this.rpnsindext,
    required this.isselct,
    required this.isclick,
  }) : super(key: key);
  final title, function, indext, rpnsindext, isselct, isclick;

  @override
  State<RpnsButton> createState() => _RpnsButtonState();
}

class _RpnsButtonState extends State<RpnsButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.19,
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                widget.isselct == false
                    ? "images/button1.png"
                    : (widget.rpnsindext != widget.indext
                        ? "images/button2.png"
                        : "images/button3.png"),
              ),
              fit: BoxFit.contain)),
      child: Center(
        child: InkWell(
          onTap: widget.isclick == false
              ? () async {
                  // if (await Vibrate.canVibrate) {
                  //   Vibrate.vibrate();
                  // }
                  widget.function();
                  addscore(widget.rpnsindext == widget.indext);
                }
              : () {},
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.10,
            width: MediaQuery.of(context).size.width * 0.33,
            child: Center(
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.02),
              ),
            ),
          ),
        ),
      ),
    );
  }

  addscore(vale) {
    if (vale == true) {
      setState(() {
        score = score + 1;

        cunt++;
      });
    }
  }
}

int cunt = 0;
