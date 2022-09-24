import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
          color: Colors.black,
        ),
        actions: [
          const Icon(Icons.search, color: Colors.black),
          20.horizontalSpace,
          const CircleAvatar(
            backgroundColor: Colors.black,
          ),
          20.horizontalSpace,
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: const [
                  Text(
                    'Top Designer',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward)
                ],
              ),
              20.verticalSpace,
              SizedBox(
                height: 100.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildStoryItem(),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 20.0,
                  ),
                  itemCount: 10,
                ),
              ),
              30.verticalSpace,
              Row(
                children: const [
                  Text(
                    'Popular Design',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward)
                ],
              ),
              15.verticalSpace,
              Container(
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                height: 200,
                child: Image.asset(
                  'assets/images/image1.png',
                  fit: BoxFit.cover,
                ),
              ),
              10.verticalSpace,
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'assets/images/image3.png',
                            fit: BoxFit.cover,
                            width: 150,
                            height: 150,
                          ),
                          20.verticalSpace,
                          Image.asset(
                            'assets/images/image3.png',
                            fit: BoxFit.cover,
                            width: 150,
                            height: 150,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        width: 150,
                        height: 200,
                        child: Image.asset('assets/images/image3.png',
                            fit: BoxFit.cover),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStoryItem() => SizedBox(
        width: 60.0,
        child: Column(
          children: const [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: AssetImage('assets/images/person.png'),
            ),
            SizedBox(
              height: 6.0,
            ),
            Text(
              'Omar ',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
}
