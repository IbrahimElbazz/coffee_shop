sealed class OrderDetailsState {}

final class OrderDetailsInitial extends OrderDetailsState {}

final class OrderDetailsLoading extends OrderDetailsState {}

final class AddOrderSuccess extends OrderDetailsState {}

final class AddOrderFailure extends OrderDetailsState {
  AddOrderFailure(this.error);
  final String error;
}

final class AmountChangedState extends OrderDetailsState {
  AmountChangedState(this.amount);
  final int amount;
}
