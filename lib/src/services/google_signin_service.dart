import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
class GoogleSigninService {
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

  static Future signinWithGoogle()async{
    try {
      final account = await _googleSignIn.signIn();
      final googleKey = await account?.authentication; // TOKEN
      
      final url = Uri(
        scheme: 'http',
        host: '10.0.2.2',
        port: 3000,
        path: '/google'
      );

      final response = await http.post(url, body: {
        'token': googleKey!.idToken
      });

      return response;
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
