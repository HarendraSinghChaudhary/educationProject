import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/constant.dart';
class Scores extends StatefulWidget {
  const Scores({Key? key}) : super(key: key);

  @override
  State<Scores> createState() => _ScoresState();
}

class _ScoresState extends State<Scores> {
  ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: Get.width * 0.06),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,

            ),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                controller: _controller,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: const Text(
                      'Sarah Fox',
                      style: TextStyle(
                          color: kTitleColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    subtitle: const Text('2,349 XP',style: TextStyle(fontSize: 14,color: kSubTitleColor),),
                    leading: Container(
                      height: Get.height * 0.12,
                      width: Get.width * 0.12,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.green,
                          image: DecorationImage(image: AssetImage('assets/images/girlprofile.jpg',),fit: BoxFit.fill)
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(height: Get.height*0.02,),
        ],
      ),
    );
  }
}
