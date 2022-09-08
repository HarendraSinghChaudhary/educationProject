import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_view/story_view.dart';
import 'package:http/http.dart' as http;

import '../models/study_material_model.dart';
import '../utils/endpoint_url.dart';

class StoryViewBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<StoryViewController>(() => StoryViewController());
  }
}
class StoryViewController extends GetxController{
  final storyController = StoryController();
  RxBool isLoading = true.obs;
  @override
  void onInit(){
    studyMaterialApi(StroryViews.id);
    super.onInit();
  }

  RxList<StudyMaterialModel> studyMaterialList = RxList();
   Future<dynamic> studyMaterialApi(String id) async {
    // isLoading(true);
    print("...."+ id.toString());

    var request = http.get(
      Uri.parse(RestDatasource.STUDYMETERIAL_URL + id),
      headers: {
        "Authorization":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2MmI1NzhjNzNlMWY2ODNhZTcwM2JhNGMiLCJlbWFpbCI6ImNoYWl0YW55YUBnbWFpbC5jb20iLCJpYXQiOjE2NTYwNjAzMzN9.xQy5ZCyQrXu_y54fXIV5VOo5fsNvt__R8L6wWrTshWI"
      },
    );

    String msg = "";
    var jsonArray;
    var jsonRes;
    var res;

    await request.then((http.Response response) {
      res = response;
      const JsonDecoder _decoder = JsonDecoder();
      jsonRes = _decoder.convert(response.body.toString());
      print("Response: " + response.body.toString() + "_");
      print("ResponseJSON: " + jsonRes.toString() + "_");
      msg = jsonRes["message"].toString();
      jsonArray = jsonRes['Moduledata'];
    });

    if (res.statusCode == 200) {
      print(jsonRes["status"]);

      if (jsonRes["status"].toString() == "true") {
        studyMaterialList.clear();
        for (var i = 0; i < jsonArray.length; i++) {
          StudyMaterialModel modelAgentSearch = StudyMaterialModel();
          modelAgentSearch.id = jsonArray[i]["_id"].toString();
          modelAgentSearch.StudayMaterial = jsonArray[i]["StudayMaterial"].toString();
          modelAgentSearch.Moduletitle = jsonArray[i]["Moduletitle"].toString();
          modelAgentSearch.image = jsonArray[i]["image"].toString();

        

     
        

          studyMaterialList.add(modelAgentSearch);

          print("name: " + jsonArray[i]["courseData"].toString());


          // update();
        }


        isLoading(false);
        update();
      } else {
        Get.snackbar(
          "",
          "",
          snackPosition: SnackPosition.TOP,
          titleText: Text(jsonRes["message"].toString()),
          messageText: Text(""),
          colorText: Colors.red,
        );

        isLoading(false);
        update();
      }
    } else {
      Get.snackbar(
        "",
        "",
        snackPosition: SnackPosition.TOP,
        titleText: Text("Please try later"),
        messageText: Text(""),
        colorText: Colors.red,
      );

      isLoading(false);
      update();
    }
  }

}

class StroryViews extends GetView<StoryViewController>{
 static String id="", title="",moduleId="";
  @override
  Widget build (BuildContext context){
    controller.onInit();
    return Scaffold(
      appBar: AppBar(
        title: Text("More"),
      ),
      body: StoryView(
        storyItems: 
        List.generate(controller.studyMaterialList.length, (index) {
          return StoryItem(Container(), duration: const Duration(seconds: 60));
        }),
        onStoryShow: (s) {
          print("Showing a story");
        },
        onComplete: () {
          print("Completed a cycle");
        },
        progressPosition: ProgressPosition.top,
        repeat: false,
        controller:controller.storyController,
      ),
    );

  }
}

class MoreStories extends StatefulWidget {
  @override
  _MoreStoriesState createState() => _MoreStoriesState();
}

class _MoreStoriesState extends State<MoreStories> {
  final storyController = StoryController();
@override
void initState() {
  super.initState();

}
  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
 return Scaffold(
      // appBar: AppBar(
      //   title: Text("More"),
      // ),
      body: StoryView(
        storyItems: [
          StoryItem.text(
            title: "I guess you'd love to see more of our food. That's great.",
            backgroundColor: Colors.blue,
          ),
          StoryItem.text(
            title: "Nice!\n\nTap to continue.",
            backgroundColor: Colors.red,
            textStyle: TextStyle(
              fontFamily: 'Dancing',
              fontSize: 40,
            ),
          ),
          StoryItem.pageImage(
            url:
                "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
            caption: "Still sampling",
            controller: storyController,
          ),
          StoryItem.pageImage(
              url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
              caption: "Working with gifs",
              controller: storyController),
          StoryItem.pageImage(
            url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
            caption: "Hello, from the other side",
            controller: storyController,
          ),
          StoryItem.pageImage(
            url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
            caption: "Hello, from the other side2",
            controller: storyController,
          ),
        ],
        onStoryShow: (s) {
          print("Showing a story");
        },
        onComplete: () {
          print("Completed a cycle");
        },
        progressPosition: ProgressPosition.top,
        repeat: false,
        controller: storyController,
      ),
    );
      }
}