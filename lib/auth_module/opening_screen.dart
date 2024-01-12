import 'package:blood_donation_app/auth_module/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OpeningScreen extends StatelessWidget {
  const OpeningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        color: Colors.transparent,
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 80,
              child: Image.asset(
                'Assets/Images/logo.jpg'
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 40,
              width: 280,
              child: ElevatedButton(
                onPressed: (){
                  Get.to( LoginScreen());
                }, 
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))
                    )
                  )
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.red,
                    fontFamily: 'Inter'
                  ),
                )
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              width: 280,
              child: ElevatedButton(
                onPressed: (){}, 
                style: const ButtonStyle(                  
                  backgroundColor: MaterialStatePropertyAll(Colors.red),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))
                    )
                  )
                ),
                child: const Text(
                  'Join Us',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter'
                  ),
                )
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
              child: Text(
                'By creating an account, you agree to the Terms of use ard Privacy Policy.',
                textAlign: TextAlign.center,
                maxLines: 3,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Inter'
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}