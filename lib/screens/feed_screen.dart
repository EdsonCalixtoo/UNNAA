import 'package:UNNA/models/post_model.dart';
import 'package:UNNA/screens/filter_screen.dart';
import 'package:UNNA/screens/inserir_anuncio.dart';
import 'package:UNNA/screens/view_post_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {

  int _selectedPage = 0;
    final _pageOptions = [
      Text('item'),
      Text('item2'),
      Text('item3'),
    ];
  @override
  void didChangeDependencies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String client = prefs.getString('client');
    print('feed => ${client}');
    super.didChangeDependencies();
  }

  Widget _buildPost(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        width: double.infinity,
        height: 560.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        child: ClipOval(
                          child: Image(
                            height: 50.0,
                            width: 50.0,
                            image: AssetImage(posts[index].authorImageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      posts[index].authorName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  InkWell(
                    onDoubleTap: () => print('Like post'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ViewPostScreen(
                            post: posts[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      width: double.infinity,
                      height: 400.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0, 5),
                            blurRadius: 8.0,
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage(posts[index].imageUrl),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.favorite_border),
                                  iconSize: 30.0,
                                  onPressed: () => print('Like post'),
                                ),
                                Text(
                                  '2,515',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 20.0),
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.chat),
                                  iconSize: 30.0,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ViewPostScreen(
                                          post: posts[index],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Text(
                                  '350',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(Icons.bookmark_border),
                          iconSize: 30.0,
                          onPressed: () => print('Save post'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 13,
        title: Text('UNNA'),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FilterScreen()));
          },
          child: Icon(
            Icons.find_in_page,
            size: 27.0,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          /*Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.local_hospital,
                size: 26.0,
              ),
            ),
          )*/
        ],
      ),
      backgroundColor: Color(0xFFEDF0F6),
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
          /*Container(
            width: double.infinity,
            height: 100.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: stories.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return SizedBox(width: 10.0);
                }
               return Container(
                  margin: EdgeInsets.all(10.0),
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        offset: Offset(0, 2),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    child: ClipOval(
                      child: Image(
                        height: 60.0,
                        width: 60.0,
                        image: AssetImage(stories[index - 1]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          )*/
          _buildPost(0),
          _buildPost(1),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedPage,
          onTap: (int index){
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
                size: 30.0,
                color: Colors.black,
              ),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30.0,
                color: Colors.grey,
              ),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 5.0,
                  vertical: 10.0,
                ),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateScreen()));
                  },
                  child: Icon(
                    Icons.add,
                    size: 35.0,
                    color: Colors.white,
                  ),
                ),
              ),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
                size: 30.0,
                color: Colors.grey,
              ),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                size: 30.0,
                color: Colors.grey,
              ),
              title: Text(''),
            ),
          ],
        ),
      ),
    );
  }
}
