import 'package:news_app/app/core/env/color_style.dart';
import 'package:news_app/app/core/env/text_style.dart';

class Env {
  final ColorsStyle colorsStyle = ColorsStyle();
  final TextStyles textStyle = TextStyles();

  Env._();

  static final Env _instance = Env._();

  static Env get I => _instance;

  static ColorsStyle get colors => I.colorsStyle;
  static TextStyles get textStyles => I.textStyle;
}
