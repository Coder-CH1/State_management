import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc_post_file.dart';
import 'package:state_management/post_details_page.dart';
import 'model.dart';
import 'networking.dart';

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
            padding: const EdgeInsets.only(top: 100, left: 10),
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
            padding: const EdgeInsets.only(left: 10),
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
          Expanded(
              child: _buildContentForSegments(_selectedIndex),
          ),
        ],
      ),
    );
  }
  Widget _buildCustomSegmentedControl() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SingleChildScrollView(
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

class Today extends StatefulWidget {
  const Today({Key? key}) : super(key: key);

  @override
  State<Today> createState() => _TodayState();
}

class _TodayState extends State<Today> {
  late Future<List<Welcome>> _posts;
  @override
  void initState() {
    super.initState();
        _posts = Networking().fetchPost();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellowAccent.shade100,
        body: FutureBuilder<List<Welcome>>(
          future: _posts,
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snap.hasError) {
              return Center(child: Text('${snap.error}'));
            } else if (!snap.hasData || snap.data!.isEmpty ) {
              return Center(child: Text('no post available'));
            } else {
              final posts = snap.data!;
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return ListTile(
                    title: Column(
                      children: [
                        Image.network(post.image),
                         Text(post.title, style: TextStyle(
                           fontSize: 30,
                           fontWeight: FontWeight.bold,
                           color: Colors.black54,
                         )),
                        Text(post.content, style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.black26,
                        ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Divider(
                            thickness: 1,
                            color: Colors.black54,
                            indent: 16,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PostDetailsPage(post: post)),
                      );
                    },
                  );
                },
              );
            }
          },
        )
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
