part of 'children_bloc.dart';

abstract class ChildrenEvent extends Equatable {
  const ChildrenEvent();

  @override
  List<Object> get props => [];
}

class LoadChildrenApiEvent extends ChildrenEvent {}
