import 'dart:developer';

import 'package:filterlistbloc/bloc/list_bloc.dart';
import 'package:filterlistbloc/bloc/list_event.dart';
import 'package:filterlistbloc/bloc/list_state.dart';
import 'package:filterlistbloc/screen/crypto_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  late ListBloc listBloc;

  @override
  void initState() {
    listBloc = context.read<ListBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('====BUILD====');

    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Product Page', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                filterBox(context);
              },
              icon: const Icon(
                Icons.sort,
                color: Colors.white,
              ))
        ],
      ),
      body: BlocBuilder<ListBloc, ListState>(
        builder: (context, state) {
          if (state is ListShowState) {
            return ListView.builder(
              itemCount: state.productList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final product = state.productList[index];
                return ListTile(
                  title: Text(product['name']),
                  trailing: Text(
                    '\$${product['price'].toString()}',
                    style: const TextStyle(fontSize: 16),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const CryptoScreen()),
        ),
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }

  filterBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height*0.35,
            child: Dialog(
              child: ListView.builder(
                itemCount: listBloc.filterNameList.length,
                padding: const EdgeInsets.only(top: 10),
                itemBuilder: (context, index) {
                  return RadioListTile(
                    title: Text(listBloc.filterNameList[index]),
                    value: listBloc.filterValueList[index],
                    groupValue: listBloc.groupValue,
                    onChanged: (value) {
                      listBloc.add(FilterListEvent(value!));
                      Navigator.pop(context);
                      log('selected Filter ${context.read<ListBloc>().filterNameList[index]}');
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
