import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, icon }

class MyButton extends StatefulWidget {
  const MyButton({
    super.key,
    this.height,
    this.width,
    required this.text,
    required this.onTap,
    this.type = ButtonType.primary,
    this.bgColor,
    this.textColor,
    this.image = '',
  });

  final double? width;
  final double? height;
  final String text;
  final VoidCallback onTap;
  final ButtonType type;
  final Color? bgColor;
  final Color? textColor;
  final String image;

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      // untuk Default Button
      case ButtonType.primary:
        return SizedBox(
          width: widget.width ?? 255,
          height: widget.height ?? 45,
          child: ElevatedButton(
            onPressed: widget.onTap,
            style: ElevatedButton.styleFrom(
                primary: widget.bgColor ?? Color(0xff619EF5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: Text(
              widget.text,
              style: TextStyle(
                color: widget.textColor ?? Color(0xffffffff),
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        );
      // untuk Secondary Button
      case ButtonType.secondary:
        return SizedBox(
          width: widget.width ?? 255,
          height: widget.height ?? 45,
          child: ElevatedButton(
            onPressed: widget.onTap,
            style: ElevatedButton.styleFrom(
                onPrimary: Color(0xff619EF5),
                side: const BorderSide(
                  color: Color(0xff619EF5),
                  width: 3,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
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
      case ButtonType.icon:
        return SizedBox(
          width: widget.width ?? 255,
          height: widget.height ?? 45,
          child: ElevatedButton(
              onPressed: widget.onTap,
              style: ElevatedButton.styleFrom(
                  onPrimary: Color(0xff619EF5),
                  side: const BorderSide(
                    color: Color(0xff619EF5),
                    width: 3,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    widget.image,
                    width: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
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
              )),
        );
    }
  }
}
