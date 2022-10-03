// import 'dart:async';
//
// import 'package:circle_bottom_navigation_bar/circle_bottom_navigation_bar.dart';
// import 'package:circle_bottom_navigation_bar/widgets/tab_data.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:moyen_express/constants/colors.dart';
// import 'package:moyen_express/controllers/home_screen_controller.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class HomeScreen extends GetView<HomeScreenController> {
//   HomeScreen({Key? key}) : super(key: key);
//   int pageValue = 0;
//
//   final List<Widget> _pages = [
//     Home(),
//     History(),
//     Search(),
//     Alarm(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery
//         .of(context)
//         .size;
//     final viewPadding = MediaQuery
//         .of(context)
//         .viewPadding;
//     double barHeight;
//     double barHeightWithNotch = 67;
//     double arcHeightWithNotch = 67;
//
//     if (size.height > 700) {
//       barHeight = 70;
//     } else {
//       barHeight = size.height * 0.1;
//     }
//
//     if (viewPadding.bottom > 0) {
//       barHeightWithNotch = (size.height * 0.07) + viewPadding.bottom;
//       arcHeightWithNotch = (size.height * 0.075) + viewPadding.bottom;
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(
//           child: Text(
//             'Circle Bottom Navigation Bar Example',
//           ),
//         ),
//       ),
//       body: Obx(() => _pages[controller.currentPage.value]),
//       bottomNavigationBar: Obx(() => CircleBottomNavigationBar(
//             initialSelection: controller.currentPage.value,
//             barHeight: viewPadding.bottom > 0 ? barHeightWithNotch : barHeight,
//             arcHeight: viewPadding.bottom > 0 ? arcHeightWithNotch : barHeight,
//             itemTextOff: viewPadding.bottom > 0 ? 0 : 1,
//             itemTextOn: viewPadding.bottom > 0 ? 0 : 1,
//             circleOutline: 5.0,
//             shadowAllowance: 0.0,
//             circleSize: 60.0,
//             blurShadowRadius: 50.0,
//             circleColor: Color(kPrimaryColor),
//             activeIconColor: Colors.white,
//             inactiveIconColor: Colors.grey,
//           tabs: getTabsData(),
//             onTabChangedListener: (index) async{
//               controller.currentPage.value = index;
//             }
//         ),
//       ),
//     );
//   }
//
//
//   List<TabData> getTabsData() {
//
//     return [
//       TabData(
//         icon: Icons.home,
//         iconSize:40,
//         title: controller.currentPage.value == 0 ? "" : 'Home',
//         fontSize: 10,
//         fontWeight: FontWeight.bold,
//       ),
//       TabData(
//         icon:  Icons.store_mall_directory_sharp,
//         iconSize: 40,
//         title: controller.currentPage.value == 1?"":'Shops',
//         fontSize: 10,
//         fontWeight: FontWeight.bold,
//       ),
//       TabData(
//         icon: Icons.shopping_cart,
//         iconSize: 40,
//         title:  controller.currentPage.value == 2?"":'Cart',
//         fontSize: 10,
//         fontWeight: FontWeight.bold,
//       ),
//       TabData(
//         icon: Icons.dashboard,
//         iconSize: 40,
//         title:  controller.currentPage.value == 3?"":'Categories',
//         fontSize: 10,
//         fontWeight: FontWeight.bold,
//       ),
//       TabData(
//         icon: Icons.person,
//         iconSize: 40,
//           title:  controller.currentPage.value == 3?"":'My Profile',
//         fontSize: 10,
//         fontWeight: FontWeight.bold,
//       ),
//     ];
//   }
// }
// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       body: Container(
//         child: const Center(
//           child: Text(
//             'Home',
//             style: TextStyle(
//               fontSize: 30.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class History extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: const Center(
//           child: Text(
//             'History',
//             style: TextStyle(
//               fontSize: 30.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Search extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: const Center(
//           child: Text(
//             'Search',
//             style: TextStyle(
//               fontSize: 30.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Alarm extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: const Center(
//           child: Text(
//             'Alarm ',
//             style: TextStyle(
//               fontSize: 30.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
