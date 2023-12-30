class StringUtils {
  /// Convert a number to character based column
  static String numericToLetters(int number) {
    var letters = '';

    while (number != 0) {
      // Set remainder from 1..26
      var remainder = number % 26;

      if (remainder == 0) {
        remainder = 26;
      }

      // Convert the remainder to a character.
      var letter = String.fromCharCode(65 + remainder - 1);

      // Accumulate the column letters, right to left.
      letters = letter + letters;

      // Get the next order of magnitude.
      number = (number - 1) ~/ 26;
    }
    return letters;
  }
}
