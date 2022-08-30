import 'package:flutter/material.dart';

class Stepernew extends StatefulWidget {
  const Stepernew({Key? key}) : super(key: key);

  @override
  State<Stepernew> createState() => _StepernewState();
}

class _StepernewState extends State<Stepernew> {
  List<Widget> cards = [
    Center(
      child: Text("1"),
    ),
    Center(
      child: Text("2"),
    ),
    Center(child: Text("3")),
    Center(child: Text("4")),
    Center(child: Text("5")),
  ];
  int cardindex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 70),
      height: 300,
      color: Colors.white,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: cards[cardindex]),
          Expanded(
            flex: 1,
            child: Column(
              children: List.generate(5, (index) {
                return Expanded(
                  child: Column(
                              children: [
                  GestureDetector(
                    onTap: (){
                        cardindex = index;

                      setState(() {
                        print(cardindex);
                      });
                    },
                    child: const CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.green,
                      child: 
                      
                      Icon(
                        Icons.done
                      ),
                    ),
                  ),
                           index!=4?   Expanded(
                             child: Container(
                                               height:70,
                                               width: 1.0,
                                               color: Colors.grey,
                                             ),
                           ):SizedBox(
                
                  ),
                            
                
                
                              ],
                            ),
                );

              }),
            )
            
          //   ListView.builder(
          //     shrinkWrap: true,
          //     itemCount: 5,
          //     itemBuilder: ((context, index) => 
          //   Column(
          //     children: [
          //       const CircleAvatar(
          //         radius: 15,
          //         backgroundColor: Colors.green,
          //         child: 
                  
          //         Icon(
          //           Icons.done
          //         ),
          //       ),
          //  index!=4?   Container(
          //         height:70,
          //         width: 1.0,
          //         color: Colors.grey,
          //       ):SizedBox(

          //       ),
            


          //     ],
          //   )
          //   ))
          
          )
        ],
      ),
    );
  }
}