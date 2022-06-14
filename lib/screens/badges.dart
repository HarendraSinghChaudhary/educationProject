import 'package:demo/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Badges extends StatefulWidget {
  const Badges({Key? key}) : super(key: key);

  @override
  State<Badges> createState() => _BadgesState();
}

class _BadgesState extends State<Badges> {
  ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal:Get.width*0.085),
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
                    title: Text(
                      'Perfectionist',
                      style: TextStyle(
                          color: kTitleColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text('Finish all lessons of a chapter',style: TextStyle(fontSize: 14,color: kSubTitleColor),),
                    leading: Container(
                      height: Get.height * 0.12,
                      width: Get.width * 0.12,
                      child: Image.asset('assets/images/resumereviewnew.png'),
                    ),
                  );
                }),
          ),
        ],),
      ),
    );
  }
}
