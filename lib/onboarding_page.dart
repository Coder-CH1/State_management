import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.black54,
      body: Padding(
        padding: const EdgeInsets.only(top: 400),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Empower\nYour Voice. \nIlluminate Minds.',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: (){}, child: Text('Start to Read', style:
            TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            ),
              style: ElevatedButton.styleFrom(
                primary: Colors.orangeAccent,
                minimumSize: Size(300, 50),
              ),
            ),
          ]
        ),
      ),
    );
  }
}


