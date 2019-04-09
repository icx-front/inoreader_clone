import 'package:flutter/material.dart';
import 'package:inoreader_clone_icx/ui/homeSIder.dart';
import 'package:inoreader_clone_icx/common/apiFunctions/streamListApi.dart';
import 'package:inoreader_clone_icx/model/json/feedItemModel.dart';

class _HomeScreenState extends State<HomeScreen> {
  List list = [];

  void _getFeeds() async {
    final _list = await getStreamFeeds(context);

    print(_list.length);
    setState(() {
      list = _list;
    });
  }

  Widget _buildWidget() {
    if (list.isEmpty) {
      return Text('加载中...');
    } else {
      return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, i) {
            if (list.length > 0) {
              return _buildFeedRow(list[i], i);
            } else {
              return null;
            }
          });
    }
  }

  Widget _buildFeedRow(FeedModel data, num i) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(100),
          onTap: () {
            Navigator.pushNamed(context, '/detail',
                arguments: data.originTitle);
          }, // tap to load origin content with url
          child: Row(
            children: <Widget>[
              Image.network(
                data.imageHref != null ? data.imageHref : '',
                width: 40,
                height: 40,
              ),
              Column(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(4.0, 10.0, 0, 10.0),
                        child: Text(
                          data.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 6.0, horizontal: 4.0),
                        child: Text(
                          data.originTitle,
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
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
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
