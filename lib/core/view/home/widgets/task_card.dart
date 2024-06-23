import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String number;
  final String item;
  final Color backgrClr;
  final Color firstCircle;
  final Color secondCircle;

  const TaskCard(
      {super.key,
      required this.number,
      required this.item,
      required this.backgrClr,
      required this.firstCircle,
      required this.secondCircle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                color: backgrClr,
              ),
            ),
            Positioned(
              top: 0.0,
              right: 0.0,
              child: Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  color: firstCircle,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(60.0),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              child: Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  color: secondCircle,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(60.0),
                  ),
                ),
              ),
            ),
          ],
        ),


        //--------------> right side container for task details <--------------//

        Container(
          height: 100.0,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: const BoxDecoration(
            color: Color(0xFFffe5b4),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40.0),
              bottomRight: Radius.circular(40.0),
            ),
          ),
          child: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  number,
                  style: const TextStyle(
                    fontSize: 30.0,
                    color: Color(0xFF00003f),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  item,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Color(0xFF00003f),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
