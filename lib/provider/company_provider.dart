import 'dart:developer';

import 'package:flutter/material.dart';

class CompanyProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _companyList = [
    {'companyName': 'Reliance Industries Limited', 'price': 2551},
    {'companyName': 'Tata Consultancy Services Limited', 'price': 3402},
    {'companyName': 'HDFC Bank', 'price': 1678.7},
    {'companyName': 'Infosys Limited', 'price': 1338.8},
    {'companyName': 'Hindustan Unilever Limited', 'price': 2646},
    {'companyName': 'Life Insurance Corporation of India', 'price': 627},
    {
      'companyName': 'Housing Development Finance Corporation Limited',
      'price': 2724
    },
    {'companyName': 'ICICI Bank', 'price': 990.15},
    {'companyName': 'Bajaj Finance Limited', 'price': 7558.35},
    {'companyName': 'State Bank of India', 'price': 617.9},
    {'companyName': 'Bharti Airtel Limited', 'price': 885.55},
  ];

  final List<String> _filterNameList = [
    'Low to High',
    'High to Low',
    'A to z',
    'Z to A'
  ];

  final List<int> _filterValueList = [1, 2, 3, 4];

  int _selectedValue = 0;

  List<Map<String, dynamic>> get companyList => _companyList;

  List<String> get filterNameList => _filterNameList;

  List<int> get filterValueList => _filterValueList;

  int get selectedValue => _selectedValue;

  filterFunc(value) {
    _selectedValue = value;
    switch (_selectedValue) {
      case 1:
        _companyList.sort(
          (a, b) => a['price'].compareTo(b['price']),
        );
      case 2:
        _companyList.sort(
          (a, b) => b['price'].compareTo(a['price']),
        );
      case 3:
        _companyList.sort(
          (a, b) => a['companyName'].compareTo(b['companyName']),
        );
      case 4:
        _companyList.sort(
          (a, b) => b['companyName'].compareTo(a['companyName']),
        );
    }
    notifyListeners();
  }

  companyFilterBox(BuildContext context) {
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
                      filterFunc(value!);
                      Navigator.pop(context);
                      log('selected Crypto Filter ${_filterNameList[index]}');
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
