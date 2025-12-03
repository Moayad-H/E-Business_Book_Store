import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // 1. Create an instance of FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // STREAM: Listen to authentication changes
  // This is useful for determining if a user is logged in or out
  // automatically in your UI (e.g., using a StreamBuilder).
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // GET USER: Get the current user
  User? get currentUser => _auth.currentUser;

  // SIGN IN: Email and Password
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
        throw Exception('Wrong password provided.');
      } else {
        print('Error: ${e.message}');
        throw Exception(e.message);
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // REGISTER: Email and Password
  Future<User?> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseFirestore.instance.collection('users').doc(result.user?.uid).set({
        'email': email,
        'name': name,
        'createdAt': DateTime.now(),
      });
      return result.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        throw Exception('The account already exists for that email.');
      } else {
        print(e.message);
        throw Exception(e.message);
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // SIGN OUT
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // PASSWORD RESET
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to send password reset email');
    }
  }
}
