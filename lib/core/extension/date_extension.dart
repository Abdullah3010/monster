import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String? formatTimeHMMA() {
    return DateFormat('h:mm a').format(this);
  }

  String? formatDateDMY() {
    return DateFormat('dd/MM/yyyy').format(this);
  }

  String? formatDateForBackend() {
    return DateFormat('yyyy-MM-dd').format(this);
  }
}
