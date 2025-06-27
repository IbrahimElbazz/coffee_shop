import 'package:coffee_shop/features/account/logic/cubit/account_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountInitial());
  String name = '';
  String phone = '';
  String email = '';
  String date = '';

  getInfo() async {
    emit(AccountLoading());
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('users').get();
      for (var doc in querySnapshot.docs) {
        name = doc['userName'];
        phone = doc['phone'];
        email = doc['email'];
        date = doc['date'].toDate().toString().substring(0, 10);
      }
      emit(AccountSuccess());
    } catch (e) {
      emit(AccountError(message: e.toString()));
    }
  }

  // format date
}
