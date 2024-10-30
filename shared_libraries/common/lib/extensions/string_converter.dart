extension StringConverter on String {
  String capitalizeEachWordDash() {
    var stringDash = replaceAll("-", " ");

    return stringDash.split(' ').map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }
}
