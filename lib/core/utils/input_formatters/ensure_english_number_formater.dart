import 'package:flutter/services.dart';

class EnsureEnglishNumberFormater extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Mapping Arabic numerals to English numerals
    String formattedText = newValue.text.replaceAllMapped(
      RegExp(r'[٠١٢٣٤٥٦٧٨٩]'), // Regular expression for Arabic numbers
      (match) {
        return _arabicToEnglishNumbers[match.group(0)!]!;
      },
    );

    // Return the formatted text
    return newValue.copyWith(text: formattedText);
  }

  // Arabic numbers to English numbers mapping
  static const _arabicToEnglishNumbers = {
    '٠': '0',
    '١': '1',
    '٢': '2',
    '٣': '3',
    '٤': '4',
    '٥': '5',
    '٦': '6',
    '٧': '7',
    '٨': '8',
    '٩': '9',
  };
}
