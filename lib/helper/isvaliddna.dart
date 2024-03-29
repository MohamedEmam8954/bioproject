bool validateDNA(String sequence) {
  for (int i = 0; i < sequence.length; i++) {
    if (!(sequence[i] == 'A' ||
        sequence[i] == 'G' ||
        sequence[i] == 'C' ||
        sequence[i] == 'T')) {
      return false;
    }
  }
  return true;
}
