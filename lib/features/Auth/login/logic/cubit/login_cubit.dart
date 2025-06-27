import 'package:coffee_shop/features/Auth/login/logic/cubit/login_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void login() async {
    emit(LoginLoading());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginError(message: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(LoginError(message: 'Wrong password provided for that user.'));
      } else {
        emit(LoginError(message: e.message ?? 'An unknown error occurred'));
      }
    } catch (e) {
      emit(LoginError(message: 'Please try again'));
    }
  }
}
