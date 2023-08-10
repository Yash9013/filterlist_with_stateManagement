import 'package:filterlistbloc/bloc/list_event.dart';
import 'package:filterlistbloc/bloc/list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  final List<Map<String, dynamic>> _productList = [
    {'name': 'iphone 14', 'price': 1200},
    {'name': 'iphone 13 pro', 'price': 900},
    {'name': 'iphone 14 pro max', 'price': 1400},
    {'name': 'Samsung S23', 'price': 1300},
    {'name': 'onePlus 11R', 'price': 650},
    {'name': 'google pixel 7', 'price': 570},
    {'name': 'Moto g3', 'price': 350},
    {'name': 'iPad mini', 'price': 1750},
    {'name': 'Samsung S20', 'price': 700},
    {'name': 'realme GT neo 3T', 'price': 310},
    {'name': 'onePlus nord 2T', 'price': 225},
    {'name': 'redmi note 5 pro', 'price': 199},
  ];

  List<Map<String, dynamic>> get productList => _productList;

  final List<String> _filterNameList = [
    'Low to High',
    'High to Low',
    'A to z',
    'Z to A'
  ];

  List<String> get filterNameList => _filterNameList;

  final List<int> _filterValueList = [1, 2, 3, 4];

  List<int> get filterValueList => _filterValueList;

  int _groupValue = 0;

  int get groupValue => _groupValue;

  ListBloc() : super(InitialState()) {
    on<ShowListEvent>((event, emit) => _showList(event, emit));

    on<FilterListEvent>((event, emit) => _filterToggle(event, emit));
  }

  _showList(ShowListEvent event, Emitter<ListState> emit) {
    emit(ListShowState(_productList));
  }

  _filterToggle(FilterListEvent event, Emitter<ListState> emit) {
    emit(InitialState());
    _groupValue = event.value;

    emit(ListShowState(productList));

    if (_groupValue == 1) {
      return _productList.sort((a, b) => a['price'].compareTo(b['price']));
    } else if (_groupValue == 2) {
      return _productList.sort((a, b) => b['price'].compareTo(a['price']));
    } else if (_groupValue == 3) {
      return _productList.sort((a, b) => a['name'].compareTo(b['name']));
    } else if (_groupValue == 4) {
      return _productList.sort((a, b) => b['name'].compareTo(a['name']));
    }
  }
}
