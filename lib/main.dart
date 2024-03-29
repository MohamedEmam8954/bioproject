import 'package:bioproject/services/bioservices.dart';

import 'package:bioproject/views/splashview.dart';
import 'package:flutter/material.dart';

// "ABAAABCDBBABCDDEBCABC"
//"ABC"
//boyer moore
//ATGTGTG
//CATGTG
void main() {
  BioServices().verifiyDna(Sequence: "GCUA");
  runApp(const BioApp());
}

class BioApp extends StatelessWidget {
  const BioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
