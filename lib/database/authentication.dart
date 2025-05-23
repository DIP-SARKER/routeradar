import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

ValueNotifier<AuthenticationServices> authServices = ValueNotifier(
  AuthenticationServices(),
);

class AuthenticationServices {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  String globalPassword = '';

  String? getCurrentUserUID() {
    return currentUser?.uid;
  }

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    globalPassword = password;
    return await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> createAccount({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  Future<void> resetPassword({required String email}) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> updateUsername({required String username}) async {
    await currentUser?.updateDisplayName(username);
  }

  Future<void> deleteAccount({
    required String email,
    required String password,
  }) async {
    final AuthCredential credential = EmailAuthProvider.credential(
      email: email,
      password: password,
    );
    await currentUser?.reauthenticateWithCredential(credential);
    await currentUser?.delete();
    await firebaseAuth.signOut();
  }

  Future<void> resetPasswordFromCurrentPassword({
    required String currentPassword,
    required String newPassword,
    required String email,
  }) async {
    final AuthCredential credential = EmailAuthProvider.credential(
      email: email,
      password: currentPassword,
    );
    await currentUser?.reauthenticateWithCredential(credential);
    await currentUser?.updatePassword(newPassword);
  }
}
