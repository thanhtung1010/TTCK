import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);
  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String> signIn({String email, String password}) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return user.uid;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signUp({String email, String password, Map userData}) async {
    try {
      UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      String uid = _firebaseAuth.currentUser.uid;

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(uid)
          .set(userData)
          .catchError((e) {
        if (!e) {
          print('add course success');
        } else {
          print(e.toString());
        }
      });
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future GetUserById(String uid) async {
    final CollectionReference courseList =
        FirebaseFirestore.instance.collection('Users');
    Map<String, dynamic> data;

    try {
      await courseList.doc(uid).get().then((DocumentSnapshot snapshot) => {
            data = snapshot.data(),
          });
      return data;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
