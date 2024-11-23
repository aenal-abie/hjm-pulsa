import 'package:core/component/styles/colors.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class GSAutoComplete<T> extends StatelessWidget {
  final List<T> items;
  final bool? enabled;
  final bool? loading;
  final String? labelText;
  final Color? fillColor;
  final double? height;
  final T? selectedItem;
  final ValueChanged<T?>? onChanged;

  final DropdownSearchBuilder<T>? dropdownBuilder;
  final DropdownSearchItemAsString<T>? itemAsString;
  final InputBorder? border;

  const GSAutoComplete({super.key,
    this.itemAsString,
      required this.items,
      this.enabled,
      this.dropdownBuilder,
      this.loading,
      this.labelText,
      this.onChanged,
      this.height,
      this.fillColor,
      this.border,
      this.selectedItem});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      child: DropdownSearch<T>(
        itemAsString: itemAsString,
        items: items,
        enabled: enabled ?? true,
        selectedItem: selectedItem,
        dropdownBuilder: dropdownBuilder,
        dropdownButtonProps: DropdownButtonProps(
            icon: SvgPicture.asset("assets/icons/caret.svg")),
        dropdownDecoratorProps: DropDownDecoratorProps(
          baseStyle: GoogleFonts.poppins(color: Colors.grey, fontSize: 12),
          dropdownSearchDecoration: InputDecoration(
            helperStyle: GoogleFonts.poppins(color: Colors.grey, fontSize: 10),
            filled: true,
            labelText: labelText,
            suffix: Padding(
              padding: const EdgeInsets.all(2.0),
              child: loading ?? false
                  ? const SizedBox(
                      width: 24,
                      height: 20,
                      child: SpinKitThreeBounce(
                        size: 16,
                        color: primaryColor500,
                      ),
                    )
                  : null,
            ),
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            fillColor: fillColor ?? neutralColor200,
            focusedBorder: InputBorder.none,
            border: border ??
                const UnderlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide.none),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
