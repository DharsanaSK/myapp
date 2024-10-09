import 'package:flutter/material.dart';

class SquareTile extends StatefulWidget {
  final String imagePath;

  const SquareTile({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  _SquareTileState createState() => _SquareTileState();
}

class _SquareTileState extends State<SquareTile> {
  bool _isTapped = false;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _isTapped = true;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _isTapped = false;
    });
  }

  void _onTapCancel() {
    setState(() {
      _isTapped = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add desired onTap functionality here
      },
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _isTapped
                ? [Colors.grey[300]!, Colors.white]
                : [Colors.white, Colors.grey[300]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(color: Colors.grey[400]!),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Image.asset(
            widget.imagePath,
            height: 40,
          ),
        ),
      ),
    );
  }
}
