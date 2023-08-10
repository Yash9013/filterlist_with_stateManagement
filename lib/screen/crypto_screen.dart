import 'package:filterlistbloc/getxcontroller/crypto_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CryptoScreen extends StatefulWidget {
  const CryptoScreen({Key? key}) : super(key: key);

  @override
  State<CryptoScreen> createState() => _CryptoScreenState();
}

class _CryptoScreenState extends State<CryptoScreen> {
  final cryptoController = Get.put(CryptoController());

  @override
  Widget build(BuildContext context) {
    print('====BUILD====');
    return GetBuilder<CryptoController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title:
              const Text('Crypto Page', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  controller.cryptoFilterBox(context);
                },
                icon: const Icon(
                  Icons.sort,
                  color: Colors.white,
                ))
          ],
        ),
        body: ListView.builder(
          itemCount: controller.cryptoList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final crypto = controller.cryptoList[index];
            return ListTile(
              title: Text(crypto['name']),
              trailing: Text(
                '\$${crypto['price'].toString()}',
                style: const TextStyle(fontSize: 16),
              ),
            );
          },
        ),
      ),
    );
  }
}
