import 'package:demo/utils/constant.dart';
import 'package:demo/utils/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: kPrimaryColor),
        backgroundColor: kBackgroundColor,
        elevation: 0,
        title: Text(
          'Settings',
          style: TextStyle(
              color: kTitleColor, fontWeight: FontWeight.w600, fontSize: 20),
        ),
        centerTitle: true,
        leading: InkWell

        (
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back)),
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: Get.width*0.04),
            child: Transform.scale(scaleX: -1,
                child: Icon(Icons.nights_stay_sharp,color: kTitleColor,)),
          )
        ],
      ),
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: Get.width*0.08,vertical: Get.height*0.03),
                height: Get.height*0.37,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.22),
                        offset: const Offset(0,3),
                        blurRadius: 4,
                      )
                    ]
                ),
                child: ListView.builder(
                  itemCount: 4,
                    itemBuilder: (BuildContext context,int index){
                  return ListTile(
                      leading: Container(
                        padding: EdgeInsets.all(11),
                        height: Get.height*0.05,
                        width: Get.width*0.12,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kPurpleColor
                        ),
                        child: SvgPicture.asset(setting[index]["icon"].toString(),)
                      ),
                      title: Text(setting[index]["tital"].toString(),style: TextStyle(color: kTitleColor,fontSize: 20,fontWeight: FontWeight.w600),),
                      subtitle: Text(setting[index]['subtital'].toString(),style: TextStyle(color: ksubtitamarketColor,fontSize: 14),),
                      trailing: Icon(Icons.edit,color: Colors.black,size: 20,)
                  );
                })
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: Get.width*0.08,vertical: Get.height*0.01),
                  height: Get.height*0.27,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.22),
                          offset: const Offset(0,3),
                          blurRadius: 4,
                        )
                      ]
                  ),
                  child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (BuildContext context,int index){
                        return Padding(
                          padding:  EdgeInsets.symmetric(vertical: Get.height*0.01),
                          child: ListTile(
                              leading: Container(
                                  padding: EdgeInsets.all(11),
                                  height: Get.height*0.05,
                                  width: Get.width*0.12,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: kPurpleColor
                                  ),
                                  child: SvgPicture.asset(settingtwo[index]["icon"].toString(),)
                              ),
                              title: Text(settingtwo[index]["tital"].toString(),style: TextStyle(color: kTitleColor,fontSize: 20,fontWeight: FontWeight.w600),),
                              trailing: Icon(Icons.arrow_forward_ios,size: 15,)
                          ),
                        );
                      })
              ),
              SizedBox(height: Get.height*0.05,),
              Text('LOG OUT',style: TextStyle(color:kPrimaryColor,fontSize: 16,fontWeight: FontWeight.w700),),
            ],
          ),
    ),
    );
  }
}
