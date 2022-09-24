import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:testapp/training_project/login/login_screen.dart';
import 'package:testapp/widgets/components.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'assets/images/OnlineShop.png',
        title: 'Explore',
        body:
            'Choose Whatever the Product you wish for with the easiest way possible using ShopMart'),
    BoardingModel(
        image: 'assets/images/Delivery.png',
        title: 'Shipping',
        body:
            'Yor Order will be shipped to you as fast as possible by our carrier'),
    BoardingModel(
        image: 'assets/images/Payment.png',
        title: 'Make the Payment',
        body:
            'Pay with the safest way possible either by cash or credit cards'),
  ];

  var boardController = PageController();

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          defaultTextButton(
              onPressed: () {
                navigateTo(context, const LoginScreen());
              },
              text: 'skip')
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                controller: boardController,
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect: const ExpandingDotsEffect(
                      activeDotColor: Colors.blue,
                      spacing: 5,
                      dotColor: Colors.grey,
                      dotHeight: 10,
                      dotWidth: 10,
                      expansionFactor: 4),
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      navigateAndFinish(context, const LoginScreen());
                    } else {
                      boardController.nextPage(
                        duration: const Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image(image: AssetImage(model.image))),
          const SizedBox(
            height: 30,
          ),
          Text(
            model.title,
            style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            model.body,
            style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      );
}
