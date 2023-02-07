Future<void> main() async {
  loop().then(((value) => print(value)));
  print('affichage2');
  while (true);
}

Future<int> loop() async {
  return Future.delayed(const Duration(seconds: 3), () => 4);
}
