import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testapp/screens/product_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool loading = true;
  List isCart = [];
  bool isFav = true;
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
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
        body: ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: productsList.length,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage(productsList[index]["image"]),
                    width: double.infinity,
                    height: 200,
                  ),
                  // if (model.discount != 0)
                  Container(
                    color: Colors.red,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    child: const Text(
                      'Discount',
                      style: TextStyle(fontSize: 10.0, color: Colors.white),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productsList[index]["name"],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14.0, height: 1.3),
                    ),
                    Row(
                      children: [
                        Text(
                          productsList[index]["price"],
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          productsList[index]["old_price"],
                          maxLines: 2,
                          style: const TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                        const Spacer(),
                        // IconButton(
                        //   onPressed: () {
                        //     setState(() {
                        //       changeFavorites();
                        //     });
                        //   },
                        //   icon: CircleAvatar(
                        //       radius: 15.0,
                        //       backgroundColor: Colors.grey[350],
                        //       child: Icon(
                        //           isFav
                        //               ? Icons.shopping_cart_rounded
                        //               : Icons.shopping_cart_outlined,
                        //           size: 20.0,
                        //           color: isFav ? Colors.red : Colors.black)),
                        // )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ));
  }

  void changeFavorites() {
    isFav = !isFav;
  }
}
