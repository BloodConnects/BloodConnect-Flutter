import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookSignInProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithFacebook() async {
    try {
      // Trigger Facebook Sign In
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Check if the login was successful
      if (loginResult.status == LoginStatus.success) {
        // Get access token
        final AccessToken accessToken = loginResult.accessToken!;

        // Create FacebookAuthCredential using the obtained token
        final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(accessToken.token);

        // Sign in with Firebase using FacebookAuthCredential
        final UserCredential authResult = await _auth.signInWithCredential(facebookAuthCredential);
        final User? user = authResult.user;

        return user;
      } else {
        print('Facebook Sign-In failed: ${loginResult.status}');
        return null;
      }
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<void> signOut() async {
    await FacebookAuth.instance.logOut();
    await _auth.signOut();
  }
}
