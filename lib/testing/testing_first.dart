// import 'package:flutter/material.dart';


// class FirstPage extends StatefulWidget {
//   @override
//   _FirstPageState createState() => _FirstPageState();
// }

// class _FirstPageState extends State<FirstPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("First Page"),
//       ),
//       body: Center(
//         child: RaisedButton(
//           child: Text("Navigate Next"),
//           onPressed: () async {
//             await Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => SecondPage())
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class SecondPage extends StatefulWidget {
//   @override
//   _SecondPageState createState() => _SecondPageState();
// }

// class _SecondPageState extends State<SecondPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: CollapsingAppBarPage(
//         titleText: "Second Page",
//         bodyCreator: (context) {
//           return ListView(

//             children: <Widget>[
//               Center(
//                 child: RaisedButton(
//                   child: Text("Navigate Next"),
//                   onPressed: () async {
//                     await Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => ThirdPage())
//                     );
//                   },
//                 ),
//               )
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

// class ThirdPage extends StatefulWidget {
//   @override
//   _ThirdPageState createState() => _ThirdPageState();
// }

// class _ThirdPageState extends State<ThirdPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             title: Text("Third Page")
//         ),
//         body: Container()
//     );
//   }
// }

// typedef CollapsingAppBarBodyCreator = Widget Function(BuildContext context);

// class CollapsingAppBarPage extends StatefulWidget {

//   final String? titleText;
//   final CollapsingAppBarBodyCreator bodyCreator;

//   CollapsingAppBarPage({
//     Key? key,
//     this.titleText,
//     required this.bodyCreator,
//   }) : super(key: key);

//   @override
//   _CollapsingAppBarPageState createState() => _CollapsingAppBarPageState();
// }

// class _CollapsingAppBarPageState extends State<CollapsingAppBarPage> {

//   static const _kExpandedHeight = 200.0;

//   late ScrollController _scrollController;
//   //Offset state <-------------------------------------
//   double offset = 0.0 ;



//   @override
//   void initState() {
//     super.initState();
//     //print("init state is called");

//     _scrollController = ScrollController() //keepScrollOffset: false removed
//       ..addListener(() {
//         setState(() {
//           //<-----------------------------
//           offset = _scrollController.offset;
//           // force a refresh so the app bar can be updated
//         });
//       });
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return NestedScrollView(
//       controller: _scrollController,
//       headerSliverBuilder: _createSliverAppBar,
//       body: widget.bodyCreator(context),
//     );
//   }

//   List<Widget> _createSliverAppBar(BuildContext context, bool innerBoxIsScrolled) {
//     // change the icon color as the page scrolls
//     print("_createSliverAppBar is called");
//     var collapsePercent = _getAppBarCollapsePercent();
//     int rgb = ((1.0 - collapsePercent) * 255).round();
//     var color = Color.fromARGB(255, rgb, rgb, rgb);

//     return <Widget>[
//       SliverAppBar(
//         expandedHeight: _kExpandedHeight,
//         pinned: true,
//         iconTheme: IconThemeData(color: color),
//         title: Text(widget.titleText!),
//       )
//     ];
//   }

//   double _getAppBarCollapsePercent() {
//     if (!_scrollController.hasClients ){
//       print("positions is ${_scrollController.positions.length}");
//       return 0.0;

//     }


//     //print("offset is${_scrollController.offset} and positions is ${_scrollController.positions.length}");
//     return (offset / (_kExpandedHeight - kToolbarHeight)).clamp(0.0, 1.0);
//   }
// }



import 'package:get/get.dart';

extension SizerExt on num {
  /// Calculates the height depending on the device's screen size
  ///
  /// Eg: 20.h -> will take 20% of the screen's height
  double get h => this * Get.height / 100;

  /// Calculates the width depending on the device's screen size
  ///
  /// Eg: 20.w -> will take 20% of the screen's width
  double get w => this * Get.width / 100;

  /// Calculates the sp (Scalable Pixel) depending on the device's screen size
  double get sp => this * (Get.width / 3) / 100;
}