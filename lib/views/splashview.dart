import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bioproject/views/Homeview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 8), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return const HomeView();
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox.expand(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: Image.asset(
                "assets/photes/biofomatices.jpg",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: 300.0,
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 50.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Caveat',
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText("BioinFormatices"),
                    TypewriterAnimatedText(
                        'Under Supervised :Eng/mohamed Hakim'),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
