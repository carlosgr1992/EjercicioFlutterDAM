import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/widgets.dart';

class PlatformAdmin {
  static final PlatformAdmin _platformAdmin = PlatformAdmin._internal();

  late double _screenWidth;
  late double _screenHeight;
  late bool _isWeb;

  factory PlatformAdmin() {
    return _platformAdmin;
  }

  PlatformAdmin._internal() {
    _screenWidth = 0;
    _screenHeight = 0;
    _isWeb = kIsWeb;

    // Actualiza el tamaño de la pantalla cuando se crea la instancia
    updateScreenSize();
  }

  Future<void> updateScreenSize() async {
    if (_isWeb) {
      // Para la web, simplemente establecemos un tamaño fijo
      _screenWidth = 800;
      _screenHeight = 600;
    } else {
      // Para otras plataformas, utilizamos MediaQuery para obtener el tamaño de la pantalla
      _screenWidth = MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width;
      _screenHeight = MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.height;
    }
  }

  double get screenWidth => _screenWidth;
  double get screenHeight => _screenHeight;
  bool get isWeb => _isWeb;

  bool get isMobile => _screenWidth < 600;
  bool get isTablet => _screenWidth >= 600 && _screenWidth < 1200;
  bool get isDesktop => _screenWidth >= 1200;
}
