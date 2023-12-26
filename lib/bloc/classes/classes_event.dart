part of 'classes_bloc.dart';

abstract class ClassesEvent extends Equatable {
  const ClassesEvent();

  @override
  List<Object> get props => [];
}

class LoadClassesApiEvent extends ClassesEvent {}
