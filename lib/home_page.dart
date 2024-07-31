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
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Write. Share. Inspire', style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )),
        ),
      child: Column(
        children: <Widget>[
          CupertinoSegmentedControl<int>(
            children: {
              0: Text('Today'),
              1: Text('Technology'),
              2: Text('Design')
            },
            onValueChanged: (int? value) {
              setState(() {
                _selectedIndex = value!;
              }
              );
            },
            groupValue: _selectedIndex,
          ),
          Expanded(
            child: _buildContentForSegments(_selectedIndex),
          )
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
