import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_babuland_app/data/model/customer_model.dart';
import 'package:flutter_babuland_app/data/repository/customer_repository.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final CustomerRepository _customerRepository;
  CustomerBloc(this._customerRepository) : super(CustomerLoadingState()) {
    on<LoadCustomerApiEvent>((event, emit) async {
      final customer = await _customerRepository.getCustomer();
      emit(CustomerLoadedState(customerModel: customer));
    });
  }
}
