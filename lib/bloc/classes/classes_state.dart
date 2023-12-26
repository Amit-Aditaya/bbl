part of 'classes_bloc.dart';

abstract class ClassesState extends Equatable {
  const ClassesState();

  @override
  List<Object> get props => [];
}

class ClassesLoadingState extends ClassesState {}

class ClassesLoadedState extends ClassesState {
  final ClassModel classModel;
  const ClassesLoadedState({
    required this.classModel,
  });
}
