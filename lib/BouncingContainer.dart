import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

class BouncingContainer extends StatefulWidget {
  final String text;
  final Color color;
  Widget navigateTo;

  BouncingContainer({
    Key? key,
    required this.text,
    required this.navigateTo,
    required this.color,
  }) : super(key: key);

  @override
  _BouncingContainerState createState() => _BouncingContainerState();
}

class _BouncingContainerState extends State<BouncingContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _animation = Tween<double>(begin: 1, end: 0.95).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 450;
    double hight = MediaQuery.of(context).size.height / 1500;

    return GestureDetector(
      onTap: () {
        _controller.forward();
        Future.delayed(Duration(milliseconds: 300), () {
          _controller.reverse();

          Future.delayed(Duration(milliseconds: 300), () {
            widget.navigateTo.launch(
                context, pageRouteAnimation: PageRouteAnimation.Slide);
          });
        });
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.scale(
            scale: _animation.value,
            child: Padding(
              padding: EdgeInsets.all(8.0 * width),
              child: Container(
                width: 180 * width,
                height: 180 * width, // Adjusted height to maintain aspect ratio
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.circular(20 * width),
                  border: Border.all(color: Colors.white24, width: 10 * width),
                  boxShadow: [
                    BoxShadow(
                      color: widget.color.withOpacity(0.5),
                      spreadRadius: 5 * width,
                      blurRadius: 10 * width,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Container(
                  child: Center(
                    child: Text(
                      widget.text,
                      style: GoogleFonts.openSans(
                        fontSize: 18 * width,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
