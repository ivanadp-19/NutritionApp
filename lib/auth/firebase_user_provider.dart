import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class TuNutriFirebaseUser {
  TuNutriFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

TuNutriFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<TuNutriFirebaseUser> tuNutriFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<TuNutriFirebaseUser>(
        (user) => currentUser = TuNutriFirebaseUser(user));
