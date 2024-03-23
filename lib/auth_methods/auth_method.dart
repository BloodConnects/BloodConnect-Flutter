import 'package:firebase_auth/firebase_auth.dart';

class AuthMethod{
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<String> loginUser({
    required String phoneNumber,
    // required String countryCode,
  }) async{
    String res = 'Some error occured';

    try{
      if(phoneNumber.isNotEmpty ){
        await auth.signInWithPhoneNumber(phoneNumber);
        res = 'success';
      }else{
        res = 'please enter valid phone number';
      }
    }catch(err){
      res = err.toString();
    }
    return res;
  }
}