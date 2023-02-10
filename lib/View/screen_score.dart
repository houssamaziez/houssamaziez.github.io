import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizmoon/Controller/var.dart';
import 'package:quizmoon/View/screenLogo.dart';

import '../Model/mawad.dart';

class ScreenScore extends StatefulWidget {
  final int score;
  final name;
  const ScreenScore({super.key, required this.score, required this.name});

  @override
  State<ScreenScore> createState() => _ScreenScoreState();
}

class _ScreenScoreState extends State<ScreenScore> {
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

  _cond(name) {
    switch (name) {
      case "اعلام الي ":
        setState(() {
          info = widget.score;
        });
        break;
      case "انجليزية":
        setState(() {
          ingl = widget.score;
        });
        break;
      case "عربية":
        setState(() {
          arb = widget.score;
        });
        break;
      case " علوم الطيعة":
        setState(() {
          sm = widget.score;
        });
        break;

      case "فرنسية":
        setState(() {
          fr = widget.score;
        });
        break;
      case "اجتماعيات":
        setState(() {
          ijtm = widget.score;
        });
        break;
      case "رياضيات":
        setState(() {
          math = widget.score;
        });
        break;

      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    _cond(widget.name);

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
              Column(
                children: [
                  const SizedBox(
                    width: double.infinity,
                    height: 80,
                  ),
                  LogoZoomInAnimation(),
                  const Spacer(),
                  Text(
                    widget.score.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 200,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.name.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 100,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 49, left: 20),
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset("images/backoff.png")),
              ),
            ],
          )),
    );
  }
}

var listmodupoint = [];
