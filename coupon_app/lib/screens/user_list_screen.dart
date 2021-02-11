import 'package:coupon_app/base/color/color_key.dart';
import 'package:coupon_app/base/view/base_layout.dart';
import 'package:coupon_app/base/view/scaffold_layout.dart';
import 'package:coupon_app/models/account_detail.dart';
import 'package:coupon_app/models/item.dart';
import 'package:coupon_app/models/user.dart';
import 'package:coupon_app/providers/coupon_provider.dart';
import 'package:coupon_app/providers/user_provider.dart';
import 'package:coupon_app/services/size_config_service.dart';
import 'package:coupon_app/widgets/common_widgets/list_view_shimmer.dart';
import 'package:coupon_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class UserListScreen extends StatefulWidget {
  static const routeName = '/coupon-share';

  @override
  _UserListScreenState createState() => _UserListScreenState();
  TabController tabController;

  UserListScreen({this.tabController});
}

const kExpandedHeight = 150.0;

class _UserListScreenState extends State<UserListScreen> with BaseLayout {
  List<User> _filteredUsers = [];
  List<User> _users = [];
  ScrollController _scrollController;
  bool silverCollapsed = false;
  Address address;
  bool isLoading = false;
  Item item;

  TextEditingController _restaurantSearchStringController =
      TextEditingController();

  @override
  void initState() {
    this.getItems();
    item = CouponProvider.item;
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset > 50 &&
          !_scrollController.position.outOfRange) {
        if (!silverCollapsed) {
          // do what ever you want when silver is collapsing !

          silverCollapsed = true;
          setState(() {});
        }
      }
      if (_scrollController.offset <= 50 &&
          !_scrollController.position.outOfRange) {
        if (silverCollapsed) {
          // do what ever you want when silver is expanding !

          silverCollapsed = false;
          setState(() {});
        }
      }
    });
    super.initState();
  }

  Widget getListView() {
    return ListView.builder(
        itemCount: _users.length, itemBuilder: (context, index) {});
  }

  Widget sliverAppBar() {
    return SliverAppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      titleSpacing: 0,
      title: Text(
        'MI Users',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      expandedHeight: kExpandedHeight,
      actions: <Widget>[
        SizedBox(
          width: 5,
        )
      ],
      floating: false,
      pinned: true,
      snap: false,
      elevation: 50,
      backgroundColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: !silverCollapsed
            ? SearchBar(
                filterSearchResults: filterSearchResults,
                editingController: _restaurantSearchStringController,
                hintText: 'Search For User',
                fillColor: Colors.yellow[700],
                borderColor: Colors.yellow[700],
                fontColor: Colors.black87)
            : null,
      ),
    );
  }

  Widget _buildListShimmer() {
    return SliverList(
        delegate: SliverChildListDelegate([
//        Container(child: ShimmerList()),
      Container(
        height: 100,
        width: double.infinity,
        child: ShimmerList(),
      )
    ]));
  }



  Widget _buildList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int i) {
          if (i >= _filteredUsers.length) return null;
          return ChangeNotifierProvider.value(
            value: _filteredUsers[i],
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(Icons.person),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_filteredUsers[i].username),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          _filteredUsers[i].userType,
                          style: TextStyle(fontSize: 9),
                        )
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _filteredUsers[i].committee.committeeName,
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        if(_filteredUsers[i].phone!=null){
                          _launchCaller(_filteredUsers[i].phone);
                        }
                        else{
                          showToast('No Phone number');
                        }
                      },
                      icon: Icon(Icons.call),
                      color: Colors.blueAccent,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> getSliverList() {
    List<Widget> slivers = new List();
    print('------------------------------');
    print(isLoading);
    slivers.add(sliverAppBar());
    if (isLoading) {
      slivers.add(_buildListShimmer());
    } else {
      slivers.add(_buildList());
    }

    return slivers;
  }

  Widget getBuildBody() {
    return CustomScrollView(
        controller: _scrollController, slivers: getSliverList());
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
      backGroundColor: Colors.black87,
      titleColor: Colors.white,
      showAppBar: false,
      bodyData: getBuildBody(),
    );
  }

  void filterSearchResults(String query) {
    List<User> dummySearchList = List<User>();
    dummySearchList.addAll(_users);
    if (query.isNotEmpty) {
      List<User> dummyListData = List<User>();
      dummySearchList.forEach((item) {
        if (item.username.toLowerCase().contains(query.toLowerCase()) ||
            item.committee.committeeName
                .toLowerCase()
                .contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        _filteredUsers = dummyListData;
      });
      return;
    } else {
      setState(() {
        _filteredUsers = _users;
      });
    }
  }

  Future getItems({forceRefresh = false}) async {
    List<User> _tempUserList = await UserProvider().fetchAndSetAllUsers();
    setState(() {
      _filteredUsers = _tempUserList;
      _users = _tempUserList;
      print('---------------------herere------------------');
      print(_filteredUsers);
    });
  }
  _launchCaller(phone) async {
    String url = "tel:$phone";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  verifyAndAdd(int count, User user) {}
}
