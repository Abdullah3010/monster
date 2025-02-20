import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

extension StringExtension on String {
  String? formatTimeHMMA() {
    DateTime? parsedDate = DateTime.tryParse(this);
    if (parsedDate != null) {
      return DateFormat('h:mm a').format(parsedDate);
    }
    return null;
  }

  String? formatDateDMY() {
    DateTime? parsedDate = DateTime.tryParse(this);
    if (parsedDate != null) {
      return DateFormat('dd/MM/yyyy').format(parsedDate);
    }
    return null;
  }

  int getPageFromUrl() {
    final Uri? uri = Uri.tryParse(this);

    return int.tryParse(uri?.queryParameters['page'] ?? '') ?? 1;
  }

  String getDateFormatForBackend() {
    DateTime? parsedDate = DateTime.tryParse(this);
    if (parsedDate != null) {
      return DateFormat('yyyy-MM-dd').format(parsedDate);
    }
    return '';
  }

  String getRx({bool withDotts = true}) {
    if (RegExp(r'^[0-9]+$').hasMatch(this)) {
      return 'Rx# $this${withDotts ? '...' : ''}';
    }

    return this;
  }

  String get translated => tr().replaceAll(' - 404', '');

  bool isValidNumber() {
    // Attempt to parse the string as a number (integer or double)
    final number = num.tryParse(this);
    // Return true if the parsing succeeded, meaning it's a valid number
    return number != null;
  }
}

extension StringNullExtension on String? {
  String? formatTimeHMMA() {
    DateTime? parsedDate = DateTime.tryParse(this ?? '');
    if (parsedDate != null) {
      return DateFormat('h:mm a').format(parsedDate);
    }
    return null;
  }

  String? formatDateDMY() {
    DateTime? parsedDate = DateTime.tryParse(this ?? '');
    if (parsedDate != null) {
      return DateFormat('dd/MM/yyyy').format(parsedDate);
    }
    return null;
  }

  int getPageFromUrl() {
    final Uri? uri = Uri.tryParse(this ?? '');

    return int.tryParse(uri?.queryParameters['page'] ?? '') ?? 1;
  }

  String getDateFormatForBackend() {
    DateTime? parsedDate = DateTime.tryParse(this ?? '');
    if (parsedDate != null) {
      return DateFormat('yyyy-MM-dd').format(parsedDate);
    }
    return '';
  }

  String getRx({bool withDotts = true}) {
    if (RegExp(r'^[0-9]+$').hasMatch(this ?? '')) {
      return 'Rx# ${this ?? ''}${withDotts ? '...' : ''}';
    }

    return this ?? '';
  }

  Color fromHex() {
    final buffer = StringBuffer();
    if (this?.length == 6 || this?.length == 7) buffer.write('ff');
    buffer.write((this ?? '').replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
