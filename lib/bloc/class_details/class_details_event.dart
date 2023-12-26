part of 'class_details_bloc.dart';

abstract class ClassDetailsEvent extends Equatable {
  const ClassDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadClassDetailsApiEvent extends ClassDetailsEvent {}
