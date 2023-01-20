import 'package:google_sign_in/google_sign_in.dart';

class GoogleSigninService {
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

  static Future<GoogleSignInAccount?> signinWithGoogle()async{
    try {
      final account = await _googleSignIn.signIn();
      // final googleKey = await account?.authentication; // TOKEN
      return account;
    } catch (e) {
      return null;
    }
  }

  static Future signOut()async{
    try {
      await _googleSignIn.signOut();
    } catch (e) {
      return null;
    }
  }
}
