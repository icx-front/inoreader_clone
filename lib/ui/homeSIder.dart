import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:inoreader_clone_icx/common/apiFunctions/subscriptinListApi.dart';

class HomeDrawer extends StatefulWidget {
  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  // holder for user info
  Map<String, dynamic> user = {};

  List list = [];

  void _getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    user = {
      'email': prefs.getString('email'),
    };
  }

  void _showSubscriptCategory() {}

  void _getSubscriptionList() async {
    final _list = await getSubscriptionList(context);
    setState(() {
      list = _list;
    });
  }

  Widget _buildRow(item) {
    return Container(
      padding: EdgeInsets.fromLTRB(15.0, 2.0, 0, 2.0),
      child: Row(
        children: <Widget>[
          Image.network(
            item.iconUrl,
            width: 20,
            height: 20,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              child: GestureDetector(
                child: Text(
                  item.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: null,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildWidget() {
    return ListView.builder(
      padding: EdgeInsets.all(4.0),
      itemCount: list.length - 1,
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();
        if (list.length > 0) {
          return _buildRow(list[i]);
        } else {
          return null;
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _getUserInfo();
    _getSubscriptionList();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('disposed');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
        child: _buildWidget(),
      ),
    );
  }
}
