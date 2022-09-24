import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testapp/screens/product_list_screen.dart';
import 'package:testapp/widgets/components.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({Key? key}) : super(key: key);

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  String name = "--";
  String price = "--";
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Product name",
                    ),
                    onChanged: (value) {
                      name = value;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Product price",
                    ),
                    onChanged: (value) {
                      price = value;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      loading = true;
                      setState(() {});
                      CollectionReference products =
                          FirebaseFirestore.instance.collection("Products");
                      await products
                          .add({"price": "$price\$", "product_name": name});
                      loading = false;
                      setState(() {});
                      SnackBar snackBar2 = SnackBar(
                        content: const Text('Your data has been added'),
                        action: SnackBarAction(
                          label: 'ok',
                          onPressed: () {},
                        ),
                        duration: const Duration(seconds: 5),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar2);
                    },
                    child: const Text("Add product")),
                defaultButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProductsList()));
                    },
                    text: 'list of products')
              ],
            ),
    );
  }
}
