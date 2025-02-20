import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class PickerHelper {
  static Future<XFile?> pickImage({required ImageSource source}) async {
    try {
      final XFile? pickedFile = await ImagePicker().pickImage(source: source);
      return pickedFile;
    } catch (e) {
      print('Error picking image: $e');
      return null;
    }
  }

  /// Picks a file with specific [extensions].
  static Future<String?> pickFile({List<String>? allowedExtensions}) async {
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: allowedExtensions != null ? FileType.custom : FileType.any,
        allowedExtensions: allowedExtensions,
      );
      return result?.files.single.path;
    } catch (e) {
      print('Error picking file: $e');
      return null;
    }
  }
}
