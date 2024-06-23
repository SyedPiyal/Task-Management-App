import 'package:flutter/material.dart';
import 'package:taskmanagment/core/view/home/widgets/task_card.dart';

import '../../../utils/constans/string.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // Add a state variable to keep track of the selected date index
  int _selectedDateIndex = 0; // Initialize with -1 (no selection)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 30.0, right: 15.0, top: 30.0, bottom: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Task Manager',
                    style: TextStyle(
                      color: Color(0xFF00003f),
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  SizedBox(
                    height: 70.0,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        // Determine the background color based on selection
                        Color backgroundColor = _selectedDateIndex == index
                            ? const Color(0xFF00003f) // Selected color
                            : const Color(0xFFffe5b4);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedDateIndex =
                                  index; // Update the selected index
                            });
                          },
                          child: Container(
                            height: 55.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: backgroundColor),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  days[index].toString(),
                                  style: TextStyle(
                                      color: _selectedDateIndex == index
                                          ? Colors.white
                                          : const Color(0xFF00003f),
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  daysNames[index],
                                  style: TextStyle(
                                      color: _selectedDateIndex == index
                                          ? Colors.white
                                          : const Color(0xFF00003f),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 15.0,
                        );
                      },
                      itemCount: days.length,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(30.0)),
                      color: Color(0xFF00003f),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60.0, top: 30.0),
                    child: ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        return TaskCard(
                          number: (index + 1).toString(),
                          item: items[index],
                          backgrClr: colors[(index % colors.length)],
                          firstCircle: colors[(index + 1) % colors.length],
                          secondCircle: colors[(index + 2) % colors.length],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 40.0,
                        );
                      },
                      itemCount: 4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
