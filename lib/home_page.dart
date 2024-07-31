import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('', style: TextStyle(
           fontSize: 20,
           fontWeight: FontWeight.w700,
           color: Colors.black54,
         )
         ),
       ),
      body: Column(
        children: <Widget>[
          ToggleButtons(children: [

          ], isSelected: List.generate(3, (index) => index == _selectedIndex),
            onPressed: (int index) {
            setState(() {
              _selectedIndex = index;
            });
            },
            color: Colors.brown,
            selectedColor: Colors.indigo,
          ),
       Expanded(child: _buildContentForSegments(_selectedIndex)),
        ],
      ),
    );
  }
Widget _buildContentForSegments(int segment) {
  switch (segment) {
    case 0:
      return Today();
    case 1:
      return Technology();
    case 2:
      return Design();
    default:
      return Center(child: Text('default'));
  }
}
}



class Today extends StatelessWidget {
  const Today({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Technology extends StatelessWidget {
  const Technology({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Design extends StatelessWidget {
  const Design({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
