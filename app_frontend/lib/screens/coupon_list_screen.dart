import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:coupon_app/base/view/base_layout.dart';
import 'package:coupon_app/base/view/scaffold_layout.dart';
import 'package:coupon_app/models/item.dart';
import 'package:coupon_app/models/user.dart';
import 'package:coupon_app/providers/coupon_provider.dart';
import 'package:coupon_app/providers/item_provider.dart';
import 'package:coupon_app/services/localstorage_service.dart';
import 'package:coupon_app/services/service_locator.dart';
import 'package:coupon_app/services/size_config_service.dart';
import 'package:coupon_app/widgets/common_widgets/list_view_shimmer.dart';
import 'package:coupon_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

class CouponListScreen extends StatefulWidget {
  @override
  _CouponListScreenState createState() => _CouponListScreenState();
  TabController tabController;

  CouponListScreen({this.tabController});
}

const kExpandedHeight = 150.0;

class _CouponListScreenState extends State<CouponListScreen> with BaseLayout {
  List<Item> _coupons = [];
  List<Item> _filteredCoupons = [];
  List<User> _users = [];
  ScrollController _scrollController;
  bool silverCollapsed = false;
  var storageService = locator<LocalStorageService>();
  int userType;
  bool isLoading = false;
  List _slides = [
    'http://images.all-free-download.com/images/graphiclarge/barbecue_fine_picture_167052.jpg',
    'https://thebloodsugardiet.com/wp-content/uploads/2015/12/fasting-AdobeStock_89812966.jpeg',
    'https://www.lowcarblab.com/images/2018/05/dr-fung-intermittent-fasting-lose-weight.jpg',
  ];

  TextEditingController _itemSearchStringController =
      TextEditingController();

  @override
  void initState() {
    this.getItems();
    userType = storageService.userType;
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
        itemCount: _coupons.length, itemBuilder: (context, index) {});
  }

  Widget sliverAppBar() {
    return SliverAppBar(
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Icon(
          Icons.menu,
          color: Colors.white,
        ),
      ),
      titleSpacing: 0,
      title: Text(
        'MI Coupon Dashboard',
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
                editingController: _itemSearchStringController,
                hintText: 'Search For Coupon',
                fillColor: Colors.yellow[700],
                borderColor: Colors.yellow[700],
                fontColor: Colors.black87)
            : null,
      ),
    );
  }

  Widget _buildPageView() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
              padding: EdgeInsets.only(top: 15, bottom: 5),
              height: 200,
              child: CarouselSlider(
                height: SizeConfig.screenHeight * .22,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                autoPlayCurve: Curves.fastOutSlowIn,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                items: _slides.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(color: Colors.transparent),
                          child: CachedNetworkImage(
                            imageUrl: i,
                            height: SizeConfig.screenWidth * .25,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Center(
                              child: SpinKitCubeGrid(
                                color: Colors.black12,
                              ),
                            ),
                            errorWidget: (context, url, error) {
                              return Center(
                                child: Icon(
                                  Icons.filter,
                                  size: 20,
                                ),
                              );
                            },
                          ));
                    },
                  );
                }).toList(),
              )),
        ],
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

  Widget _buildNothingToShow() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
              padding: EdgeInsets.only(top: 15, bottom: 5),
              height: SizeConfig.screenHeight * .35,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.mood_bad,
                    size: 100,
                    color: Colors.black45,
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16),
                      child: new RichText(
                        textAlign: TextAlign.center,
                        text: new TextSpan(
                          style: new TextStyle(
                            fontSize: 16,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                                text: 'Nothing Open Nearby',
                                style: new TextStyle(
                                  color: Colors.black26,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int i) {
          if (i >= _filteredCoupons.length) return null;
          return ChangeNotifierProvider.value(
            value: _filteredCoupons[i],
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(Icons.restaurant_menu),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_filteredCoupons[i].itemName),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          width: SizeConfig.screenWidth*.3,
                          child: Text(
                            _filteredCoupons[i].description,
                            style: TextStyle(fontSize: 8),
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    Text("${_filteredCoupons[i].itemCount.totalCount} Left"),
              userType==1? IconButton(
                      onPressed: () {
                        showDialog<int>(
                                context: context,
                                builder: (BuildContext context) {
                                  return new NumberPickerDialog.integer(
                                    minValue: 1,
                                    maxValue: 100,
                                    title: new Text("Select Count"),
                                    initialIntegerValue: 10,
                                  );
                                })
                            .then((value) => ItemProvider()
                                .createCoupons(
                                    value, _filteredCoupons[i].itemCode)
                                .then((value) => getItems()));
                      },
                      icon: Icon(Icons.add_circle_outline),
                      color: Colors.blueAccent,
                    ):SizedBox(),
                    IconButton(
                      onPressed: () {
                           if (_filteredCoupons[i].itemCount.totalCount > 0) {
                                _showDialog(_filteredCoupons[i]);
                              }
                           else{
                              showToast('No Coupons to share');
                           }
//
                      },
                      icon: Icon(Icons.share),
                      color: Colors.orangeAccent,
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

  _showDialog(Item item) {
    return showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                shape:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                title: Container(
                  width: 100, //0.8
                  child: Column(children: <Widget>[
                    userType!=4?FlatButton(
                      onPressed: () async {
                        if (item.itemCount.totalCount > 0) {
                          CouponProvider().setItem(item); 
                          Navigator.of(context).pop();
                          Navigator.of(context)
                              .pushNamed('/coupon-share')
                              .then((value) => getItems());
                        } else {
                          showToast('No Coupons to share');
                        }
                      },
                      color: Colors.orangeAccent,
                      child: Text('Share'),
                    ):SizedBox(),
                    FlatButton(
                      onPressed: () {

                          Navigator.of(context).pop();
                          CouponProvider().setItemShared(item);
                          Navigator.of(context)
                              .pushNamed('/qr-screen')
                              .then((value) => getItems());

                      },
                      color: Colors.lightGreen,
                      child: Text('Redeem'),
                    )
                  ]),
                ),
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {});
  }

  List<Widget> getSliverList() {
    List<Widget> slivers = new List();
    slivers.add(sliverAppBar());
    if (isLoading) {
      slivers.add(_buildListShimmer());
    } else {
      slivers.add(_buildPageView());

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
    List<Item> dummySearchList = List<Item>();
    dummySearchList.addAll(_coupons);
    if (query.isNotEmpty) {
      List<Item> dummyListData = List<Item>();
      dummySearchList.forEach((item) {
        if (item.itemName.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        _filteredCoupons = dummyListData;
      });
      return;
    } else {
      setState(() {
        _filteredCoupons = _coupons;
      });
    }
  }

  Future getItems({forceRefresh = false}) async {
    List<Item> _tempList;
    _tempList = await ItemProvider().fetchAndSetItems();
    setState(() {
      _coupons = _tempList;
      _filteredCoupons = _tempList;
    });
  }
}
