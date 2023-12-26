import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_babuland_app/data/model/class_model.dart';
import 'package:flutter_babuland_app/data/repository/class_repository.dart';

part 'classes_event.dart';
part 'classes_state.dart';

class ClassesBloc extends Bloc<ClassesEvent, ClassesState> {
  final ClassRepository _classRepository;

  ClassesBloc(this._classRepository) : super(ClassesLoadingState()) {
    on<LoadClassesApiEvent>((event, emit) async {
      final classes = await _classRepository.getClasses();
      emit(ClassesLoadedState(classModel: classes));
    });
  }
}
