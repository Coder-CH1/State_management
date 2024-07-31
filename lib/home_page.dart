import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:bloc/bloc.dart';

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
      body:
        Row(
          children: [
            Column(
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
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text('Where Words Transcend Boundaries\nNavigation the Blogging Seas.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],

            ),
            Expanded(child:Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

            ]
            )
            )
          ],
        )
    );
  }
}
