import 'package:flutter/material.dart';
import 'package:taskmanagment/core/view/home/widgets/task_card.dart';
import 'package:taskmanagment/utils/extensions/context_ext.dart';

import '../../../utils/constans/string.dart';
import '../task/add_task.dart';

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
    final theme = context.theme;
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
                  Text(
                    'Task Manager',
                    style: theme.textTheme.headlineLarge,
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
                            ? theme.colorScheme.primary // Selected color
                            : theme.colorScheme.secondary;
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
                                  style:
                                      theme.textTheme.headlineMedium?.copyWith(
                                    color: _selectedDateIndex == index
                                        ? theme.colorScheme.onPrimary
                                        : theme.colorScheme.primary,
                                  ),
                                ),
                                Text(
                                  daysNames[index],
                                  style: theme.textTheme.labelLarge?.copyWith(
                                    color: _selectedDateIndex == index
                                        ? theme.colorScheme.onPrimary
                                        : theme.colorScheme.primary,
                                  ),
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
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30.0)),
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(left: 60.0, top: 30.0,bottom: 10),
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
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTaskScreen(),
            ),
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: const Icon(Icons.create),
      ),
    );
  }
}
