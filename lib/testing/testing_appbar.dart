
// import 'package:extended_sliver/extended_sliver.dart';
// import 'package:flutter/material.dart';


// class TestingAppBar extends StatefulWidget {
//   const TestingAppBar({Key? key}) : super(key: key);

//   @override
//   State<TestingAppBar> createState() => _TestingAppBarState();
// }

// class _TestingAppBarState extends State<TestingAppBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//     body: CustomScrollView(
//   slivers: <Widget>[
//     ExtendedSliverAppbar(
//       title: const Text(
//         'ExtendedSliverAppbar',
//         style: TextStyle(color: Colors.black),
//       ),
//       leading: const BackButton(
//         onPressed: null,
//         color: Colors.white,
//       ),
//       background: Image.asset(
//         'assets/cypridina.jpeg',
//         fit: BoxFit.cover,
//       ),
//       actions: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Icon(
//           Icons.more_horiz,
//           color: Colors.red,
//         ),
//       ),
//     ),


// SliverPinnedPersistentHeader(
//       delegate: MySliverPinnedPersistentHeaderDelegate(
//         minExtentProtoType: Container(
//           height: 120.0,
//           color: Colors.red.withOpacity(0.5),
//           child: FlatButton(
//             child: const Text('minProtoType'),
//             onPressed: () {
//               print('minProtoType');
//             },
//           ),
//           alignment: Alignment.topCenter,
//         ),
//         maxExtentProtoType: Container(
//           height: 200.0,
//           color: Colors.blue,
//           child: FlatButton(
//             child: const Text('maxProtoType'),
//             onPressed: () {
//               print('maxProtoType');
//             },
//           ),
//           alignment: Alignment.bottomCenter,
//         ),
//       ),
//     )
//   ],
// ),



    
//     );
    
//   }
// }

