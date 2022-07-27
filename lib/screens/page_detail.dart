import 'package:Ambitious/controllers/study_material/study_material_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';




class PageViewController extends StatefulWidget {

    String title, id;
  PageViewController({Key? key, required this.title, required this.id})
      : super(key: key);
@override
_MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PageViewController> {

PageController controller=PageController();
// List<Widget> _list=<Widget>[
//     Center(child:new Pages(text: "Page 1",)),
// 	new Center(child:new Pages(text: "Page 2",)),
// 	new Center(child:new Pages(text: "Page 3",)),
// 	new Center(child:new Pages(text: "Page 4",))
// ];
int _curr=0;


  StudyMaterialController studyMaterialController =
      Get.put(StudyMaterialController(), permanent: false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    studyMaterialController.studyMaterialApi(widget.id);
  }

@override
Widget build(BuildContext context) {
	return Scaffold(
	backgroundColor: Colors.grey,
	appBar:AppBar(
		title: Text("GeeksforGeeks"),
	
),
	body: PageView(
  children: <Widget>[
    Container(
      color: Colors.pink,
    ),
    Container(
      color: Colors.cyan,
    ),
    Container(
      color: Colors.deepPurple,
    ),
  ],
)


  );
}
}


