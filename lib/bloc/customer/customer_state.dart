part of 'customer_bloc.dart';

abstract class CustomerState extends Equatable {
  const CustomerState();

  @override
  List<Object> get props => [];
}

class CustomerLoadingState extends CustomerState {}

class CustomerLoadedState extends CustomerState {
  final CustomerModel customerModel;
  const CustomerLoadedState({
    required this.customerModel,
  });

  @override
  List<Object> get props => [];
}
