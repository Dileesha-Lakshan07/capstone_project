import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // Singleton pattern
  AuthService._privateConstructor();
  static final AuthService instance = AuthService._privateConstructor();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Current user getter
  User? get currentUser => _auth.currentUser;

  // Sign in method
  Future<User?> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      rethrow;
    }
  }

  // Sign out method
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
