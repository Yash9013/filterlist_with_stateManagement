import 'package:equatable/equatable.dart';

abstract class ListEvent extends Equatable {

  @override
  List get props => [];
}

class ShowListEvent extends ListEvent {

}

class FilterListEvent extends ListEvent {
  int value;

  FilterListEvent(this.value);
}