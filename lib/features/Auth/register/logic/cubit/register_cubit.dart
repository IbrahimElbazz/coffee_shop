import 'dart:developer';

import 'package:coffee_shop/features/Auth/register/logic/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController userName = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void register() async {
    emit(RegisterLoading());
    try {
      UserCredential users = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email.text,
            password: password.text,
          );
      addUser(userName.text, email.text, password.text);
      emit(RegisterSuccess());
    }
    // on FirebaseAuthException catch (e) {
    //   if (e.code == 'weak-password') {
    //     emit(RegisterError(message: 'The password provided is too weak.'));
    //   } else if (e.code == 'email-already-in-use') {
    //     emit(
    //       RegisterError(message: 'The account already exists for that email.'),
    //     );
    //   }
    // }
    catch (e) {
      emit(RegisterError(message: 'Please try again'));
    }
  }

  Future<void> addUser(String userName, String email, String password) {
    return users
        .add({'userName': userName, 'email': email, 'password': password})
        .then((value) => log("User Added"))
        .catchError((error) => log("Failed to add user: $error"));
  }
}
