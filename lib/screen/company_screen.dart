import 'dart:developer';
import 'package:filterlistbloc/provider/company_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompanyScreen extends StatefulWidget {
  const CompanyScreen({Key? key}) : super(key: key);

  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  @override
  Widget build(BuildContext context) {
    log('====BUILD====');
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title:
            const Text('Company Page', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                context.read<CompanyProvider>().companyFilterBox(context);
              },
              icon: const Icon(
                Icons.sort,
                color: Colors.white,
              ))
        ],
      ),
      body: Column(
        children: [
          Consumer<CompanyProvider>(
            builder: (context, value, child) => ListView.builder(
              itemCount: value.companyList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final companyData = value.companyList[index];
                return ListTile(
                  title: Text(companyData['companyName']),
                  trailing: Text(
                    'Rs ${companyData['price'].toString()}',
                    style: const TextStyle(fontSize: 16),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Provider',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
