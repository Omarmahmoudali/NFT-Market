import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({Key? key}) : super(key: key);

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  bool loading = true;
  List<QueryDocumentSnapshot<Object?>> productsList = [];
  @override
  void initState() {
    super.initState();
    getProducts();
  }

  getProducts() async {
    CollectionReference products =
        FirebaseFirestore.instance.collection("Products");
    var data = await products.get();
    productsList = data.docs;
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: productsList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    productsList[index]["product_name"],
                  ),
                  subtitle: Text(productsList[index]["price"]),
                );
              },
            ),
    );
  }
}
