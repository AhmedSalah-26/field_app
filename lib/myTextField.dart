import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class myTextField extends StatefulWidget {
  final Color color;
   TextEditingController textEditingController = TextEditingController();
   myTextField({
    Key? key,
    required this.textEditingController,
    required this.color,
  }) : super(key: key);

  @override
  _BouncingContainerState createState() => _BouncingContainerState();
}

class _BouncingContainerState extends State<myTextField>
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
    return GestureDetector(
      onTap: () {
        _controller.forward();
        Future.delayed(Duration(milliseconds: 300), () {
          _controller.reverse();
        });
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.scale(
            scale: _animation.value,
            child: Container(
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white24, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: widget.color.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Center(
                child: Expanded(
                  child: TextField(
                    controller: widget.textEditingController ,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Y',
                        border: InputBorder.none
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
