import 'package:flutter/material.dart';
import 'package:state_management/pages/home_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.black54,
      body: Padding(
        padding: const EdgeInsets.only(top: 550),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Empower\nYour Voice. \nIlluminate Minds.',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),
                  ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellowAccent.shade100,
                  minimumSize: const Size(300, 50),
                ), child: const Text('Start to Read', style:
              TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}


