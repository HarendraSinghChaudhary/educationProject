import 'package:demo/utils/constant.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
class ProfileCompleted extends StatefulWidget {
  const ProfileCompleted({Key? key}) : super(key: key);

  @override
  State<ProfileCompleted> createState() => _ProfileCompletedState();
}

class _ProfileCompletedState extends State<ProfileCompleted> {
  ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              padding: EdgeInsets.only(left: Get.width*0.06, right: Get.width*0.06, top: Get.height*0.01),
              itemCount: 10,
              controller: _controller,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: Get.height*0.03,
                childAspectRatio: 1.15,
                crossAxisSpacing: Get.width*0.03,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: Get.height*0.1,
                        width: Get.height*0.2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/img_4.png'),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height*0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          'iPhone Photography for Creators',
                          maxLines: 2,

                          style: TextStyle(
                            height: 1.2,
                            color: Color(0xff344356),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

          ],
        ),
      ),
    ),
    );
  }
}
