import 'package:blood_donation_app/ui/auth/splash_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashScreenViewModel>(
        init: SplashScreenViewModel(),
        builder: (controller) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'Assets/Images/logo.jpg',
                    width: controller.animation.value * 200,
                    height: controller.animation.value * 200,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
