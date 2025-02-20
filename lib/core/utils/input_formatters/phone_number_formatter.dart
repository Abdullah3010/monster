import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  final String countryCode;

  PhoneNumberFormatter(this.countryCode);

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String newRawText = newValue.text.replaceAll(' ', '');
    // +20 123 456 7890 for Egypt.
    // +971 50 234 5678 for UAE.
    // +49 151 23456789 for Germany.

    if (!newRawText.startsWith(countryCode)) {
      if (newRawText.length < countryCode.length) {
        return TextEditingValue(
          text: countryCode,
          // selection: TextSelection.collapsed(offset: selectionIndex.clamp(0, newFormattedText.length)),
        );
      }
      newRawText = countryCode + newRawText;
    }

    List<String> newStrignList = newRawText.split('');

    if (countryCode == '+20') {
      if (newStrignList.length > 3) {
        newStrignList.insert(3, ' ');
      }
      if (newStrignList.length > 7) {
        newStrignList.insert(7, ' ');
      }
      if (newStrignList.length > 11) {
        newStrignList.insert(11, ' ');
      }
      if (newStrignList.length > 16) {
        newStrignList.removeLast();
      }
    } else if (countryCode == '+971') {
      if (newStrignList.length > 4) {
        newStrignList.insert(4, ' ');
      }
      if (newStrignList.length > 7) {
        newStrignList.insert(7, ' ');
      }

      if (newStrignList.length > 11) {
        newStrignList.insert(11, ' ');
      }
      if (newStrignList.length > 16) {
        newStrignList.removeLast();
      }
    } else if (countryCode == '+49') {
      if (newStrignList.length > 4) {
        newStrignList.insert(4, ' ');
      }
      if (newStrignList.length > 7) {
        newStrignList.insert(7, ' ');
      }
      if (newStrignList.length > 16) {
        newStrignList.removeLast();
      }
    }

    int cursorPosition = newValue.selection.baseOffset;
    int formattedCursorPosition = cursorPosition;
    int spaceCount = newStrignList.where((char) => char == ' ').length;
    formattedCursorPosition += spaceCount;

    return TextEditingValue(
      text: newStrignList.join(),
      selection: TextSelection.collapsed(offset: formattedCursorPosition.clamp(0, newStrignList.length)),
    );
  }
}
