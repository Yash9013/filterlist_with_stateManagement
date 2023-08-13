import 'package:filterlistbloc/bloc/list_bloc.dart';
import 'package:filterlistbloc/bloc/list_event.dart';
import 'package:filterlistbloc/provider/company_provider.dart';
import 'package:filterlistbloc/screen/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListBloc()..add(ShowListEvent()),
      child: ChangeNotifierProvider(
        create: (context) => CompanyProvider(),
        child: GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const ProductScreen(),
        ),
      ),
    );
  }
}
