import 'package:api_calling/services/helper.dart';
import 'package:flutter/cupertino.dart';

class TranslateController with ChangeNotifier {
  List<dynamic>? translateText = [];
  Map<String, dynamic>? languages = {};
  String? selectedLanguage;
  TextEditingController textController = TextEditingController();
  TextEditingController textTranslateController = TextEditingController();

  Future<void> loadTranslateText(
      {required String text, required String selectedLanguage}) async {
    Helper helper = Helper();

    translateText = await helper.getTranslater(
        text: text, targetLanguage: selectedLanguage);
    if (translateText != null) {
      textTranslateController.text = translateText![0] ?? 'NO Convert';
    }
    notifyListeners();
  }

  Future<void> loadLanguages() async {
    Helper helper = Helper();
    languages = (await helper.getLanguages()) as Map<String, dynamic>?;
    notifyListeners();
  }
}
