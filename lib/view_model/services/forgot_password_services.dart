class ForgotPasswordServices {
  bool animate = false;
  Future<bool> startAnimate() async {
    await Future.delayed(Duration(milliseconds: 500));
    return animate = true;
    await Future.delayed(Duration(milliseconds: 5000));
  }
}
