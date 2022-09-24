import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<String> names = ["bike", "boat", "bus", "car", "railway", "run"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: names.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {},
              leading: const Icon(Icons.car_crash),
              title: Text(names[index]),
            );
          }),
    );
  }
}
