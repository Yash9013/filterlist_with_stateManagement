import 'package:equatable/equatable.dart';

abstract class ListState extends Equatable {
  @override
  List get props => [];
}

class InitialState extends ListState {}

class ListShowState extends ListState {
  List<Map<String, dynamic>> productList;

  ListShowState(this.productList);
}
