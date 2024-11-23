import 'package:core/component/styles/colors.dart';
import 'package:core/component/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GSPasswordField extends StatefulWidget {
  final String? hint;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final ValueChanged<String>? onChange;

  const GSPasswordField(this.hint,
      {Key? key, this.controller, this.textInputType, this.onChange})
      : super(key: key);

  @override
  State<GSPasswordField> createState() => _GSPasswordFieldState();
}

class _GSPasswordFieldState extends State<GSPasswordField> {
  var _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChange,
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        hintText: widget.hint,
        hintStyle: bodyStyle.copyWith(color: neutralColor200),
        labelStyle: GoogleFonts.poppins(color: neutralColor200),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 11.0, horizontal: 10.0),
        fillColor: neutralColor50,
        suffixIcon: GestureDetector(
            onTap: () => setState(() {
                  _obscureText = !_obscureText;
                }),
            child: Padding(
              padding: const EdgeInsets.only(right: 14.0),
              child: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                size: 20,
                color: _obscureText ? primaryColor200 : primaryColor500,
                semanticLabel: _obscureText ? 'Lihat Sandi' : 'Tutup Sandi',
              ),
            )),
        suffixIconConstraints:
            const BoxConstraints(minWidth: 24, maxHeight: 24),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        //fillColor: Colors.green
      ),
      keyboardType: TextInputType.visiblePassword,
      style: GoogleFonts.poppins(fontSize: 12),
    );
  }
}
