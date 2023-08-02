import 'package:common/core/constans/constan_values.dart';

extension GetSvgSource on int {
  String get toSvg => "${ConstanValues.apiConstans.baseImageUrl}$this.svg";
}
