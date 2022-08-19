import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/constant.dart';

class SocialmePeople extends StatefulWidget {
  const SocialmePeople({Key? key}) : super(key: key);

  @override
  State<SocialmePeople> createState() => _Socialme_peopleState();
}

class _Socialme_peopleState extends State<SocialmePeople> {
  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
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
                        style: const TextStyle(
                            color: kTitleColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      subtitle: const Text('2,349 XP',style: TextStyle(fontSize: 14,color: kSubTitleColor),),
                      trailing: const Icon(Icons.arrow_forward_ios,size: 18,),
                      leading: Container(
                        height: Get.height * 0.12,
                        width: Get.width * 0.12,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.green,
                          image: const DecorationImage(image: AssetImage('assets/images/sociallogo.jpg',),fit: BoxFit.fill)
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(height: Get.height*0.02,),
          ],
        ),
      ),
    );
  }
}
