
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:coupon_app/base/localization/language_key.dart';

class Constants {
  //language
  static String appName = 'Restaurant Partner';
  static Locale english = Locale('en', 'US');

  static String jessica = 'Jessica Shultz';
  static String roman = 'Roman Kamushkenz';
  //Bottom navigation items of the main menu
  static List<List<Object>> bottomNavItems = <List<Object>>[
    <Object>[
      Icons.face,
      LanguageKey.profile,
    ],
    <Object>[
      Icons.dashboard,
      LanguageKey.dashboard,
    ],
    <Object>[
      Icons.timer,
      LanguageKey.orders,
    ],

    <Object>[
      Icons.restaurant_menu,
      LanguageKey.restaurant,
    ],
  ];

  // Top navigation tabs of the restaurant Menu
  static List<String> restaurantMenu = [
    LanguageKey.all,
    LanguageKey.active,
    LanguageKey.inactive,


  ];

  static List<String> tabFruits = [
    LanguageKey.fruits,
    LanguageKey.vegetables,
    LanguageKey.moreFruits,
    LanguageKey.juicesJuices,
  ];

  static List<String> tabTour = [
    LanguageKey.deals,
    LanguageKey.discounts,
    LanguageKey.placeToVisit,
    LanguageKey.bestSellers,
  ];

  static List<String> tabWedding = [
    LanguageKey.grid,
    LanguageKey.discounts,
    LanguageKey.newArrivals,
    LanguageKey.bestSellers
  ];

  static List<String> tabActive = [
    LanguageKey.active,
    LanguageKey.upcoming,
    LanguageKey.finished,
  ];
  static List<String> profileOne = [
    LanguageKey.forYou,
    LanguageKey.account,
    LanguageKey.address,
    LanguageKey.profile,
  ];
  static List<String> profileTwo = [
    LanguageKey.account,
    LanguageKey.orderHistory,
    LanguageKey.address,
  ];
  static List<String> profileFive = [
    LanguageKey.account,
    LanguageKey.ordersCap,
    LanguageKey.address,
  ];
  static List<String> profileSix = [
    LanguageKey.profile,
    LanguageKey.account,
  ];
  static List<String> activityOne = [
    LanguageKey.following,
    LanguageKey.you,
  ];
  static List<String> activityTwo = [
    LanguageKey.home,
    LanguageKey.discoverCap,
    LanguageKey.activityCap,
  ];

  static List<String> pageFourOneSix = [
    LanguageKey.discoverCap,
    LanguageKey.trendy,
    LanguageKey.popular,
  ];

  static List<String> top = [
    "Posters",
    "Postal Cards",
    "Emblems",
    "Magazines",
    "Posters",
    "Postal Cards"
  ];

  static List<String> socialTop = [
    'Teams',
    'Priorities',
    'Current Projects',
    'Completed Projects',
  ];
  static List<String> secondSocialTop = [
    'Nearby',
    'Center',
    'Sightseeing',
    'Nightlife',
    'Sightseeing',
  ];

  static List<String> cartTwo = [
    LanguageKey.itemInCart,
    LanguageKey.savedItemsCap,
  ];
  static List<String> contentSix = [
    LanguageKey.overview,
    LanguageKey.lessons,
  ];

  static Map<String, String> cartFour = {
    LanguageKey.startingSubtotal: '18.40',
    LanguageKey.subtotal: '18.40',
    LanguageKey.shippingFee: '5.99',
    LanguageKey.estimatedTax: '2.00',
    LanguageKey.orderTotalCap: '26.39',
  };
  static Map<String, String> cartSix = {
    LanguageKey.startingSubtotal: '18.40',
    LanguageKey.subtotal: '18.40',
    LanguageKey.shippingFee: '5.99',
    LanguageKey.estimatedTax: '2.00',
  };
  static Map<String, String> checkoutSeven = {
    LanguageKey.startingSubtotal: '18.40',
    LanguageKey.subtotal: '18.40',
    LanguageKey.shippingFee: '5.99',
  };
  static List<String> delivery = [
    'FedEx',
    'DHL Express',
    'USPS',
    'Global Delivery Services',
    'FREE China airmail',
  ];

  static List<String> daysOfWeek = [
    'M',
    'T',
    'W',
    'T',
    'F',
    'S',
    'S',
  ];
  static List<String> daysOfWeekThreeWord = [
    'MON',
    'TUE',
    'WED',
    'THUR',
    'FRI',
    'SAT',
    'SUN',
  ];

//  static List<LatLng> locations = [
////    LatLng(37.43296265331129, -122.08832357078792),
////    LatLng(37.4328448, -122.0884548),
////    LatLng(37.4324682, -122.0883582),
////    LatLng(37.4323573, -122.0884238),
////    LatLng(37.4324727, -122.0889663),
////    LatLng(37.4324727, -122.0889712),
////    LatLng(37.433414, -122.0885793),
//  ];
}
