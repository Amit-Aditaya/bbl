import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_babuland_app/data/model/children_model.dart';
import 'package:flutter_babuland_app/data/repository/children_repo.dart';
import 'package:flutter_babuland_app/data/repository/customer_repository.dart';

part 'children_event.dart';
part 'children_state.dart';

class ChildrenBloc extends Bloc<ChildrenEvent, ChildrenState> {
  final ChildrenRepository _childrenRepository;
  //final CustomerRepository _customerRepository;

  ChildrenBloc(
    this._childrenRepository,
  ) : super(ChildrenLoadingState()) {
    on<LoadChildrenApiEvent>((event, emit) async {
      CustomerRepository _customerRepository = CustomerRepository();
      final customer = await _customerRepository.getCustomer();
      final children = await _childrenRepository.getChildren(
          id: customer.items[0].id.toString());
      emit(ChildrenLoadedState(childrenModel: children));
    });
  }
}
