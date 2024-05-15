import 'package:moc_2024_3/ascynhronism/app_exceptions.dart';

void main() async {
  print('1');

  try {
    final value = await _getStringFromNetwork();
    print(value);
    final length = await _getWordLength(value);
    print(length);
  } on ValueNotFoundException catch (error) {
    print('Erreur lors de la recuperation de la value: $error');
  } on WordLengthNotFoundException catch (error) {
    print('Erreur lors de la recuperation de la longueur: $error');
  } catch (error) {
    print('Erreur non gérée: $error');
  }

  // _getStringFromNetwork().then((value) {
  //   print(value);
  //   _getWordLength(value).then((length) {
  //     print(length);
  //   }).catchError((error) {
  //     print('Error getting int value; $error');
  //   });
  // }).catchError((error) {
  //   print('Error getting string value; $error');
  // });
  print('3');
}

Future<String> _getStringFromNetwork() async {
  await Future.delayed(const Duration(seconds: 1));
  return 'coucou';
}

Future<int> _getWordLength(String word) async {
  await Future.delayed(const Duration(seconds: 1));
  return word.length;
}
