import 'package:flutter/material.dart';
import 'package:inoreader_clone_icx/ui/homeSIder.dart';
import 'package:inoreader_clone_icx/common/apiFunctions/streamListApi.dart';
import 'package:inoreader_clone_icx/model/json/feedItemModel.dart';

class _HomeScreenState extends State<HomeScreen> {
  List list = [];

  void _getFeeds() async {
    final _list = await getStreamFeeds(context);
    setState(() {
      list = _list;
    });
  }

  Widget _buildWidget() {
    if (list.isEmpty) {
      return Text('加载中...');
    } else {
      return ListView.builder(
          itemCount: list.length - 1,
          itemBuilder: (context, i) {
            if (i.isOdd) return Divider();
            if (list.length > 0) {
              return _buildFeedRow(list[i]);
            } else {
              return null;
            }
          });
    }
  }

  Widget _buildFeedRow(FeedModel data) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
      child: Column(
        children: <Widget>[
          Text(
            data.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(data.summary),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fetch the stream
    _getFeeds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: HomeDrawer(),
      floatingActionButton: RaisedButton(
          child: Text('Feed'),
          onPressed: () {
            Navigator.pushNamed(context, '/feed');
          }),
      body: Container(
        padding: EdgeInsets.all(12.0),
        child: _buildWidget(),
//        child: Text('yyy'),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
