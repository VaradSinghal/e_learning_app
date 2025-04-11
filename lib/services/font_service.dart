import 'package:get_storage/get_storage.dart';

class FontService {
  static const String _fontSizeKey = 'font_size_scale';
  static const String _fontFamilyKey = 'font_family';
  static final _storage = GetStorage();

  static const Map<String, String> availableFonts = {
    'Poppins': 'poppins',
    'Roboto': 'roboto',
    'Lato': 'lato',
    'Open Sans': 'openSans',
    'Montserrat': 'montserrat',
  };

  
}
