extension StringExtension on String? {
  String? snakeCasetoSentenceCase() {
    if (this == null) {
      return '';
    }

    final words = this!.split('_');
    return words.map((e) => e.capitalize()).toList().join();
  }

  String capitalize() {
    return "${this![0].toUpperCase()}${this!.substring(1).toLowerCase()}";
  }
}
