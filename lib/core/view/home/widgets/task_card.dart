import 'package:flutter/material.dart';
import 'package:taskmanagment/utils/extensions/context_ext.dart';

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
    final theme=context.theme;
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

        Flexible(
          child: Container(
            height: 100.0,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration:  BoxDecoration(
              color: theme.colorScheme.secondary,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
              ),
            ),
            child: Row(
              children: [
                Text(
                  number,
                  style: theme.textTheme.headlineLarge,
                ),
                const SizedBox(width: 10,),
                Flexible(
                  child: Text(
                    item,
                    style: theme.textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                    // Prevent overflow by truncating text
                    maxLines: 1,
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
