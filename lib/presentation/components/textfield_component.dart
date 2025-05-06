import 'package:capstone_frontend/presentation/styles/theme.dart';
import 'package:flutter/material.dart';

class XTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool obsecure;

  const XTextField({
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obsecure = false,
    this.validator,
    super.key,
  });

  @override
  State<XTextField> createState() => _XTextFieldState();
}

class _XTextFieldState extends State<XTextField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obsecure;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
            color: XColors.black,
          ),
        ),
        TextFormField(
          validator: widget.validator,
          obscureText: _isObscured,
          controller: widget.controller,
          cursorColor: XColors.primary,
          cursorErrorColor: Colors.red.shade400,
          style: TextStyle(fontSize: 16.0),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(16.0),
            suffixIcon:
                widget.obsecure
                    ? IconButton(
                      icon: Icon(
                        _isObscured ? Icons.visibility_off : Icons.visibility,
                        color: XColors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                      },
                    )
                    : null,
            border: WidgetStateInputBorder.fromMap({
              WidgetState.focused: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(color: XColors.primary),
              ),
              WidgetState.error: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(color: Colors.red.shade400),
              ),
              WidgetState.any: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(color: XColors.grey),
              ),
            }),
          ),
        ),
      ],
    );
  }
}
