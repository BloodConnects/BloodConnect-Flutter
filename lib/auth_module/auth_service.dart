// import 'package:blood_donation_app/auth_module/verification_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<void> verifyPhoneNumber(String phoneNumber) async {
//     await _auth.verifyPhoneNumber(
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         await _auth.signInWithCredential(credential);
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         print('Verificaation Failed: ${e.message}');
//       },
//       codeSent: (String verificationId, int? resendToken) {
//         Get.to(
//           VerificaationScreen(),
//         );
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {
//         print('Auto-Retrieval Timeout');
//       },
//       timeout: const Duration(
//         minutes: 1,
//       ),
//     );
//   }

//   Future<void> signInWithPhoneNumber(
//       String smsCode, String verificationId) async {
//     PhoneAuthCredential credential = PhoneAuthProvider.credential(
//       verificationId: verificationId,
//       smsCode: smsCode,
//     );
//     await _auth.signInWithCredential(credential);
//   }
// }
