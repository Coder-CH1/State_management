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
          _buildCustomSegmentedControl(),
          Expanded(child: _buildContentForSegments(_selectedIndex))
        ],
      ),
    );
  }
  Widget _buildCustomSegmentedControl() {
return Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
  _buildSegments('Today', 0),
    _buildSegments('Technology', 1),
    _buildSegments('Design', 2)
  ],
);
  }
  Widget _buildSegments(String label, int index) {
    return Expanded(child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: _selectedIndex == index ? Colors.brown : Colors.red,
      ),
      onPressed: () {
        setState(() {
          _selectedIndex = index;
        });
      }, child: Text(label),
    ));
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
