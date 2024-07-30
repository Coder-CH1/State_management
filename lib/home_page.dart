import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellowAccent.shade100,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80, left: 10),
            child: Text('Write. Share.\nInspire.',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )
            ),
          ),
          Text('Where Words Transcend Boundaries\nNavigation the Blogging Seas.',
          style: TextStyle(
              fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
          ),
        ],
      ),
    );
  }
}
