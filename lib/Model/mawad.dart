import 'package:quizmoon/Model/question.dart';

import '../Controller/qst2.dart';

class Mawad {
  final name, qst;

  Mawad(
    this.name,
    this.qst,
  );
}

List<Mawad> listmwad = [
  Mawad(
    "اعلام الي ",
    qst_inf,
  ),
  Mawad(
    "انجليزية",
    qst_anglais,
  ),
  Mawad(
    "عربية",
    qst_arb,
  ),
  Mawad(
    " علوم الطيعة",
    qst_fzk,
  ),
  // Mawad("علوم", qst_fzk, qstinfocomplet),
  Mawad(
    "فيزياء",
    qst_fzk,
  ),
  // Mawad("فيزياء", qst_fzk, qstinfocomplet),
  Mawad(
    "اجتماعيات",
    qst_ijtm,
  ),
  Mawad(
    "رياضيات",
    qst_math,
  ),
  // Mawad("رياضيات", qst_math, qstinfocomplet),
];

int info = 0,
    math = 0,
    ijtm = 0,
    ingl = 0,
    fr = 0,
    fzk = 0,
    arb = 0,
    thg = 0,
    sm = 0;

var listscr = [
  info, ingl, arb, ijtm, math,
  sm, fzk
// ijtm, math, thg,
];
