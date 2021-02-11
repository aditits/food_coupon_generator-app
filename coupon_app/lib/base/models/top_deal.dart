
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:coupon_app/base/asset/asset_key.dart';
import 'package:coupon_app/base/color/color_key.dart';
import 'package:coupon_app/base/utilities/color_utilities.dart';


class TopDeal {
  String title;
  String description;
  String discountedPrice;
  String originalPrice;
  String discount;
  String photo;
  String rating;
  String otherDiscount;
  String hint;
  Color colorOfCart;
  Color colorOfBoxCard;
  List<String> optionTitle;
  List<String> optionDescription;
  String totalPrice;
  String totalItem;
  Map<String, String> detail = new Map();
  String uploadedBy;
  String time;
  String hashTag;
  String priceWithUnit;
  bool isEditMode = false;
  bool isMoveTo = false;
  bool upSideDownForDiscountedPriceAndOriginalPrice = false;
  Color textColor;
  bool todayTop = false;
  int mainCount;
  String discountPurple;
  String caption;
  String html;
  IconData icon;
  Color bgColor;
  Color iconColor;
  Color iconHintColor;
  Color hintColor;
  bool isSort = false;
  List<String> images = new List();
  List<String> choose = new List();
  String price;

  List<Color> colorList = new List();

  static List<TopDeal> getDummy() {
    List<TopDeal> list = new List();
    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Trendy T-shirt Made From Cotton';
    topDeal.discountedPrice = '19.99';
    topDeal.originalPrice = '49.99';
    topDeal.discount = '48';
    topDeal.photo = AssetKey.trendyT;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Home Decor Set Of 15 Wine Glasses';
    topDeal.discountedPrice = '259.99';
    topDeal.originalPrice = '684.99';
    topDeal.discount = '30';
    topDeal.photo = AssetKey.homeDecor;
    list.add(topDeal);
    return list;
  }

  static List<TopDeal> forFirstScreenDecor() {
    List<TopDeal> list = new List();
    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Minimal Architecture Photos';
    topDeal.uploadedBy = 'Alex Menkel';
    topDeal.photo = AssetKey.minimal;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Today is the Perfect Day to be H...';
    topDeal.description = 'Happy! Of course it\'s all about';
    topDeal.photo = AssetKey.minimal;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Every design module is tested';
    topDeal.description = 'I do care about users experience';
    topDeal.photo = AssetKey.perfectDay;
    list.add(topDeal);
    return list;
  }

  static TopDeal getRecommendForFirstScreen() {
    TopDeal item = new TopDeal();
    item.title = 'I Used Unplash images here to make this card attractive';
    item.time = '2 hours ago';
    item.hashTag = '#FIGMATIPS';
    item.photo = AssetKey.trendyT;
    item.rating = '1234';
    return item;
  }

  static TopDeal forSecondScreen() {
    TopDeal topDeal = new TopDeal();
    topDeal.description =
        'Green flowering plastic item to take your home decoration to the next level';
    topDeal.originalPrice = '\$49.95';
    topDeal.discount = '30';
    topDeal.hint = 'Item in stock';
    topDeal.photo = AssetKey.trendyT;
    topDeal.rating = '1234';
    return topDeal;
  }

  static List<TopDeal> getDummyForCake() {
    List<TopDeal> list = new List();
    TopDeal item = new TopDeal();
    item.title = 'Simply follow me for updates';
    item.description = 'E-commerce design system';
    item.photo = AssetKey.showFollow;
    list.add(item);

    item = new TopDeal();
    item.title = 'Today is the Perfect Day to be H...';
    item.description = 'Happy! Of course it’s all about';
    item.photo = AssetKey.todayIs;
    list.add(item);

    item = new TopDeal();
    item.title = 'Every design module is tested';
    item.description = 'I do care about users experience';
    item.photo = AssetKey.perfectDay;
    list.add(item);
    return list;
  }

  static TopDeal getCake() {
    TopDeal item = new TopDeal();
    item.title = 'Tasty & Juicy. Fresh Arrival From Uzbekist...';
    item.time = 'New arrivals';
    item.hashTag = '9.99 \$US';
    item.priceWithUnit = '5,49 \$US / 1lb';
    item.photo = AssetKey.nfNikkor;
    item.rating = '1234';
    return item;
  }

  static List<TopDeal> getDummyForHomeFlower() {
    List<TopDeal> list = new List();
    TopDeal item = new TopDeal();
    item.title = 'Simply follow me for updates';
    item.description = 'E-commerce design system';
    item.photo = AssetKey.simpleFollow;
    list.add(item);

    item = new TopDeal();
    item.title = 'Today is the Perfect Day to be H...';
    item.description = 'Happy! Of course it’s all about';
    item.photo = AssetKey.todayIsFlower;
    list.add(item);

    item = new TopDeal();
    item.title = 'Every design module is tested';
    item.description = 'I do care about users experience';
    item.photo = AssetKey.perfectDay;
    list.add(item);
    return list;
  }

  static List<TopDeal> getDummyForHomeCake() {
    List<TopDeal> list = new List();
    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Trendy T-shirt Made From Cotton';
    topDeal.discountedPrice = '19.99';
    topDeal.originalPrice = '49.99';
    topDeal.discount = '48';
    topDeal.photo = AssetKey.trendyTShirt;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Home Decor Set Of 15 Wine Glasses';
    topDeal.discountedPrice = '259.99';
    topDeal.originalPrice = '684.99';
    topDeal.discount = '30';
    topDeal.photo = AssetKey.nikonEod;
    list.add(topDeal);
    return list;
  }

  static List<TopDeal> getDummyForFlower() {
    List<TopDeal> list = new List();
    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Trendy T-shirt Made From Cotton';
    topDeal.discountedPrice = '19.99';
    topDeal.originalPrice = '49.99';
    topDeal.discount = '48';
    topDeal.photo = AssetKey.trendyTFlower;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Home Decor Set Of 15 Wine Glasses';
    topDeal.discountedPrice = '259.99';
    topDeal.originalPrice = '684.99';
    topDeal.discount = '30';
    topDeal.photo = AssetKey.homeDecorFlower;
    list.add(topDeal);

    return list;
  }

  static TopDeal getFlower() {
    TopDeal item = new TopDeal();
    item.title = 'Tasty & Juicy. Fresh Arrival From Uzbekist...';
    item.time = 'New arrivals';
    item.hashTag = '9.99 \$US';
    item.priceWithUnit = '5,49 \$US / 1lb';
    item.photo = AssetKey.tastyJuicyFlower;
    item.rating = '1234';
    return item;
  }

  static List<TopDeal> getDummyForClock() {
    List<TopDeal> list = new List();
    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Little Black Book For Perfect Reading';
    topDeal.discountedPrice = '19.99';
    topDeal.originalPrice = '39.99';
    topDeal.discount = '48';
    topDeal.photo = AssetKey.perfectDay;
    topDeal.rating = '12345';
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Wrist Watch Swiss Made';
    topDeal.discountedPrice = '19.99';
    topDeal.originalPrice = '39.99';
    topDeal.discount = '48';
    topDeal.otherDiscount = '30';
    topDeal.photo = AssetKey.wristWatch;
    list.add(topDeal);

    return list;
  }

  static List<TopDeal> getDummyForFruit() {
    List<TopDeal> list = new List();
    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Perfect Shoes For Every Season';
    topDeal.discountedPrice = '5.99';
    topDeal.originalPrice = '9.99';
    topDeal.photo = AssetKey.perfectShoes;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Amazing Shoes For Every Season';
    topDeal.discountedPrice = '29.99';
    topDeal.originalPrice = '89.99';
    topDeal.photo = AssetKey.amazingShoes;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Leather Shoes For Last Year';
    topDeal.discountedPrice = '19.99';
    topDeal.originalPrice = '25.99';
    topDeal.photo = AssetKey.leatherShoes;
    list.add(topDeal);

    return list;
  }

  static List<TopDeal> getDummyForCamera() {
    List<TopDeal> list = new List();
    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Nikon EOD. Digital Camera For Good Guys';
    topDeal.discountedPrice = '256.99';
    topDeal.photo = AssetKey.nikonEod;
    topDeal.rating = '12345';
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'AF Nikkor, 24-50mm, 1:3.3-4.5. Hyper Lens, Free shipping';
    topDeal.discountedPrice = '256.99';
    topDeal.photo = AssetKey.nfNikkor;
    topDeal.rating = '12345';
    list.add(topDeal);

    return list;
  }

  static List<TopDeal> getDummyForKitchen() {
    List<TopDeal> list = new List();
    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Little Black Book For Perfect Reading';
    topDeal.discountedPrice = '19.99';
    topDeal.originalPrice = '39.99';
    topDeal.discount = '48';
    topDeal.photo = AssetKey.littleKitchen;
    topDeal.rating = '12345';
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Wrist Watch Swiss Made';
    topDeal.discountedPrice = '19.99';
    topDeal.originalPrice = '39.99';
    topDeal.discount = '48';
    topDeal.otherDiscount = '30';
    topDeal.photo = AssetKey.wristMakeUp;
    list.add(topDeal);

    return list;
  }

  static List<TopDeal> getDummyForMusic() {
    List<TopDeal> list = new List();
    TopDeal topDeal = new TopDeal();
    topDeal.title =
        'Photography of Woman Listening to Music. When photography of Woman Listening to Music';
    topDeal.discountedPrice = '256.99';
    topDeal.photo = AssetKey.photography;
    topDeal.rating = '12345';
    topDeal.colorOfBoxCard = Colors.white;
    topDeal.colorOfCart = ColorKey.registerBox;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title =
        'Close-up Photo of a Woman Listening to Music Close-up Photo of a Woman';
    topDeal.discountedPrice = '256.99';
    topDeal.photo = AssetKey.cloneUp;
    topDeal.rating = '12345';
    topDeal.colorOfBoxCard = ColorKey.registerBox;
    topDeal.colorOfCart = Colors.white;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title =
        'Photography of Woman Listening to Music. When photography of Woman Listening to Music';
    topDeal.discountedPrice = '256.99';
    topDeal.photo = AssetKey.photographyMusic;
    topDeal.rating = '12345';
    topDeal.colorOfBoxCard = Colors.transparent;
    topDeal.colorOfCart = Colors.white;
    list.add(topDeal);

    return list;
  }

  static TopDeal getChairDetail() {
    TopDeal topDeal = new TopDeal();
    topDeal.title =
        'Set of Leather Clutch & Gloves Made with Design System Kit';
    topDeal.hint = 'Item in stock';
    topDeal.description =
        'It\'s Figma design tool with Design System UI kit for prototyping any apps faster. Accelerate design and development time by up to 50%';
    topDeal.originalPrice = '\$49.99';
    topDeal.discount = '30';
    topDeal.rating = '12345';
    return topDeal;
  }

  static TopDeal getFoodDetail() {
    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Double Cheese-Burger, Fried potato, Heinz Ketchup included';
    topDeal.hint = 'Get second for free!';
    topDeal.description =
        'The architecture of this material design kit is based on usage nested components in Figma.Thoughtful relationships between the elements allows to perform global changes for components used for both of mobile and desktop layouts within less actions. ';
    topDeal.originalPrice = '\$9.95';
    topDeal.discount = '30';
    topDeal.rating = '12345';
    topDeal.optionTitle = [
      'Select portion',
      'Choose topping',
      'Additional ingredients'
    ];
    topDeal.optionDescription = [
      'Portion not selected',
      'No topping were chosen',
      'No ingredients selected'
    ];
    topDeal.totalPrice = '\$24.90';
    topDeal.totalItem = '4';
    return topDeal;
  }

  static TopDeal getRolexDetail() {
    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Rolex Stainless Steel';
    topDeal.hint = 'FREE shipping available!';
    topDeal.description =
        'Prototype mobile and desktop apps faster! Accelerate design and development time';
    topDeal.originalPrice = '\$19.95';
    topDeal.optionTitle = [
      'Select wrist size',
    ];
    topDeal.optionDescription = [
      'Wrist size not selected',
    ];
    topDeal.detail['Conditions'] = 'New item in box';
    topDeal.detail['Amount sold'] = '1442 items';
    topDeal.detail['Item status'] = 'Available to ship';
    topDeal.detail['Brand'] = 'Rolex';
    topDeal.detail['Size'] = 'S, M, XL';
    topDeal.detail['Material'] = 'Stainless steel';
    topDeal.detail['Manufacturer'] = 'Swiss made';
    return topDeal;
  }

  static List<TopDeal> getListCake() {
    List<TopDeal> list = new List();
    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Example of your saved item';
    topDeal.time = 'Saved 8 mins ago';
    topDeal.discountedPrice = '19.99';
    topDeal.originalPrice = '9.99';
    topDeal.photo = AssetKey.exampleOf;
    topDeal.isEditMode = false;
    topDeal.isMoveTo = false;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'One more saved item in your list';
    topDeal.time = 'Saved 2 days ago';
    topDeal.discountedPrice = '19.99';
    topDeal.originalPrice = '9.99';
    topDeal.photo = AssetKey.oneMore;
    topDeal.isEditMode = false;
    topDeal.isMoveTo = false;
    list.add(topDeal);
    return list;
  }

  static List<TopDeal> getListCakeForPageFour() {
    List<TopDeal> list = new List();
    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Example of your saved item';
    topDeal.time = 'Saved 8 mins ago';
    topDeal.discountedPrice = '19.99';
    topDeal.originalPrice = '9.99';
    topDeal.photo = AssetKey.exampleFlower;
    topDeal.isEditMode = false;
    topDeal.isMoveTo = true;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'One more saved item in your list';
    topDeal.time = 'Saved 2 days ago';
    topDeal.discountedPrice = '19.99';
    topDeal.originalPrice = '9.99';
    topDeal.photo = AssetKey.hand;
    topDeal.isEditMode = false;
    topDeal.isMoveTo = true;
    list.add(topDeal);
    return list;
  }

  static List<TopDeal> getListFlower() {
    List<TopDeal> list = new List();
    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Example of your saved item';
    topDeal.time = 'Saved 8 mins ago';
    topDeal.discountedPrice = '9.99';
    topDeal.originalPrice = '19.99';
    topDeal.photo = AssetKey.homeDecorFlower;
    topDeal.isEditMode = true;
    topDeal.isMoveTo = true;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'One more saved item in your list';
    topDeal.time = 'Saved 2 days ago';
    topDeal.discountedPrice = '9.99';
    topDeal.originalPrice = '19.99';
    topDeal.photo = AssetKey.hand;
    topDeal.isEditMode = true;
    topDeal.isMoveTo = true;
    list.add(topDeal);
    return list;
  }

  static List<TopDeal> getListFood() {
    List<TopDeal> list = new List();
    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Example of your saved item';
    topDeal.time = 'Saved 8 mins ago';
    topDeal.discountedPrice = '9.99';
    topDeal.originalPrice = '19.99';
    topDeal.photo = AssetKey.nikonEod;
    topDeal.isEditMode = true;
    topDeal.isMoveTo = true;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'One more saved item in your list';
    topDeal.time = 'Saved 2 days ago';
    topDeal.discountedPrice = '9.99';
    topDeal.originalPrice = '19.99';
    topDeal.photo = AssetKey.nfNikkor;
    topDeal.isEditMode = true;
    topDeal.isMoveTo = true;
    list.add(topDeal);
    return list;
  }

  static List<TopDeal> getMostSearched() {
    List<TopDeal> list = new List();
    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Hand Cream';
    topDeal.photo = AssetKey.hand;
    topDeal.isMoveTo = true;
    topDeal.colorOfBoxCard = ColorKey.registerBox;
    topDeal.textColor = Colors.white;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Lipstick';
    topDeal.photo = AssetKey.lipstick;
    topDeal.colorOfBoxCard = ColorKey.cartColor;
    topDeal.textColor = Colors.black;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Alarm Clock';
    topDeal.photo = AssetKey.perfectDay;
    topDeal.colorOfBoxCard = ColorKey.registerBox;
    topDeal.textColor = Colors.white;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Business gift';
    topDeal.photo = AssetKey.business;
    topDeal.colorOfBoxCard = ColorKey.registerBox;
    topDeal.textColor = Colors.white;
    list.add(topDeal);
    return list;
  }

  static List<TopDeal> getSearch() {
    List<TopDeal> list = new List();
    TopDeal topDeal = new TopDeal();
    topDeal.title = 'design';
    topDeal.hint = 'system kit';
    topDeal.description = 'in Figma templates';
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'design';
    topDeal.hint = 'faster';
    topDeal.description = 'in Web development';
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'design';
    topDeal.hint = 'everything';
    topDeal.description = 'in UI freebies';
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'design';
    topDeal.hint = 'material design';
    topDeal.description = 'in Material design';
    list.add(topDeal);
    return list;
  }

  static List<TopDeal> getColor() {
    List<TopDeal> list = new List();
    TopDeal topDeal = new TopDeal();
    topDeal.title = 'All colors';
    topDeal.hint = '1024';
    topDeal.colorOfBoxCard = null;
    topDeal.isMoveTo = false;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Turquoise';
    topDeal.hint = '16';
    topDeal.colorOfBoxCard = ColorUtilities.getColorFromHex('1ABC9C');
    topDeal.isMoveTo = false;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Emerland';
    topDeal.hint = '104';
    topDeal.colorOfBoxCard = ColorUtilities.getColorFromHex('2ECC71');
    topDeal.isMoveTo = false;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Peterriver';
    topDeal.hint = '1';
    topDeal.colorOfBoxCard = ColorUtilities.getColorFromHex('3498DB');
    topDeal.isMoveTo = true;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Amethyst';
    topDeal.hint = '256';
    topDeal.colorOfBoxCard = ColorUtilities.getColorFromHex('9B59B6');
    topDeal.isMoveTo = false;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Wetasphalt';
    topDeal.hint = '1';
    topDeal.colorOfBoxCard = ColorUtilities.getColorFromHex('34495E');
    topDeal.isMoveTo = true;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Sunflower';
    topDeal.hint = '1';
    topDeal.colorOfBoxCard = ColorUtilities.getColorFromHex('F1C40F');
    topDeal.isMoveTo = true;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Carrot';
    topDeal.hint = '16';
    topDeal.colorOfBoxCard = ColorUtilities.getColorFromHex('E67E22');
    topDeal.isMoveTo = false;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Pomegranate';
    topDeal.hint = '2';
    topDeal.colorOfBoxCard = ColorUtilities.getColorFromHex('C0392B');
    topDeal.isMoveTo = false;
    list.add(topDeal);
    return list;
  }

  static List<TopDeal> getStaggeringItem() {
    List<TopDeal> list = new List();
    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Close-up Photo of a Woman Listening';
    topDeal.discountedPrice = '19.99';
    topDeal.originalPrice = '49.99';
    topDeal.discount = '48';
    topDeal.photo = AssetKey.wedding;
    topDeal.mainCount = 3;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'The sample of shoes made from leather';
    topDeal.discountedPrice = '19.99';
    topDeal.originalPrice = '49.99';
    topDeal.discount = '48';
    topDeal.photo = AssetKey.theSample;
    topDeal.mainCount = 3;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Old White Stylish Sofa';
    topDeal.discountedPrice = '19.99';
    topDeal.originalPrice = '49.99';
    topDeal.discount = '48';
    topDeal.photo = AssetKey.oldWhite;
    topDeal.mainCount = 3;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Photography of Woman Listening';
    topDeal.discountedPrice = '19.99';
    topDeal.originalPrice = '39.99';
    topDeal.discount = '48';
    topDeal.todayTop = true;
    topDeal.photo = AssetKey.photographyWomen;
    topDeal.mainCount = 3;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Photography of Woman Listening';
    topDeal.discountedPrice = '19.99';
    topDeal.originalPrice = '39.99';
    topDeal.discount = '48';
    topDeal.todayTop = true;
    topDeal.mainCount = 4;
    topDeal.photo = AssetKey.photographyMen;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Please Buy This Apple Now';
    topDeal.discountedPrice = '19.99';
    topDeal.originalPrice = '39.99';
    topDeal.discount = '48';
    topDeal.photo = AssetKey.pleaseBuy;
    topDeal.mainCount = 4;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Close-up Photo of a Woman Listening';
    topDeal.discountedPrice = '19.99';
    topDeal.originalPrice = '49.99';
    topDeal.discount = '48';
    topDeal.photo = AssetKey.earphone;
    topDeal.mainCount = 3;
    list.add(topDeal);
    return list;
  }

  static List<TopDeal> getDeal() {
    List<TopDeal> list = new List();
    TopDeal topDeal = new TopDeal();
    topDeal.html =
        '<b>Silen Lake</b>. Travel tour of your dreams. Pick now and start your journey';
    topDeal.discountedPrice = '256.99';
    topDeal.photo = AssetKey.silent;
    topDeal.rating = '12345';
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.html =
        'Travel tour of your dreams. Pick now and start your journey';
    topDeal.discountedPrice = '256.99';
    topDeal.photo = AssetKey.travel;
    topDeal.rating = '12345';
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.html =
        '<b>Eiffel Tower</b>. Travel tour of your dreams. Pick now and start';
    topDeal.discountedPrice = '256.99';
    topDeal.photo = AssetKey.lipstick;
    topDeal.rating = '12345';
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.html =
        'Travel tour of your dreams. Pick now and start your journey';
    topDeal.discountedPrice = '256.99';
    topDeal.photo = AssetKey.perfectDay;
    topDeal.rating = '12345';
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.html =
        '<b>Dominicana</b>. It’s time to visit. Scenic View of Beach. Travel tour of your dreams. Pick now and start your journey. ';
    topDeal.discountedPrice = '256.99';
    topDeal.photo = AssetKey.dominicana;
    topDeal.rating = '12345';
    list.add(topDeal);

    return list;
  }

  static List<TopDeal> getFruit() {
    List<TopDeal> list = new List();
    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Grapes';
    topDeal.photo = AssetKey.f1;
    topDeal.colorOfBoxCard = Colors.black;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Label';
    topDeal.photo = AssetKey.f2;
    topDeal.colorOfBoxCard = Colors.black;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Mixed';
    topDeal.photo = AssetKey.f3;
    topDeal.colorOfBoxCard = Colors.black;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Bananas';
    topDeal.photo = AssetKey.f4;
    topDeal.colorOfBoxCard = Colors.black;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Jablokawa';
    topDeal.photo = AssetKey.f5;
    topDeal.colorOfBoxCard = Colors.black;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Cake';
    topDeal.photo = AssetKey.f6;
    topDeal.colorOfBoxCard = Colors.black;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Mixed';
    topDeal.photo = AssetKey.f7;
    topDeal.colorOfBoxCard = ColorKey.registerBox;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Pirog Tasty';
    topDeal.photo = AssetKey.f2;
    topDeal.colorOfBoxCard = ColorKey.registerBox;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Grapes';
    topDeal.photo = AssetKey.f1;
    topDeal.colorOfBoxCard = ColorKey.registerBox;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = '20sp Title';
    topDeal.photo = AssetKey.f3;
    topDeal.colorOfBoxCard = ColorKey.registerBox;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Mixed';
    topDeal.photo = AssetKey.f5;
    topDeal.colorOfBoxCard = ColorKey.registerBox;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Bananas';
    topDeal.photo = AssetKey.f4;
    topDeal.colorOfBoxCard = ColorKey.registerBox;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Jablokawa';
    topDeal.photo = AssetKey.f8;
    topDeal.colorOfBoxCard = ColorKey.registerBox;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Double Rows Caption For Juicy Blueberry';
    topDeal.photo = AssetKey.f9;
    topDeal.colorOfBoxCard = ColorKey.registerBox;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Mixed';
    topDeal.photo = AssetKey.f10;
    topDeal.colorOfBoxCard = ColorKey.registerBox;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Blackberry Kush';
    topDeal.photo = AssetKey.f11;
    topDeal.colorOfBoxCard = ColorKey.registerBox;
    list.add(topDeal);

    return list;
  }

  static List<TopDeal> getForProfileOne() {
    List<TopDeal> list = new List();
    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Contact information';
    topDeal.description = 'Caption for contact information';
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Notification settings';
    topDeal.description = 'Caption for notification settings';
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Your balance';
    topDeal.description = 'Your balance and caption';
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'One more item';
    topDeal.description = 'Put your caption here';
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'One more item';
    topDeal.description = 'Put your caption here';
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'One more item';
    topDeal.description = 'Put your caption here';
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'One more item';
    topDeal.description = 'Put your caption here';
    list.add(topDeal);

    return list;
  }

  static List<TopDeal> getForProfileTwo() {
    List<TopDeal> list = new List();

    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Your order 34567';
    topDeal.time = '5 days ago';
    topDeal.icon = Icons.shopping_basket;
    topDeal.description =
        'Milk, Sugar, Cream, Boots, Shoes, Trouses and Material Design System';
    topDeal.hint = 'Delivered successful!';
    topDeal.colorOfCart = ColorKey.darkGrey;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Your order 56789';
    topDeal.time = '8 days ago';
    topDeal.icon = Icons.shopping_basket;
    topDeal.description = 'Material Design System For Figma';
    topDeal.hint = 'Delivered successful!';
    topDeal.colorOfCart = ColorKey.darkGrey;

    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Order cancelled';
    topDeal.time = '15 years ago';
//    topDeal.icon = OMIcons.block;
    topDeal.description = 'Due to unexpected error!';
    topDeal.hint = '';
    topDeal.colorOfCart = ColorKey.cartColor;
    list.add(topDeal);

    return list;
  }

  static List<TopDeal> getForProfileThree() {
    List<TopDeal> list = new List();

    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Your order 34567';
    topDeal.hint = AssetKey.f19;
    topDeal.description = 'Delivered successful!';
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Your order 34567';
    topDeal.description = 'Delivered successful!';
    topDeal.hint = AssetKey.f19;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Claimed Super Discount';
    topDeal.description = 'Delivered successful!';
    topDeal.hint = AssetKey.f18;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Claimed Super Discount';
    topDeal.description = 'Delivered successful!';
    topDeal.hint = AssetKey.f17;
    list.add(topDeal);

    return list;
  }

  static List<TopDeal> getForProfileFive() {
    List<TopDeal> list = new List();

    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Your order 34567';
    topDeal.hint = AssetKey.f22;
    topDeal.description = 'Delivered successful!';
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Your order 34567';
    topDeal.description = 'Delivered successful!';
    topDeal.hint = AssetKey.f22;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Claimed Super Discount';
    topDeal.description = 'Delivered successful!';
    topDeal.hint = AssetKey.f18;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Claimed Super Discount';
    topDeal.description = 'Delivered successful!';
    topDeal.hint = AssetKey.f17;
    list.add(topDeal);

    return list;
  }

  static List<TopDeal> getForActivityOne() {
    List<TopDeal> list = new List();

    TopDeal topDeal = new TopDeal();
    topDeal.title = 'tineczka';
    topDeal.hint = ' on Instagram';
    topDeal.photo = AssetKey.f25;
    topDeal.description =
        'Your Facebook friend Martisha\nSpivakova is on the social net!';
    topDeal.isMoveTo = true;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'salondre';
    topDeal.hint = ' liked your photo';
    topDeal.photo = AssetKey.f15;
    topDeal.description = '2 week ago';
    topDeal.isMoveTo = false;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Tom, Bob, And';
    topDeal.hint = ' +350 users';
    topDeal.photo = AssetKey.f38;
    topDeal.description = 'Started following you';
    topDeal.isMoveTo = false;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'tineczka';
    topDeal.hint = ' Added you';
    topDeal.photo = AssetKey.f25;
    topDeal.description = '358 mutual friends';
    topDeal.isMoveTo = true;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'kupka215';
    topDeal.hint = ' Added you';
    topDeal.photo = AssetKey.f37;
    topDeal.description =
        'Your Facebook friend Martisha Spiva\nis on the social nets';
    topDeal.isMoveTo = true;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'salondre';
    topDeal.hint = ' liked your photo';
    topDeal.photo = AssetKey.f15;
    topDeal.description = '2 week ago';
    topDeal.isMoveTo = false;
    list.add(topDeal);
    return list;
  }

  static List<TopDeal> getForActivityTwo() {
    List<TopDeal> list = new List();

    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Roman Kamushken';
    topDeal.hint = 'Commented on a comment';
    topDeal.time = '4 days ago';
    topDeal.photo = AssetKey.f14;
    topDeal.description =
        '“There is nothing special about this type of buttons. It’s quite simple, placed into component container and with resizing constraints set properly to make it scalable with ease”';
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'tineczka';
    topDeal.hint = 'Created new post';
    topDeal.time = '4 days ago';
    topDeal.photo = AssetKey.f25;
    topDeal.description =
        '“into component container and with resizing constraints set????”';
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Tom Kuwalskij';
    topDeal.hint = 'Replied to ';
    topDeal.rating = '@pukerdrondr';
    topDeal.time = '4 days ago';
    topDeal.photo = AssetKey.f38;
    topDeal.description =
        '“special about this type of buttons. It’s quite simple, placed into component container and with resizing constraints”';
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Roman Kamushken';
    topDeal.hint = 'Commented on a comment';
    topDeal.time = '4 days ago';
    topDeal.photo = AssetKey.f14;
    topDeal.description =
        '“There is nothing special about this type of buttons. It’s quite simple, placed into component container and with resizing constraints set properly to make it scalable with ease”';
    list.add(topDeal);
    return list;
  }

  static List<TopDeal> getForActivityThree() {
    List<TopDeal> list = new List();

    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Mike Fantomas';
    topDeal.hint = ' @mikefan';
    topDeal.time = '54m';
    topDeal.photo = AssetKey.f39;
    topDeal.description =
        '“There is nothing special about this type of buttons. It’s quite simple, placed into component container and with resizing constraints set properly to make it scalable with ease”';
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Sandra Mikendoller';
    topDeal.hint = ' @sashka500';
    topDeal.time = '1h 24m';
    topDeal.photo = AssetKey.f15;
    topDeal.description =
        'It’s quite simple, placed into component container and with resizing constraints set properly to make it scalable with ease”';
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Helena Lo';
    topDeal.hint = ' @step_by_step';
    topDeal.time = '54m';
    topDeal.photo = AssetKey.f38;
    topDeal.description =
        'check out awesome updates for Android design kit for Figma. ';
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Mike Fantomas';
    topDeal.hint = ' @mikefan';
    topDeal.time = '54m';
    topDeal.photo = AssetKey.f39;
    topDeal.description =
        '“There is nothing special about this type of buttons. It’s quite simple, placed into component container and with resizing constraints set properly to make it scalable with ease”';
    list.add(topDeal);
    return list;
  }

  static List<TopDeal> getForActivityFour() {
    List<TopDeal> list = new List();

    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Roman Kamushken';
    topDeal.hint = '117 replays';
    topDeal.time = '2 days ago';
    topDeal.photo = AssetKey.f14;
    topDeal.description =
        'Check out awesome updates for Android design kit for Figma. Now more screens and more categories.';
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Tina Turbina';
    topDeal.hint = '117 replays';
    topDeal.time = '18 minutes ago';
    topDeal.photo = AssetKey.f25;
    topDeal.description =
        '“into component container and with resizing constraints set????”';
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Tomek Kuwalskij';
    topDeal.hint = '117 replays';
    topDeal.time = '2 days ago';
    topDeal.photo = AssetKey.f38;
    topDeal.description =
        '“into component container and with resizing constraints set????”';
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Roman Kamushken';
    topDeal.hint = '117 replays';
    topDeal.time = '2 days ago';
    topDeal.photo = AssetKey.f14;
    topDeal.description =
        'Check out awesome updates for Android design kit for Figma. Now more screens and more categories.';
    list.add(topDeal);
    return list;
  }

  static List<TopDeal> topPick() {
    List<TopDeal> list = new List();

    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Lovers’ Principles Amaze';
    topDeal.hint = '126 found';
    topDeal.photo = AssetKey.f42;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Just Be Free';
    topDeal.hint = '126 found';
    topDeal.photo = AssetKey.f47;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'I Just Going To Put Here Any Caption';
    topDeal.hint = '126 found';
    topDeal.photo = AssetKey.f46;
    list.add(topDeal);
    return list;
  }

  static List<TopDeal> getRecommend() {
    List<TopDeal> list = new List();

    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Once Upon a Time On The Carwash';
    topDeal.hint = 'by Malcolm Pukendrondre';
    topDeal.photo = AssetKey.f45;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'The Power Of Gear';
    topDeal.hint = 'by Joanna Coors';
    topDeal.photo = AssetKey.f44;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Make Pizdato';
    topDeal.hint = 'by Roman Kamushken';
    topDeal.photo = AssetKey.f43;
    list.add(topDeal);
    return list;
  }

  static List<TopDeal> getYourTopPick() {
    List<TopDeal> list = new List();

    TopDeal topDeal = new TopDeal();
    topDeal.title = 'VECTOR';
    topDeal.photo = AssetKey.f54;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'FONTS';
    topDeal.photo = AssetKey.f48;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'CARDS';
    topDeal.hint = AssetKey.f55;
    topDeal.photo = AssetKey.f49;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = '80\'S';
    topDeal.photo = AssetKey.f45;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'ABSTRACT';
    topDeal.photo = AssetKey.f50;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'FEMME\nFATALE';
    topDeal.photo = AssetKey.f51;
    list.add(topDeal);
    return list;
  }

  static List<TopDeal> getSuggestions() {
    List<TopDeal> list = new List();

    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Most Influencing Question Of The Twentyth Century';
    topDeal.hint = '126 times read';
    topDeal.photo = AssetKey.f30;
    list.add(topDeal);
    topDeal = new TopDeal();
    topDeal.title = 'What’s The Difference Between People’s Culture';
    topDeal.hint = '64 times read';
    topDeal.photo = AssetKey.f52;
    list.add(topDeal);
    topDeal = new TopDeal();
    topDeal.title = 'Most Influencing Question Of The Twentyth Century';
    topDeal.hint = '126 times read';
    topDeal.photo = AssetKey.f53;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'What’s The Difference Between People’s Culture';
    topDeal.hint = '64 times read';
    topDeal.photo = AssetKey.f43;
    list.add(topDeal);
    return list;
  }

  static List<TopDeal> getSocialOne() {
    List<TopDeal> list = new List();

    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Maria Vanucci';
    topDeal.hint = ' shared a photo';
    topDeal.time = '128 hours ago, from Somewhere';
    topDeal.description =
        'Since I’ve started to use Android Design System 🙌 for Figma my tasks became solved much more faster than before 👀';
    topDeal.discountedPrice = '256 likes';
    topDeal.discountPurple = '15 comments • 8 reposts';
    topDeal.photo = AssetKey.f57;
    topDeal.rating = AssetKey.f25;
    topDeal.isMoveTo = false;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Paolina Shlushko';
    topDeal.hint = ' shared a photo';
    topDeal.time = '128 hours ago, from Somewhere';
    topDeal.description =
        'I am so glad to add additional light and modern Material Design theme. Hope you will like it, guys!';
    topDeal.discountedPrice = '256 likes';
    topDeal.discountPurple = '15 comments • 8 reposts';
    topDeal.photo = AssetKey.f56;
    topDeal.rating = AssetKey.f15;
    topDeal.isMoveTo = false;
    list.add(topDeal);
    return list;
  }

  static List<TopDeal> getSocialTwo() {
    List<TopDeal> list = new List();

    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Maria Vanucci';
    topDeal.hint = '';
    topDeal.time = '128 hours ago';
    topDeal.description =
        'I am so glad to add additional light and modern Material Design theme. Hope you will like it, guys!';
    topDeal.discountedPrice = '128 likes';
    topDeal.discountPurple = '15 comments\n8 reposts';
    topDeal.photo = AssetKey.f60;
    topDeal.rating = AssetKey.f25;
    topDeal.isMoveTo = true;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'CoolestApps';
    topDeal.hint = '';
    topDeal.time = '35 years ago';
    topDeal.description =
        'After detaching styles are still customizable by Master-components';
    topDeal.discountedPrice = '128 likes';
    topDeal.discountPurple = '15 comments\n8 reposts';
    topDeal.photo = AssetKey.f61;
    topDeal.rating = AssetKey.f63;
    topDeal.isMoveTo = true;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Awesome Things';
    topDeal.hint = '';
    topDeal.time = '128 hours ago';
    topDeal.description =
        'If you need less strings of descripion - detach the instance and edit';
    topDeal.discountedPrice = '128 likes';
    topDeal.discountPurple = '15 comments\n8 reposts';
    topDeal.photo = AssetKey.f62;
    topDeal.rating = AssetKey.f58;
    topDeal.isMoveTo = true;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Marik Vanucka';
    topDeal.hint = '';
    topDeal.time = '128 hours ago';
    topDeal.description =
        'I am so glad to add additional light and modern Material Design theme. Hope you will like it, guys!';
    topDeal.discountedPrice = '128 likes';
    topDeal.discountPurple = '15 comments\n8 reposts';
    topDeal.photo = AssetKey.f59;
    topDeal.rating = AssetKey.f37;
    topDeal.isMoveTo = true;
    list.add(topDeal);
    return list;
  }

  static List<TopDeal> getSocialThree() {
    List<TopDeal> list = new List();

    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Paolina Shlushko ';
    topDeal.hint =
        'www.setproduct.com/mobilesystem #figma #design #system #ui #web #application #fapapp';
    topDeal.time = '@pshlushko • 7h';
    topDeal.description =
        'I am so glad to add additional light and modern Material Design theme 👊👊👊 Hope you will like it, guys! 👍';
    topDeal.photo = AssetKey.f56;
    topDeal.rating = AssetKey.f15;
    topDeal.isMoveTo = false;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Mike Chwan ';
    topDeal.hint = '#figma #design #system #ui #web #application #fapapp';
    topDeal.time = '@mchwan • 7h';
    topDeal.description =
        'Every time I need less text I simply detach and rescale items inside';
    topDeal.photo = AssetKey.f64;
    topDeal.rating = AssetKey.f39;
    topDeal.isMoveTo = false;
    list.add(topDeal);

    return list;
  }

  static List<TopDeal> getSocialFour() {
    List<TopDeal> list = new List();

    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Paolina Shlushko';
    topDeal.hint = '#figma #design #system #ui #web #application #fapapp';
    topDeal.time = '@pshlushko • 7h';
    topDeal.description = 'Hope you will like it, guys! 👍';
    topDeal.photo = AssetKey.f69;
    topDeal.rating = AssetKey.f15;
    topDeal.isMoveTo = true;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Robert Sketcher';
    topDeal.hint = '';
    topDeal.time = '@robsketcher • 15m';
    topDeal.description =
        'I just filled the same card component with new dark photo and it looks good! 🙏';
    topDeal.photo = AssetKey.f65;
    topDeal.rating = AssetKey.f37;
    topDeal.isMoveTo = true;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Paolina Shlushko';
    topDeal.hint = '@figmahey #ui #web #application #fapapp';
    topDeal.time = '@figmadesigner • 15m';
    topDeal.description = 'Just got my new Figma furniture. Satisfied! ';
    topDeal.photo = AssetKey.f66;
    topDeal.rating = AssetKey.f15;
    topDeal.isMoveTo = true;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Ice Tube';
    topDeal.hint = '#hippop';
    topDeal.time = '@pshlushko • 7h';
    topDeal.description =
        'First time I took a mic in my hand I suddenly started 👌 rapping. So no secrets ';
    topDeal.photo = AssetKey.f67;
    topDeal.rating = AssetKey.f38;
    topDeal.isMoveTo = true;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Paolina Shlushko';
    topDeal.hint = '#figma #design #system #ui #web #application #fapapp';
    topDeal.time = '@pshlushko • 7h';
    topDeal.description = 'Hope you will like it, guys! 👍';
    topDeal.photo = AssetKey.f68;
    topDeal.rating = AssetKey.f15;
    topDeal.isMoveTo = true;
    list.add(topDeal);

    return list;
  }

  static List<TopDeal> getSocialFive() {
    List<TopDeal> list = new List();

    TopDeal topDeal = new TopDeal();
    topDeal.time = 'Mar 31';
    topDeal.description =
        'Started to use Android Design System for Figma to solve tasks much more faster than before';
    topDeal.colorList = new List();
    topDeal.colorList.add(Colors.grey);
    topDeal.colorList.add(ColorKey.cartColor);
    topDeal.colorList.add(Colors.red);
    topDeal.colorList.add(ColorKey.greenColor);
    topDeal.colorList.add(ColorKey.registerBox);
    topDeal.colorList.add(ColorKey.blueColor);
    topDeal.colorList.add(ColorKey.orangeColor);
    topDeal.colorList.add(ColorKey.lightBlueColor);
    topDeal.colorList.add(ColorKey.yellowColor);
    topDeal.textColor = Colors.white;
    topDeal.colorOfCart = ColorKey.lightPurpleColor;
    topDeal.colorOfBoxCard = ColorKey.colorPurple;
    topDeal.images.add(AssetKey.f73);
    topDeal.images.add(AssetKey.f70);
    topDeal.images.add(AssetKey.f71);
    topDeal.images.add(AssetKey.f72);
    topDeal.todayTop = false;
    topDeal.isMoveTo = false;
    topDeal.bgColor = Colors.white;
    topDeal.iconColor = ColorKey.thumbColor;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.time = 'Mar 28';
    topDeal.description =
        'This new screens for version 1.3 is absolutelly stunning.';
    topDeal.colorList = new List();
    topDeal.colorList.add(Colors.grey);
    topDeal.colorList.add(ColorKey.cartColor);
    topDeal.colorList.add(Colors.red);
    topDeal.textColor = Colors.black;
    topDeal.colorOfCart = ColorKey.accountColor;
    topDeal.colorOfBoxCard = ColorKey.lightGreyColor;
    topDeal.images.add(AssetKey.f70);
    topDeal.images.add(AssetKey.f73);
    topDeal.todayTop = true;
    topDeal.isMoveTo = false;
    topDeal.bgColor = Colors.white;
    topDeal.iconColor = ColorKey.thumbColor;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.description =
        'Website redesign with useful goods for Figma made by Setproduct one-guy-firm :)';
    topDeal.colorList = new List();
    topDeal.time = 'Mar 31';
    topDeal.colorList.add(ColorKey.lightBlueColor);
    topDeal.colorList.add(ColorKey.orangeColor);
    topDeal.colorList.add(Colors.red);
    topDeal.colorList.add(ColorKey.cartColor);
    topDeal.colorList.add(ColorKey.registerBox);
    topDeal.textColor = Colors.black;
    topDeal.colorOfCart = ColorKey.accountColor;
    topDeal.colorOfBoxCard = ColorKey.lightGreyColor;
    topDeal.images.add(AssetKey.f72);
    topDeal.todayTop = false;
    topDeal.isMoveTo = true;
    topDeal.bgColor = Colors.white;
    topDeal.iconColor = ColorKey.thumbColor;
    list.add(topDeal);
    return list;
  }

  static List<TopDeal> getSocialSix() {
    List<TopDeal> list = new List();

    TopDeal topDeal = new TopDeal();
    topDeal.time = 'Mar 28';
    topDeal.description =
        'This new screens for version 1.3 is absolutelly stunning.';
    topDeal.colorList = new List();
    topDeal.colorList.add(Colors.grey);
    topDeal.colorList.add(ColorKey.cartColor);
    topDeal.colorList.add(Colors.red);
    topDeal.textColor = Colors.black;
    topDeal.colorOfCart = ColorKey.accountColor;
    topDeal.colorOfBoxCard = ColorKey.lightGreyColor;
    topDeal.images.add(AssetKey.f70);
    topDeal.images.add(AssetKey.f73);
    topDeal.todayTop = true;
    topDeal.isMoveTo = false;
    topDeal.bgColor = Colors.white;
    topDeal.iconColor = ColorKey.thumbColor;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.description =
        'Website redesign with useful goods for Figma made by Setproduct one-guy-firm :)';
    topDeal.colorList = new List();
    topDeal.time = 'Mar 31';
    topDeal.colorList.add(ColorKey.lightBlueColor);
    topDeal.colorList.add(ColorKey.orangeColor);
    topDeal.colorList.add(Colors.red);
    topDeal.colorList.add(ColorKey.cartColor);
    topDeal.colorList.add(ColorKey.registerBox);
    topDeal.textColor = Colors.black;
    topDeal.colorOfCart = ColorKey.accountColor;
    topDeal.colorOfBoxCard = ColorKey.lightGreyColor;
    topDeal.images.add(AssetKey.f72);
    topDeal.todayTop = false;
    topDeal.isMoveTo = true;
    topDeal.bgColor = Colors.white;
    topDeal.iconColor = ColorKey.thumbColor;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.description =
        'Started to use Android Design System for Figma to solve tasks much more faster than before. So when I laying down my templates I detach the card and customize';
    topDeal.colorList = new List();
    topDeal.time = 'Mar 31';
    topDeal.colorList.add(Colors.grey);
    topDeal.colorList.add(ColorKey.cartColor);
    topDeal.colorList.add(Colors.red);
    topDeal.colorList.add(ColorKey.greenColor);
    topDeal.colorList.add(ColorKey.registerBox);
    topDeal.colorList.add(ColorKey.blueColor);
    topDeal.colorList.add(ColorKey.orangeColor);
    topDeal.colorList.add(ColorKey.lightBlueColor);
    topDeal.colorList.add(ColorKey.yellowColor);
    topDeal.textColor = Colors.white;
    topDeal.colorOfCart = ColorKey.lightPurpleColor;
    topDeal.colorOfBoxCard = ColorKey.colorPurple;
    topDeal.images.add(AssetKey.f73);
    topDeal.images.add(AssetKey.f70);
    topDeal.images.add(AssetKey.f71);
    topDeal.images.add(AssetKey.f72);
    topDeal.todayTop = false;
    topDeal.isMoveTo = false;
    topDeal.bgColor = Colors.white;
    topDeal.iconColor = ColorKey.thumbColor;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.description =
        'Started to use Android Design System for Figma to solve tasks much more faster than before. So when I laying down my templates I detach the card and customize';
    topDeal.colorList = new List();
    topDeal.time = 'Mar 31';
    topDeal.colorList.add(Colors.grey);
    topDeal.colorList.add(ColorKey.cartColor);
    topDeal.colorList.add(Colors.red);
    topDeal.colorList.add(ColorKey.greenColor);
    topDeal.colorList.add(Colors.white);
    topDeal.colorList.add(ColorKey.blueColor);
    topDeal.colorList.add(ColorKey.orangeColor);
    topDeal.colorList.add(ColorKey.lightBlueColor);
    topDeal.colorList.add(ColorKey.yellowColor);
    topDeal.textColor = Colors.white;
    topDeal.colorOfCart = ColorKey.lightPurpleColor;
    topDeal.colorOfBoxCard = ColorKey.colorPurple;
    topDeal.images.add(AssetKey.f73);
    topDeal.images.add(AssetKey.f70);
    topDeal.images.add(AssetKey.f71);
    topDeal.images.add(AssetKey.f72);
    topDeal.todayTop = false;
    topDeal.isMoveTo = false;
    topDeal.bgColor = Colors.white;
    topDeal.iconColor = ColorKey.thumbColor;
    list.add(topDeal);
    return list;
  }

  static List<TopDeal> getSocialSeven() {
    List<TopDeal> list = new List();

    TopDeal topDeal = new TopDeal();
    topDeal.time = '1 APR';
    topDeal.hint = '+6';
    topDeal.iconHintColor = ColorKey.registerBox;
    topDeal.hintColor = Colors.white;
    topDeal.description =
        'This bundle of cards will help you to create social, CRM or any other apps';
    topDeal.colorList = new List();
    topDeal.colorList.add(Colors.grey);
    topDeal.colorList.add(ColorKey.cartColor);
    topDeal.colorList.add(Colors.red);
    topDeal.colorList.add(ColorKey.greenColor);
    topDeal.colorList.add(ColorKey.registerBox);
    topDeal.colorList.add(ColorKey.blueColor);
    topDeal.colorList.add(ColorKey.orangeColor);
    topDeal.colorList.add(ColorKey.lightBlueColor);
    topDeal.textColor = Colors.black;
    topDeal.colorOfCart = ColorKey.accountColor;
    topDeal.colorOfBoxCard = ColorKey.lightGreyColor;
    topDeal.images.add(AssetKey.f38);
    topDeal.images.add(AssetKey.f15);
    topDeal.images.add(AssetKey.f25);
    topDeal.images.add(AssetKey.f37);
    topDeal.images.add(AssetKey.f37);
    topDeal.todayTop = false;
    topDeal.isMoveTo = false;
    topDeal.isEditMode = true;
    topDeal.isSort = true;
    topDeal.bgColor = Colors.white;
    topDeal.iconColor = ColorKey.thumbColor;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.time = '1 APR';
    topDeal.description = 'Example of highlighted task';
    topDeal.colorList = new List();
    topDeal.colorList.add(ColorKey.blueColor);
    topDeal.colorList.add(ColorKey.orangeColor);
    topDeal.colorList.add(Colors.black);
    topDeal.colorList.add(ColorKey.greenColor);
    topDeal.textColor = Colors.black;
    topDeal.colorOfCart = ColorKey.accountColor;
    topDeal.colorOfBoxCard = ColorKey.lightGreyColor;
    topDeal.images.add(AssetKey.f25);
    topDeal.images.add(AssetKey.f37);
    topDeal.todayTop = false;
    topDeal.isMoveTo = true;
    topDeal.isEditMode = true;
    topDeal.isSort = false;
    topDeal.bgColor = ColorKey.registerBox;
    topDeal.iconColor = ColorKey.blueSecondColor;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.time = '1 APR';
    topDeal.description = 'You can toggle text alignment inside this card';
    topDeal.colorList = new List();
    topDeal.textColor = Colors.black;
    topDeal.colorOfCart = ColorKey.accountColor;
    topDeal.colorOfBoxCard = ColorKey.lightGreyColor;
    topDeal.images.add(AssetKey.f37);
    topDeal.images.add(AssetKey.f38);
    topDeal.todayTop = true;
    topDeal.isMoveTo = true;
    topDeal.isEditMode = true;
    topDeal.isSort = false;
    topDeal.bgColor = Colors.white;
    topDeal.iconColor = ColorKey.thumbColor;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.time = '1 APR';
    topDeal.description = 'You can customize each card or hide items inside';
    topDeal.colorList = new List();
    topDeal.colorList.add(ColorKey.blueColor);
    topDeal.colorList.add(ColorKey.orangeColor);
    topDeal.colorList.add(ColorKey.lightBlueColor);
    topDeal.textColor = Colors.black;
    topDeal.colorOfCart = ColorKey.accountColor;
    topDeal.colorOfBoxCard = ColorKey.lightGreyColor;
    topDeal.images.add(AssetKey.f25);
    topDeal.images.add(AssetKey.f37);
    topDeal.todayTop = false;
    topDeal.isMoveTo = true;
    topDeal.isEditMode = true;
    topDeal.isSort = false;
    topDeal.bgColor = Colors.white;
    topDeal.iconColor = ColorKey.thumbColor;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.time = '4 APR';
    topDeal.description =
        'If you just need more space for text in this card - simply resize it vertically. Hide userpics to show less participants. The same for color badges';
    topDeal.colorList = new List();
    topDeal.colorList.add(Colors.grey);
    topDeal.colorList.add(ColorKey.cartColor);
    topDeal.colorList.add(Colors.red);
    topDeal.colorList.add(ColorKey.greenColor);
    topDeal.textColor = Colors.black;
    topDeal.colorOfCart = ColorKey.accountColor;
    topDeal.colorOfBoxCard = ColorKey.lightGreyColor;
    topDeal.images.add(AssetKey.f39);
    topDeal.images.add(AssetKey.f40);
    topDeal.images.add(AssetKey.f15);
    topDeal.todayTop = false;
    topDeal.isMoveTo = false;
    topDeal.isEditMode = true;
    topDeal.isSort = true;
    topDeal.bgColor = Colors.white;
    topDeal.iconColor = ColorKey.thumbColor;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.time = '1 APR';
    topDeal.description =
        'Use this Android Mobile Kit to develop and launch any apps faster';
    topDeal.colorList = new List();
    topDeal.textColor = Colors.black;
    topDeal.colorOfCart = ColorKey.accountColor;
    topDeal.colorOfBoxCard = ColorKey.lightGreyColor;
    topDeal.images.add(AssetKey.f15);
    topDeal.todayTop = false;
    topDeal.isMoveTo = true;
    topDeal.isEditMode = true;
    topDeal.isSort = false;
    topDeal.bgColor = ColorKey.lightGreyColor;
    topDeal.iconColor = ColorKey.thumbColor;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.time = '1 APR';
    topDeal.description =
        'Use this Android Mobile Kit to develop and launch any apps faster';
    topDeal.colorList = new List();
    topDeal.textColor = Colors.black;
    topDeal.colorOfCart = ColorKey.accountColor;
    topDeal.colorOfBoxCard = ColorKey.lightGreyColor;
    topDeal.images.add(AssetKey.f15);
    topDeal.todayTop = false;
    topDeal.isMoveTo = true;
    topDeal.isEditMode = true;
    topDeal.isSort = false;
    topDeal.bgColor = ColorKey.lightGreyColor;
    topDeal.iconColor = ColorKey.thumbColor;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.time = '8 APR';
    topDeal.hint = '+6';
    topDeal.iconHintColor = Colors.white;
    topDeal.hintColor = ColorKey.registerBox;
    topDeal.description =
        'Every component and template is properly constrained and resizing';
    topDeal.colorList = new List();
    topDeal.colorList.add(Colors.grey);
    topDeal.colorList.add(ColorKey.registerBox);
    topDeal.images = new List();
    topDeal.images.add(AssetKey.f38);
    topDeal.images.add(AssetKey.f15);
    topDeal.images.add(AssetKey.f25);
    topDeal.images.add(AssetKey.f37);
    topDeal.images.add(AssetKey.f37);
    topDeal.textColor = Colors.black;
    topDeal.colorOfCart = ColorKey.accountColor;
    topDeal.colorOfBoxCard = ColorKey.greyColor;
    topDeal.todayTop = false;
    topDeal.isMoveTo = false;
    topDeal.isEditMode = true;
    topDeal.isSort = true;
    topDeal.bgColor = ColorKey.lightGreyColor;
    topDeal.iconColor = ColorKey.thumbColor;
    list.add(topDeal);

    return list;
  }

  static List<TopDeal> getSocialEight() {
    List<TopDeal> list = new List();

    TopDeal topDeal = new TopDeal();
    topDeal.caption = 'ARHITECTURE • SPAIN';
    topDeal.title = 'Trendy Building To Spend A Couple Of Weeks';
    topDeal.price = '\$68 per person';
    topDeal.rating = '859';
    topDeal.photo = AssetKey.f80;
    topDeal.icon = Icons.lightbulb_outline;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.caption = 'ARHITECTURE • NETERLANDS';
    topDeal.title = 'Holland Buildings Walking Tour';
    topDeal.price = '\$98 per person';
    topDeal.rating = '118';
    topDeal.photo = AssetKey.f77;
    topDeal.icon = Icons.lightbulb_outline;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.caption = 'ART & DESIGN • FRANCE';
    topDeal.title = 'Meet The Incredible House in Paris';
    topDeal.price = '\$68 per person';
    topDeal.rating = '56';
    topDeal.photo = AssetKey.f78;
    topDeal.icon = Icons.lightbulb_outline;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.caption = 'WALK • HOLLAND';
    topDeal.title = 'Bicycle Tour Around Amsterdam';
    topDeal.price = '\$24 per person';
    topDeal.rating = '256';
    topDeal.photo = AssetKey.f79;
    topDeal.icon = Icons.lightbulb_outline;
    list.add(topDeal);

    return list;
  }

  static List<TopDeal> getSocialEightForSecond() {
    List<TopDeal> list = new List();

    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Mighty Homes';
    topDeal.photo = AssetKey.f83;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Experiences';
    topDeal.photo = AssetKey.f81;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Eateries';
    topDeal.photo = AssetKey.f82;
    list.add(topDeal);
    return list;
  }

  static List<TopDeal> getSocialNine() {
    List<TopDeal> list = new List();

    TopDeal topDeal = new TopDeal();
    topDeal.title = 'The story of a color';
    topDeal.rating = '❤ 256';
    topDeal.photo = AssetKey.f91;
    topDeal.iconColor = ColorKey.registerBox;
    topDeal.bgColor = Colors.white;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'The Design System';
    topDeal.rating = '❤ 18';
    topDeal.photo = AssetKey.f84;
    topDeal.iconColor = Colors.white;
    topDeal.bgColor = Colors.black;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Caption here';
    topDeal.rating = '❤ 3K';
    topDeal.photo = AssetKey.f85;
    topDeal.iconColor = Colors.white;
    topDeal.bgColor = ColorKey.registerBox;
    list.add(topDeal);
    return list;
  }

  static List<TopDeal> getSocialNineSecond() {
    List<TopDeal> list = new List();

    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Awesome Mobile Design Kit\nwith templates for Figma';
    topDeal.hint = 'Now 140 app screens!';
    topDeal.photo = AssetKey.f86;
    topDeal.iconColor = Colors.white;
    topDeal.bgColor = Colors.black;
    topDeal.textColor = Colors.black;
    topDeal.isSort = true;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = '450+ Material Components';
    topDeal.hint = 'SETPRODUCT.COM/MATERIAL';
    topDeal.photo = AssetKey.f87;
    topDeal.iconColor = ColorKey.registerBox;
    topDeal.bgColor = ColorKey.cartColor;
    topDeal.textColor = ColorKey.registerBox;
    topDeal.isSort = false;
    list.add(topDeal);
    return list;
  }

  static List<TopDeal> getSocialNineThird() {
    List<TopDeal> list = new List();

    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Snap the caption to any direction';
    topDeal.photo = AssetKey.f88;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Centered Text';
    topDeal.photo = AssetKey.f89;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'TOGGLE FONT SIZE VIA\nGLOBAL STYLES';
    topDeal.photo = AssetKey.f90;
    list.add(topDeal);
    return list;
  }

  static List<TopDeal> getCartThree() {
    List<TopDeal> list = new List();

    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Just a sample of item in your cart';
    topDeal.photo = AssetKey.f94;
    topDeal.originalPrice = '\$ 49,99';
    topDeal.discountedPrice = '\$ 29,95';
    topDeal.totalPrice = '\$38.95';
    topDeal.discount = '\$9.90';
    topDeal.optionDescription = new List();
    topDeal.optionDescription.add('XXXS');
    topDeal.optionDescription.add('L');
    topDeal.optionDescription.add('M');
    topDeal.optionDescription.add('S');
    topDeal.optionDescription.add('XL');
    topDeal.optionDescription.add('XXL');
    topDeal.images = new List();
    topDeal.images.add('Black');
    topDeal.images.add('White');
    topDeal.images.add('Green');
    topDeal.images.add('Yellow');
    topDeal.optionTitle = new List();
    topDeal.optionTitle.add('1 items');
    topDeal.optionTitle.add('2 items');
    topDeal.optionTitle.add('3 items');
    topDeal.optionTitle.add('4 items');
    topDeal.optionTitle.add('5 items');
    topDeal.colorList = new List();
    topDeal.colorList.add(Colors.green);
    topDeal.colorList.add(Colors.green);
    topDeal.colorList.add(Colors.green);
    topDeal.colorList.add(Colors.green);
    topDeal.choose = new List();
    topDeal.choose.add(null);
    topDeal.choose.add(null);
    topDeal.choose.add(null);
    list.add(topDeal);
    return list;
  }

  static List<TopDeal> getCartFour() {
    List<TopDeal> list = new List();

    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Just a sample of item in your cart';
    topDeal.photo = AssetKey.f96;
    topDeal.originalPrice = '\$ 49,99';
    topDeal.discountedPrice = '29.95 \$US';
    topDeal.optionDescription = new List();
    topDeal.optionDescription.add('XXXS');
    topDeal.optionDescription.add('L');
    topDeal.optionDescription.add('M');
    topDeal.optionDescription.add('S');
    topDeal.optionDescription.add('XL');
    topDeal.optionDescription.add('XXL');
    topDeal.images = new List();
    topDeal.images.add('Black');
    topDeal.images.add('White');
    topDeal.images.add('Green');
    topDeal.images.add('Yellow');
    topDeal.optionTitle = new List();
    topDeal.optionTitle.add('1 items');
    topDeal.optionTitle.add('2 items');
    topDeal.optionTitle.add('3 items');
    topDeal.optionTitle.add('4 items');
    topDeal.optionTitle.add('5 items');
    topDeal.colorList = new List();
    topDeal.colorList.add(Colors.green);
    topDeal.colorList.add(Colors.green);
    topDeal.colorList.add(Colors.green);
    topDeal.colorList.add(Colors.green);
    topDeal.choose = new List();
    topDeal.choose.add(null);
    topDeal.choose.add(null);
    topDeal.choose.add(null);
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Just a sample of item in your cart';
    topDeal.photo = AssetKey.f95;
    topDeal.originalPrice = '\$ 49,99';
    topDeal.discountedPrice = '29.95 \$US';
    topDeal.optionDescription = new List();
    topDeal.optionDescription.add('XXXS');
    topDeal.optionDescription.add('L');
    topDeal.optionDescription.add('M');
    topDeal.optionDescription.add('S');
    topDeal.optionDescription.add('XL');
    topDeal.optionDescription.add('XXL');
    topDeal.images = new List();
    topDeal.images.add('Black');
    topDeal.images.add('White');
    topDeal.images.add('Green');
    topDeal.images.add('Yellow');
    topDeal.optionTitle = new List();
    topDeal.optionTitle.add('1 items');
    topDeal.optionTitle.add('2 items');
    topDeal.optionTitle.add('3 items');
    topDeal.optionTitle.add('4 items');
    topDeal.optionTitle.add('5 items');
    topDeal.colorList = new List();
    topDeal.colorList.add(Colors.green);
    topDeal.colorList.add(Colors.green);
    topDeal.colorList.add(Colors.green);
    topDeal.colorList.add(Colors.green);
    topDeal.choose = new List();
    topDeal.choose.add(null);
    topDeal.choose.add(null);
    topDeal.choose.add(null);
    list.add(topDeal);
    return list;
  }

  static List<TopDeal> getCartFive() {
    List<TopDeal> list = new List();

    TopDeal topDeal = new TopDeal();
    topDeal.hint = 'Fast food';
    topDeal.title = 'Example of your saved item';
    topDeal.photo = AssetKey.f97;
    topDeal.originalPrice = '4.40';
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.hint = 'Saved 2 days ago';
    topDeal.title = 'One more saved item in your list';
    topDeal.photo = AssetKey.f98;
    topDeal.originalPrice = '8.95';
    list.add(topDeal);
    return list;
  }

  static List<TopDeal> getCartSix() {
    List<TopDeal> list = new List();

    TopDeal topDeal = new TopDeal();
    topDeal.hint = 'Fruits';
    topDeal.title = 'Perfect Oranges For Fresh Extraction';
    topDeal.photo = AssetKey.f101;
    topDeal.originalPrice = '\$8.50';
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.hint = 'Starters';
    topDeal.title = 'Famous Russian Starter Salad “The Success”';
    topDeal.photo = AssetKey.f99;
    topDeal.originalPrice = '\$14.30';
    list.add(topDeal);
    topDeal = new TopDeal();

    topDeal.hint = 'Fruits';
    topDeal.title = 'Perfect Apples For You”';
    topDeal.photo = AssetKey.f100;
    topDeal.originalPrice = '\$8.50';
    list.add(topDeal);
    return list;
  }

  static List<TopDeal> getCartSeven() {
    List<TopDeal> list = new List();

    TopDeal topDeal = new TopDeal();
    topDeal.hint = 'Women Clothes';
    topDeal.title = 'Stylish Clothes Item Sample Added Into Your Cart';
    topDeal.photo = AssetKey.f104;
    topDeal.originalPrice = '\$8.50';
    topDeal.optionDescription = new List();
    topDeal.optionDescription.add('XXXS');
    topDeal.optionDescription.add('L');
    topDeal.optionDescription.add('M');
    topDeal.optionDescription.add('S');
    topDeal.optionDescription.add('XL');
    topDeal.optionDescription.add('XXL');
    topDeal.images = new List();
    topDeal.images.add('Black');
    topDeal.images.add('White');
    topDeal.images.add('Green');
    topDeal.images.add('Yellow');
    topDeal.optionTitle = new List();
    topDeal.optionTitle.add('1 items');
    topDeal.optionTitle.add('2 items');
    topDeal.optionTitle.add('3 items');
    topDeal.optionTitle.add('4 items');
    topDeal.optionTitle.add('5 items');
    topDeal.colorList = new List();
    topDeal.colorList.add(Colors.green);
    topDeal.colorList.add(Colors.green);
    topDeal.colorList.add(Colors.green);
    topDeal.colorList.add(Colors.green);
    topDeal.choose = new List();
    topDeal.choose.add(null);
    topDeal.choose.add(null);
    topDeal.choose.add(null);
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.hint = 'Women Tshirts';
    topDeal.title = 'Stylish Clothes Item Sample Added Into Your Cart';
    topDeal.photo = AssetKey.f99;
    topDeal.originalPrice = '\$14.30';
    topDeal.optionDescription = new List();
    topDeal.optionDescription.add('XXXS');
    topDeal.optionDescription.add('L');
    topDeal.optionDescription.add('M');
    topDeal.optionDescription.add('S');
    topDeal.optionDescription.add('XL');
    topDeal.optionDescription.add('XXL');
    topDeal.images = new List();
    topDeal.images.add('Black');
    topDeal.images.add('White');
    topDeal.images.add('Green');
    topDeal.images.add('Yellow');
    topDeal.optionTitle = new List();
    topDeal.optionTitle.add('1 items');
    topDeal.optionTitle.add('2 items');
    topDeal.optionTitle.add('3 items');
    topDeal.optionTitle.add('4 items');
    topDeal.optionTitle.add('5 items');
    topDeal.colorList = new List();
    topDeal.colorList.add(Colors.green);
    topDeal.colorList.add(Colors.green);
    topDeal.colorList.add(Colors.green);
    topDeal.colorList.add(Colors.green);
    topDeal.choose = new List();
    topDeal.choose.add(null);
    topDeal.choose.add(null);
    topDeal.choose.add(null);
    list.add(topDeal);
    topDeal = new TopDeal();

    topDeal.hint = 'Mens Underwear';
    topDeal.title = 'Stylish Clothes Item Sample Added Into Your Cart';
    topDeal.photo = AssetKey.f100;
    topDeal.originalPrice = '\$8.50';
    topDeal.optionDescription = new List();
    topDeal.optionDescription.add('XXXS');
    topDeal.optionDescription.add('L');
    topDeal.optionDescription.add('M');
    topDeal.optionDescription.add('S');
    topDeal.optionDescription.add('XL');
    topDeal.optionDescription.add('XXL');
    topDeal.images = new List();
    topDeal.images.add('Black');
    topDeal.images.add('White');
    topDeal.images.add('Green');
    topDeal.images.add('Yellow');
    topDeal.optionTitle = new List();
    topDeal.optionTitle.add('1 items');
    topDeal.optionTitle.add('2 items');
    topDeal.optionTitle.add('3 items');
    topDeal.optionTitle.add('4 items');
    topDeal.optionTitle.add('5 items');
    topDeal.colorList = new List();
    topDeal.colorList.add(Colors.green);
    topDeal.colorList.add(Colors.green);
    topDeal.colorList.add(Colors.green);
    topDeal.colorList.add(Colors.green);
    topDeal.choose = new List();
    topDeal.choose.add(null);
    topDeal.choose.add(null);
    topDeal.choose.add(null);
    list.add(topDeal);
    return list;
  }

  static List<TopDeal> checkoutThreeData() {
    List<TopDeal> list = new List();

    TopDeal topDeal = new TopDeal();
    topDeal.hint = 'Fruits';
    topDeal.title = 'Perfect Oranges For Fresh Extraction';
    topDeal.photo = AssetKey.f106;
    topDeal.originalPrice = '\$8.50';
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.hint = 'Starters';
    topDeal.title = 'Famous Russian Starter Salad “The Success”';
    topDeal.photo = AssetKey.f105;
    topDeal.originalPrice = '\$14.30';
    list.add(topDeal);
    topDeal = new TopDeal();
    return list;
  }

  static List<TopDeal> getCheckoutSeven() {
    List<TopDeal> list = new List();

    TopDeal topDeal = new TopDeal();
    topDeal.hint = 'Women Clothes';
    topDeal.title = 'Stylish Clothes Item Sample Added Into Your Cart';
    topDeal.photo = AssetKey.f101;
    topDeal.originalPrice = '\$8.50';
    topDeal.optionDescription = new List();
    topDeal.optionDescription.add('XXXS');
    topDeal.optionDescription.add('L');
    topDeal.optionDescription.add('M');
    topDeal.optionDescription.add('S');
    topDeal.optionDescription.add('XL');
    topDeal.optionDescription.add('XXL');
    topDeal.images = new List();
    topDeal.images.add('Black');
    topDeal.images.add('White');
    topDeal.images.add('Green');
    topDeal.images.add('Yellow');
    topDeal.optionTitle = new List();
    topDeal.optionTitle.add('1 items');
    topDeal.optionTitle.add('2 items');
    topDeal.optionTitle.add('3 items');
    topDeal.optionTitle.add('4 items');
    topDeal.optionTitle.add('5 items');
    topDeal.colorList = new List();
    topDeal.colorList.add(Colors.green);
    topDeal.colorList.add(Colors.green);
    topDeal.colorList.add(Colors.green);
    topDeal.colorList.add(Colors.green);
    topDeal.choose = new List();
    topDeal.choose.add(null);
    topDeal.choose.add(null);
    topDeal.choose.add(null);
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.hint = 'Women Tshirts';
    topDeal.title = 'Stylish Clothes Item Sample Added Into Your Cart';
    topDeal.photo = AssetKey.f100;
    topDeal.originalPrice = '\$14.30';
    topDeal.optionDescription = new List();
    topDeal.optionDescription.add('XXXS');
    topDeal.optionDescription.add('L');
    topDeal.optionDescription.add('M');
    topDeal.optionDescription.add('S');
    topDeal.optionDescription.add('XL');
    topDeal.optionDescription.add('XXL');
    topDeal.images = new List();
    topDeal.images.add('Black');
    topDeal.images.add('White');
    topDeal.images.add('Green');
    topDeal.images.add('Yellow');
    topDeal.optionTitle = new List();
    topDeal.optionTitle.add('1 items');
    topDeal.optionTitle.add('2 items');
    topDeal.optionTitle.add('3 items');
    topDeal.optionTitle.add('4 items');
    topDeal.optionTitle.add('5 items');
    topDeal.colorList = new List();
    topDeal.colorList.add(Colors.green);
    topDeal.colorList.add(Colors.green);
    topDeal.colorList.add(Colors.green);
    topDeal.colorList.add(Colors.green);
    topDeal.choose = new List();
    topDeal.choose.add(null);
    topDeal.choose.add(null);
    topDeal.choose.add(null);
    list.add(topDeal);
    topDeal = new TopDeal();
    return list;
  }

  static List<TopDeal> contentOne() {
    List<TopDeal> list = new List();

    TopDeal topDeal = new TopDeal();
    topDeal.photo = AssetKey.f37;
    topDeal.title = 'BE HEALTHY!';
    topDeal.description = 'Don’t ever miss a thing when you keeping on';
    topDeal.bgColor = Colors.white;
    topDeal.colorOfCart = ColorKey.cartColor;
    topDeal.colorOfBoxCard = Colors.black;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.photo = AssetKey.f112;
    topDeal.title = 'Impact!';
    topDeal.description = 'HIT THE USER WITH SUPER PHRASE';
    topDeal.bgColor = ColorKey.cartColor;
    topDeal.colorOfCart = Colors.black;
    topDeal.colorOfBoxCard = Colors.white;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.title = 'Travel';
    topDeal.description = 'MOROCCO IS ALWAYS WELCOME';
    topDeal.bgColor = Colors.white;
    topDeal.colorOfCart = Colors.white;
    topDeal.colorOfBoxCard = Colors.black;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.photo = AssetKey.f109;
    topDeal.title = 'No stress! Working hard';
    topDeal.description = 'LEARN MORE';
    topDeal.bgColor = ColorKey.registerBox;
    topDeal.colorOfCart = ColorKey.cartColor;
    topDeal.colorOfBoxCard = Colors.white;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.photo = AssetKey.f15;
    topDeal.title = 'BEATRICE SPENCER';
    topDeal.description = '“I am always happy when strange thing happens”';
    topDeal.bgColor = ColorKey.darkGrey;
    topDeal.colorOfCart = ColorKey.cartColor;
    topDeal.colorOfBoxCard = Colors.white;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.photo = AssetKey.f113;
    topDeal.title = 'Street survival lessons';
    topDeal.description = 'BY COACH MIKE';
    topDeal.bgColor = ColorKey.c10;
    topDeal.colorOfCart = Colors.white;
    topDeal.colorOfBoxCard = ColorKey.cartColor;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.photo = AssetKey.f114;
    topDeal.title = 'Success';
    topDeal.description = 'IS ALWAYS AROUND YOU, JUST LET BE';
    topDeal.bgColor = Colors.transparent;
    topDeal.colorOfCart = ColorKey.cartColor;
    topDeal.colorOfBoxCard = Colors.white;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.photo = AssetKey.f110;
    topDeal.title = 'SUPERDEAL';
    topDeal.description = 'Purchase this kit for success!';
    topDeal.bgColor = Colors.white;
    topDeal.colorOfCart = ColorKey.registerBox;
    topDeal.colorOfBoxCard = Colors.black;
    list.add(topDeal);

    topDeal = new TopDeal();
    topDeal.photo = AssetKey.f111;
    topDeal.title = 'THE PROBLEM';
    topDeal.description = 'I’ve never had a dinner with president';
    topDeal.bgColor = ColorKey.cartColor;
    topDeal.colorOfCart = ColorKey.registerBox;
    topDeal.colorOfBoxCard = Colors.black;
    list.add(topDeal);
    return list;
  }

  static TopDeal contentTwo() {
    TopDeal topDeal = new TopDeal();
    topDeal.title =
        'Perfect things always created by creative people with \nimagination';
    topDeal.description =
        'Material Design provides responsive layouts based on the following column structures. Layouts using 4-column, 8-column, and 12-column grids are available for use across different screens, devices, and orientations.\n\nEach breakpoint range determines the number of columns, and recommended margins...';
    topDeal.time = '135 hours ago';
    topDeal.hashTag = 'by Beatrice Spencer 👩';
    return topDeal;
  }

  static TopDeal contentThree() {
    TopDeal topDeal = new TopDeal();
    topDeal.title =
        '“I like to ';
    topDeal.hashTag = 'keep it clean';
    topDeal.description =
    'by Beatrice Spencer 👵';
    topDeal.time = ' and simple, but there has to be some detail, something different.”';
    return topDeal;
  }

  static TopDeal contentFive() {
    TopDeal topDeal = new TopDeal();
    topDeal.title = 'Mike ‘The Big’ Cranston';
    topDeal.hashTag = 'Teaches how to survive in ghetto';
    topDeal.description = 'Material Design provides responsive layouts based on the following column structures. Layouts using 4-column, 8-column, and 12-column grids are available for use across different screens, devices, and orientations.\n\nEach breakpoint range determines the number of columns, and recommended margins...';
    topDeal.time =
        'TAKE YOUR KUNG-FU ON THE NEXT LEVEL';
    return topDeal;
  }
}
