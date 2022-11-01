import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'constant.dart';

class Header extends StatelessWidget {
  final heading;
  final des;
  final image;
  final EdgeInsets? padding;
  Header(
      {Key? key,
      required this.des,
      required this.heading,
      required this.image,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: w * 0.08, right: w * 0.08, top: h * 0.07),
      height: h * 0.25,
      width: w,
      decoration: BoxDecoration(
        gradient: kbluegradiant,
        borderRadius: BorderRadius.circular(h * 0.01),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  // "Community ",
                  heading,
                  style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: kWhiteColor),
                ),
                SizedBox(
                  height: h * 0.015,
                ),
                Expanded(
                  child: Text(
                    // "Tune in to a Live Power Hour, Watch On-Demand or Join a Slack Community",
                    des,
                    // overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: kWhiteColor),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              flex: 2,
              child: Visibility(
                visible: image != "",
                child: Image.asset(
                  // "assets/images/magnifying glass.png",
                  image,
                  height: h * 0.1,
                ),
              )),
        ],
      ),
    );
  }
}
