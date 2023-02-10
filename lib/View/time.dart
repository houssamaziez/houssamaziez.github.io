import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';

class ScreenTime extends StatefulWidget {
  @override
  State<ScreenTime> createState() => _ScreenTimeState();
}

class _ScreenTimeState extends State<ScreenTime> {
  var color2 = const Color.fromARGB(255, 75, 75, 75);

  var color1 = const Color.fromARGB(255, 133, 133, 133);

  final CountDownController controller = CountDownController();
  late int time = 60;
  @override
  Widget build(BuildContext context) {
    // var controllerr= Get.put(ControllerHome());
// time=controllerr.numtime *time;

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage("images/bak.jpg"))),
      child: Scaffold(
          backgroundColor: Colors.grey.withOpacity(0),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NeonCircularTimer(
                        onComplete: () {
                          setState(() {
                            color1 = Colors.red;
                            color2 = Colors.red;
                            // Vibration.vibrate(duration: 1500);
                          });
                          // controller.restart();
                        },
                        width: 100,
                        controller: controller,
                        duration: time,
                        strokeWidth: 10,
                        isTimerTextShown: true,
                        neumorphicEffect: true,
                        outerStrokeColor: Colors.grey.shade100,
                        innerFillGradient:
                            LinearGradient(colors: [color1, color2]),
                        neonGradient: LinearGradient(colors: [
                          Color.fromARGB(255, 105, 217, 240).withOpacity(0),
                          Colors.blueAccent.shade400.withOpacity(0)
                        ]),
                        strokeCap: StrokeCap.round,
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        innerFillColor: Colors.white,
                        backgroudColor: Colors.grey.shade100.withOpacity(0),
                        neonColor: Colors.blue.shade900),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
