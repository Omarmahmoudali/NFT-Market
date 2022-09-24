import 'package:flutter/material.dart';
import 'package:testapp/pages/gridview_page.dart';
import 'package:testapp/pages/listview_page.dart';
import 'package:testapp/widgets/my_button.dart';

class ScrollPage extends StatefulWidget {
  const ScrollPage({Key? key}) : super(key: key);

  @override
  State<ScrollPage> createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyButton(
                  label: "list View",
                  onTab: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ListViewScreen()),
                    );
                  }),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyButton(
                  label: "GridView",
                  onTab: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GridViewScreen()),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
