import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectify/code/repository/auth/model/auth_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> logIn(String email, String password) async {
    emit(AuthLoading());
    try {
      final UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;
      if (user != null) {
        final doc = await _firestore.collection('users').doc(user.uid).get();
        final data = doc.data();
        if (data != null) {
          final AuthModel authUser = AuthModel.fromMap(data);
          emit(AuthAuthenticated(authUser));
        } else {
          emit(AuthError('User data not found.'));
        }
      } else {
        emit(AuthError('User not found.'));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message!));
    }
  }

  Future<void> signUp(String email, String password, String username) async {
    emit(AuthLoading());
    try {
      final UserCredential credential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'username': username,
          'email': email,
        });

        final AuthModel authUser = AuthModel(
          uid: user.uid,
          email: email,
          username: username,
        );
        emit(AuthAuthenticated(authUser));
      } else {
        emit(AuthError('User creation failed.'));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message!));
    }
  }

  // Future<void> fetchUserData() async {
  //   emit(AuthLoading());
  //   try {
  //     final User? user = _auth.currentUser;
  //     if (user != null) {
  //       final doc = await _firestore.collection('users').doc(user.uid).get();
  //       final data = doc.data();
  //       if (data != null) {
  //         emit(UserDataLoaded([data]));
  //       } else {
  //         emit(AuthError('User data not found.'));
  //       }
  //     } else {
  //       emit(AuthError('User not logged in.'));
  //     }
  //   } catch (e) {
  //     emit(AuthError(e.toString()));
  //   }
  // }
  Future<void> fetchUserData() async {
    emit(AuthLoading());
    try {
      final User? user = _auth.currentUser;
      if (user != null) {
        final doc = await _firestore.collection('users').doc(user.uid).get();
        final data = doc.data();
        if (data != null) {
          emit(UserDataLoaded([data]));
        } else {
          emit(AuthError('User data not found.'));
        }
      } else {
        emit(AuthError('User not logged in.'));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
