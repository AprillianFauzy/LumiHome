import 'package:flutter/material.dart';

class CardMenuProfile extends StatelessWidget {
  const CardMenuProfile({
    super.key,
    required this.onTap,
    required this.text,
  });

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 13, vertical: 15),
          color: Color(0xFFDFECFD),
          child: Row(
            children: [
              Text(
                text,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Spacer(),
              Image.asset('images/more.png')
            ],
          ),
        ),
      ),
    );
  }
}
