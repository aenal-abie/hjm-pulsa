enum ButtonSize {
  veryBig,
  big,
  medium(height: 32),
  small(height: 40),
  check(height: 41),
  verySmall(height: 30);

  final double height;

  const ButtonSize({this.height = 46});
}
