import 'package:flutter/material.dart';
import 'package:taskmanagment/utils/extensions/context_ext.dart';

class MiddleContainer extends StatelessWidget {
  final bool showShadow;
  final bool isSignupScreen;
  final VoidCallback onSubmit;

  const MiddleContainer({
    super.key,
    required this.showShadow,
    required this.isSignupScreen,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final theme=context.theme;
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 400),
      curve: Curves.bounceInOut,
      top: isSignupScreen ? 535 : 480,
      right: 0,
      left: 0,
      child: Center(
        child: Material(
          type: MaterialType.transparency,
          elevation: 10.0,
          color: Colors.transparent,
          child: InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            onTap: showShadow ? null : onSubmit,
            child: Container(
              height: 90,
              width: 90,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: theme.colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    if (showShadow)
                      BoxShadow(
                        color: Colors.black.withOpacity(.3),
                        spreadRadius: 1.5,
                        blurRadius: 10,
                      )
                  ]),
              child: !showShadow
                  ? Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.orange[200]!, Colors.red[400]!],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.3),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: const Offset(0, 1))
                          ]),
                      child: Icon(
                        Icons.arrow_forward,
                        color: theme.colorScheme.onPrimary,
                      ),
                    )
                  : const Center(),
            ),
          ),
        ),
      ),
    );
  }
}
