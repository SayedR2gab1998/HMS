import 'package:firebase_auth/firebase_auth.dart';
import 'package:hms/models/Fireuser.dart';



class Authservices{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FireUser _userFromFirebaseUser(User user) {
    if (user != null) {
      return FireUser(uid: user.uid);
    } else {
      return null;
    }
  }
  Future sginInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    } 
  }

   Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    } 
  }
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}