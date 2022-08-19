import 'package:flutter/material.dart';

class TestingOne extends StatefulWidget {
  const TestingOne({Key? key}) : super(key: key);

  @override
  State<TestingOne> createState() => _TestingOneState();
}

class _TestingOneState extends State<TestingOne> {
  String isClicked = "first";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isClicked = "first";
                      });
      
                      print("type: " + isClicked);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width:isClicked == "first" ? 130 : 50,
      
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.yellow,
      
                      ),
                      
                      child: Row(
                        children: [const Icon(Icons.access_alarm),
                        
                        isClicked == "first" ?  const Text("Ramesh") : Container()
                         ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
      
      
                      InkWell(
                    onTap: () {
                      setState(() {
                        isClicked = "second";
                      });
      
                      print("type: " + isClicked);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height:  50,
                      width: isClicked == "second" ? 130 : 50,
                       decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.yellow,
      
                      ),
                      child: Row(
                        children: [const Icon(Icons.access_alarm),
      
                        isClicked == "second" ?  const Text("Ramesh") : Container()
                     
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
      
                  
      
      
              
                ],
              ),
      
              const SizedBox(height: 20,),

              isClicked == "first" ?
      
                  yes() : isClicked == "second" ? no() : Container()
            ],
          ),
        ),
      ),
    );
  }

  Text yes() => const Text("yes");
  Text no() => const Text("No");
}
