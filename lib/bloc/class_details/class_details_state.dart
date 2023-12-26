part of 'class_details_bloc.dart';

abstract class ClassDetailsState extends Equatable {
  const ClassDetailsState();

  @override
  List<Object> get props => [];
}

class ClassDetailsLoadingState extends ClassDetailsState {}

class ClassDetailsLoadedState extends ClassDetailsState {
  final ClassDetailsModel classDetailsModel;
  const ClassDetailsLoadedState({
    required this.classDetailsModel,
  });
}
