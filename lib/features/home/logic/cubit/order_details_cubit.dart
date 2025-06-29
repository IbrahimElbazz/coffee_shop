import 'package:coffee_shop/features/home/logic/cubit/order_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit() : super(OrderDetailsInitial());
  int amount = 1;
  CollectionReference orders = FirebaseFirestore.instance.collection('orders');
  FirebaseAuth firestore = FirebaseAuth.instance;
  void addOrder({required int price}) {
    emit(OrderDetailsLoading());
    try {
      orders.add({
        'emai;': firestore.currentUser!.email,
        'price': price * amount,
        'amount': amount,
      });
      emit(AddOrderSuccess());
    } catch (e) {
      emit(AddOrderFailure(e.toString()));
    }
  }

  void incrementAmount() {
    amount++;
    emit(AmountChangedState(amount));
  }

  void decrementAmount() {
    if (amount > 1) {
      amount--;
      emit(AmountChangedState(amount));
    }
  }
}
