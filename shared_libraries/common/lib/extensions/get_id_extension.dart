import 'package:common/core/constans/constan_values.dart';

extension GetIdExtension on String {
  int get convertToId => int.parse(
        replaceAll(ConstanValues.apiConstans.baseUrl, "").replaceAll("/", ""),
      );
}
