import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_babuland_app/data/model/class_details_model.dart';
import 'package:flutter_babuland_app/data/repository/class_details_repository.dart';

part 'class_details_event.dart';
part 'class_details_state.dart';

class ClassDetailsBloc extends Bloc<ClassDetailsEvent, ClassDetailsState> {
  final ClassDetailsRepository _classDetailsRepository;
  ClassDetailsBloc(this._classDetailsRepository)
      : super(ClassDetailsLoadingState()) {
    on<ClassDetailsEvent>((event, emit) async {
      final classDetails = await _classDetailsRepository.getClassDetails();
      emit(ClassDetailsLoadedState(classDetailsModel: classDetails));
    });
  }
}
