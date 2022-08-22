import 'dart:math';
import 'package:flutter/services.dart' show rootBundle;

Future<String> loadAsset() async {
  String stringtolist = await rootBundle.loadString("assets/punishment");
  int randomNumber = Random().nextInt(126);
  return stringtolist.split("\n")[randomNumber].replaceAll(",", "");
}

Future<String> getPositins() async {
  String stringtolist =
      await rootBundle.loadString("assets/Database/Positions/Positions");
  int randomNumber = Random().nextInt(106);
  return stringtolist.split("\n")[randomNumber].replaceAll(",", "");
}

Future<String> getAction() async {
  String stringtolist =
      await rootBundle.loadString("assets/Database/Actions/Actions");
  int randomNumber = Random().nextInt(5);
  return stringtolist.split("\n")[randomNumber].replaceAll(",", "");
}

Future<String> getToy() async {
  String stringtolist =
      await rootBundle.loadString("assets/Database/toys/toys");
  int randomNumber = Random().nextInt(134);
  return stringtolist.split("\n")[randomNumber].replaceAll(",", "");
}

Future<String> getRegulation() async {
  String stringtolist = await rootBundle
      .loadString("assets/Database/Regulations/Regulations.txt");
  int randomNumber = Random().nextInt(24);
  return stringtolist.split("\n")[randomNumber].replaceAll(",", "");
}

Future<String> getRule() async {
  String stringtolist =
      await rootBundle.loadString("assets/Database/Rules/rules");
  int randomNumber = Random().nextInt(19);
  return stringtolist.split("\n")[randomNumber].replaceAll(",", "");
}
