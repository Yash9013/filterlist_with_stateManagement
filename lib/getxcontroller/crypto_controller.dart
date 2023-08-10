// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CryptoController extends GetxController {
  final List<Map<String, dynamic>> _cryptoList = [
    {'name': 'Bitcoin', 'price': 29800},
    {'name': 'Ethereum', 'price': 1850},
    {'name': 'BNB', 'price': 370},
    {'name': 'Solana', 'price': 22},
    {'name': 'XRP', 'price': 0.86},
    {'name': 'ADA', 'price': 0.69},
    {'name': 'OP', 'price': 1.55},
    {'name': 'ARB', 'price': 1.16},
    {'name': 'SUI', 'price': 0.63},
    {'name': 'ETC', 'price': 330},
    {'name': 'BCH', 'price': 190},
    {'name': 'DOGE', 'price': 0.075},
  ];

  final List<String> _filterNameList = [
    'Low to High',
    'High to Low',
    'A to z',
    'Z to A'
  ];

  final List<int> _filterValueList = [1, 2, 3, 4];

  int _selectedValue = 0;

  List<Map<String, dynamic>> get cryptoList => _cryptoList;

  List<String> get filterNameList => _filterNameList;

  List<int> get filterValueList => _filterValueList;

  int get selectedValue => _selectedValue;

  cryptoFilterFunc(int value) {
    _selectedValue = value;
    switch (_selectedValue) {
      case 1:
        _cryptoList.sort((a, b) => a['price'].compareTo(b['price']));
      case 2:
        _cryptoList.sort((a, b) => b['price'].compareTo(a['price']));
      case 3:
        _cryptoList.sort((a, b) => a['name'].compareTo(b['name']));
      case 4:
        _cryptoList.sort((a, b) => b['name'].compareTo(a['name']));
    }
    update();
  }

  cryptoFilterBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.35,
            child: Dialog(
              child: ListView.builder(
                itemCount: _filterNameList.length,
                padding: const EdgeInsets.only(top: 10),
                itemBuilder: (context, index) {
                  return RadioListTile(
                    title: Text(_filterNameList[index]),
                    value: _filterValueList[index],
                    groupValue: _selectedValue,
                    onChanged: (value) {
                      cryptoFilterFunc(value!);
                      Navigator.pop(context);
                      print('selected Crypto Filter ${_filterNameList[index]}');
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
