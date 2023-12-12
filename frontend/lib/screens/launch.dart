import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:projecto/screens/onboard.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.gif(
      useImmersiveMode: true,
      gifPath: 'assets/coffee.jpg',
      gifWidth: MediaQuery.of(context).size.width,
      gifHeight: MediaQuery.of(context).size.height,
      nextScreen: const Onboard(),
      duration: const Duration(milliseconds: 3515),
    );
  }
}
