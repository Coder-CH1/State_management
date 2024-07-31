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
      backgroundColor: Colors.black26,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Text('Write. Share.\n Inspire', style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white60,
            )
            ),
          ),
          _buildCustomSegmentedControl(),
          Expanded(child: _buildContentForSegments(_selectedIndex))
        ],
      ),
    );
  }
  Widget _buildCustomSegmentedControl() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
  _buildSegments('Today', 0),
      _buildSegments('Technology', 1),
      _buildSegments('World', 2),
      _buildSegments('Finance', 3),
      _buildSegments('Design', 4)
  ],
),
    );
  }
  Widget _buildSegments(String label, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Text(label, style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: _selectedIndex == index ? Colors.brown : Colors.red,
        )),
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
      return World();
    case 3:
      return Finance();
    case 4:
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
    return Scaffold(
      body: Container(
        child: Text('This is todays blog post'),
      ),
    );
  }
}

class Technology extends StatelessWidget {
  const Technology({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class World extends StatelessWidget {
  const World({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class Finance extends StatelessWidget {
  const Finance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class Design extends StatelessWidget {
  const Design({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
