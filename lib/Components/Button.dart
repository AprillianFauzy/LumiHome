import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, icon }

class MyButton extends StatefulWidget {
  const MyButton({
    Key? key,
    this.width,
    this.height,
    required this.text,
    required this.onTap,
    this.type = ButtonType.primary,
    this.bgColor,
    this.textColor,
    this.image = '',
  }) : super(key: key);

  final double? width;
  final double? height;
  final String text;
  final VoidCallback onTap;
  final ButtonType type;
  final Color? bgColor;
  final Color? textColor;
  final String image;

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    final width = widget.width ?? 255;
    final height = widget.height ?? 45;
    final bgColor = widget.bgColor ?? const Color(0xff619EF5);
    final textColor = widget.textColor ?? Colors.white;

    final buttonStyle = ElevatedButton.styleFrom(
      primary: bgColor,
      onPrimary: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final textStyle = TextStyle(
      color: textColor,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      fontFamily: 'Poppins',
    );

    switch (widget.type) {
      case ButtonType.primary:
        return _buildButton(width, height, buttonStyle, textStyle);
      case ButtonType.secondary:
        return _buildSecondaryButton(width, height);
      case ButtonType.icon:
        return _buildIconButton(width, height);
    }
  }

  Widget _buildButton(
      double width, double height, ButtonStyle style, TextStyle textStyle) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: widget.onTap,
        style: style,
        child: Text(widget.text, style: textStyle),
      ),
    );
  }

  Widget _buildSecondaryButton(double width, double height) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: widget.onTap,
        style: ElevatedButton.styleFrom(
          onPrimary: const Color(0xff619EF5),
          side: const BorderSide(color: Color(0xff619EF5), width: 3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          widget.text,
          style: const TextStyle(
            color: Color(0xff619EF5),
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(double width, double height) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: widget.onTap,
        style: ElevatedButton.styleFrom(
          onPrimary: const Color(0xff619EF5),
          side: const BorderSide(color: Color(0xff619EF5), width: 3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.image.isNotEmpty) Image.asset(widget.image, width: 25),
            const SizedBox(width: 10),
            Text(
              widget.text,
              style: const TextStyle(
                color: Color(0xff619EF5),
                fontSize: 15,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
