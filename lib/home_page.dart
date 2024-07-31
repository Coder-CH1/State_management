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
      backgroundColor: Colors.yellowAccent.shade100,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 5),
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                child: Text('Write. Share.\nInspire',style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Container(
            alignment: Alignment.topLeft,
              child: Text('Where Words Transcend Boundaries,\nNavigating the Blogging Seas.', style:
              TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.black54,
              )
              ),
            ),
          ),
          SizedBox(height: 40),
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
      _buildSegments('Design', 4),
    _buildSegments('Marketing', 5)
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
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: _selectedIndex == index ? Colors.black : Colors.grey,
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
    case 5:
      return Marketing();
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
      backgroundColor: Colors.yellowAccent.shade100,
      body: ListView(
        children: [
          Text('Title Text', style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )),
          Text('Description', style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.black45,
          )),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Divider(
              thickness: 1,
              color: Colors.black54,
              indent: 16,
            ),
          ),
          Text('Title Text', style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )),
          Text('Description', style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.black45,
          )),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Divider(
              thickness: 1,
              color: Colors.black54,
              indent: 16,
            ),
          ),
          Text('Title Text', style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )),
          Text('Description', style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.black45,
          )),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Divider(
              thickness: 1,
              color: Colors.black54,
              indent: 16,
            ),
          ),
          Text('Title Text', style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )),
          Text('Description', style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.black45,
          )),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Divider(
              thickness: 1,
              color: Colors.black54,
              indent: 16,
            ),
          ),
          Text('Title Text', style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )),
          Text('Description', style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.black45,
          )),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Divider(
              thickness: 1,
              color: Colors.black54,
              indent: 16,
            ),
          ),
          Text('Title Text', style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )),
          Text('Description', style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.black45,
          )),
        ],
      ),
    );
  }
}

class Technology extends StatelessWidget {
  const Technology({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
    );
  }
}

class World extends StatelessWidget {
  const World({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
    );
  }
}

class Finance extends StatelessWidget {
  const Finance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
    );
  }
}

class Design extends StatelessWidget {
  const Design({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.pink,
    );
  }
}

class Marketing extends StatelessWidget {
  const Marketing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
    );
  }
}
