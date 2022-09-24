import 'package:flutter/material.dart';

class TeamName extends StatelessWidget {
  const TeamName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Team Name :-',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.red),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Omar Mahmoud',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
