part of 'children_bloc.dart';

abstract class ChildrenState extends Equatable {
  const ChildrenState();

  @override
  List<Object> get props => [];
}

class ChildrenLoadingState extends ChildrenState {}

class ChildrenLoadedState extends ChildrenState {
  final ChildrenModel childrenModel;
  const ChildrenLoadedState({
    required this.childrenModel,
  });
}
