import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  AuthRepository({FirebaseAuth? firebaseAuth, FirebaseFirestore? firestore})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
      _firestore = firestore ?? FirebaseFirestore.instance;

  Stream<UserModel?> get authStateChanges {
    return _firebaseAuth.authStateChanges().asyncMap((user) async {
      if (user == null) return null;
      final doc = await _firestore.collection('users').doc(user.uid).get();
      if (doc.exists) {
        return UserModel.fromFirestore(doc);
      }
      return null;
    });
  }

  Future<UserModel> signUp({
    required String email,
    required String password,
    required String fullName,
    required UserRole role,
  }) async {
    try {
      final UserCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await UserCredential.user!.updateDisplayName(fullName);

      final user = UserModel(
        uid: UserCredential.user!.uid,
        email: email,
        fullName: fullName,
        createdAt: DateTime.now(),
        lastLoginAt: DateTime.now(),
        role: role,
      );

      await _firestore.collection('users').doc(user.uid).set(user.toFirestore());
      return user;
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    }
  }

  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final doc = await _firestore.collection('users').doc(userCredential.user!.uid).get();
      if (!doc.exists) {
        throw Exception('User not found');
      } 

      final user = UserModel.fromFirestore(doc);

      await _firestore.collection('users').doc(user.uid).update({
        'lastLoginAt': Timestamp.now()});
      return user;
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    }
  }

  Future<void> signOut() async {
    
      await _firebaseAuth.signOut();
  }
  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    }
  }

  Future<void> updateProfile({
     String? fullName,
    String? photoUrl,
    String? phoneNumber,
    String? bio,
  }) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) throw Exception('User not logged in');

      if (fullName != null) {
        await user.updateDisplayName(fullName);
      }
      if (photoUrl != null) {
        await user.updatePhotoURL(photoUrl);
      }
     
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    }
  }

  String _handleAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return 'Email already in use';
      case 'invalid-email':
        return 'Invalid email address';
      case 'operation-not-allowed':
        return 'Operation not allowed';
      case 'weak-password':
        return 'Password should be atleast 6 characters long';
      case 'wrong-password':
        return 'Incorrect Password ';
      case 'user-disabled':
        return 'This account has been disabled';
      case 'too-many-requests':
        return 'Too many attempts. Please try again later';
      case 'network-request-failed':
        return 'Network error. Please check your connection';
      case 'invalid-credentials':
        return 'Invalid credentials. Please try again';
        
      default:
        return e.message ?? 'An unknown error occurred';
    }
  }
}
