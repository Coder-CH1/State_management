import 'package:flutter/material.dart';
import 'package:state_management/pages/post_details_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Networking/model.dart';
import '../Networking/networking.dart';
import '../state_management/bloc/bloc_post.dart';
import '../state_management/bloc/post_event.dart';
import '../state_management/bloc/post_state.dart';

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
                child: const Text('Write. Share.\nInspire',style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
            alignment: Alignment.topLeft,
              child: const Text('Where Words Transcend Boundaries,\nNavigating the Blogging Seas.', style:
              TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.black54,
              ),
              ),
            ),
          ),
          const SizedBox(height: 40),
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
        margin: const EdgeInsets.only(right: 16),
        child: Text(label, style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: _selectedIndex == index ? Colors.black : Colors.grey,
        ),
        ),
      ),
    );
  }
Widget _buildContentForSegments(int segment) {
  switch (segment) {
    case 0:
      return const Today();
    case 1:
      return const Technology();
    case 2:
      return const World();
    case 3:
      return const Finance();
    case 4:
      return const Design();
    case 5:
      return const Marketing();
    default:
      return const Center(child: Text('default'));
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
    return BlocProvider(
      create: (context) => PostBloc(Networking())..add(FetchPostEvent()),
      child: Scaffold(
        backgroundColor: Colors.yellowAccent.shade100,
        body: BlocBuilder<PostBloc, PostState>(
          builder: (context, state){
            if(state is PostLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PostError) {
              return Center(child: Text(state.message));
            } else if (state is PostLoaded) {
              final posts = state.posts;
              return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return ListTile(
                      title: Text(post.title),
                      subtitle: Text(post.content),
                      leading: Image.network(post.image),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PostDetailsPage(post: post)
                          ),
                        );
                      },
                    );
                  }
              );
            }
            return  const Center(child: Text('No data'));
          },
        ),
      ),
    );
  }
}

class Technology extends StatelessWidget {
  const Technology({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
    );
  }
}

class World extends StatelessWidget {
  const World({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.green,
    );
  }
}

class Finance extends StatelessWidget {
  const Finance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.indigo,
    );
  }
}

class Design extends StatelessWidget {
  const Design({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
backgroundColor: Colors.pink,
    );
  }
}

class Marketing extends StatelessWidget {
  const Marketing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white30,
    );
  }
}
