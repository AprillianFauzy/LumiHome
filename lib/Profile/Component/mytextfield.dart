import 'package:flutter/material.dart';

enum FieldType { normal, password }

class MyTextField extends StatefulWidget {
  const MyTextField({
    required this.labelText,
    required this.text,
    required this.value,
    required this.controller,
    this.fieldType = FieldType.normal,
    this.readonly = false,
    this.obscureText = false,
    Key? key,
  }) : super(key: key);

  final String labelText;
  final String value;
  final String text;
  final TextEditingController controller;
  final FieldType fieldType;
  final bool readonly;
  final bool? obscureText;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    // Set initial value for the TextField
    widget.controller.text = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            fontFamily: 'Poppins',
          ),
        ),
        SizedBox(height: 8),
        TextField(
          readOnly: widget.readonly,
          controller: widget.controller,
          obscureText:
              widget.fieldType == FieldType.password && !_passwordVisible,
          decoration: InputDecoration(
            labelText: widget.labelText,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            filled: true,
            fillColor: Colors.transparent,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            suffixIcon: widget.fieldType == FieldType.password
                ? IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  )
                : null,
          ),
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
