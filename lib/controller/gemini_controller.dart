import 'package:api_calling/model/gemini_model.dart';
import 'package:api_calling/services/helper.dart';
import 'package:flutter/cupertino.dart';

class GeminiController with ChangeNotifier {
  List<Map<String, String>?> messages = [];

  TextEditingController textController = TextEditingController();

  Future<void> sendMessages({required String textController}) async {
    Helper helper = Helper();
    Map<String, dynamic>? response =
        await helper.getGemini(text: textController);
    Geminimodel gemini1 = Geminimodel.mapToModel(response!);
    String? gemini = gemini1.candidates?.first.content?.parts
            ?.map((e) => e.text)
            .join(" ") ??
        "No Result";
    messages.add({'role': 'user', 'text': textController});

    messages.add({'role': 'gemini', 'text': gemini});
    notifyListeners();
  }
}
