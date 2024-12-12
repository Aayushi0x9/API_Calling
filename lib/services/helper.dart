import 'dart:convert';

import 'package:api_calling/model/gemini_model.dart';
import 'package:api_calling/model/product_model.dart';
import 'package:http/http.dart' as http;

class Helper {
  Future<List<ProductModel>?> getAllProducts() async {
    String link = "https://fakestoreapi.com/products";
    http.Response response = await http.get(Uri.parse(link));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      List<ProductModel> productList =
          data.map((e) => ProductModel.maptomodel(e)).toList();
      return productList;
    }
    print('error===========');
    return null;
  }

  Future<List?> getTranslater(
      {required String text, required String targetLanguage}) async {
    Map m1 = {
      "texts": [text],
      "tl": targetLanguage,
      "sl": "auto",
    };

    final body = json.encode(m1);
    String link = "https://ai-translate.p.rapidapi.com/translate";
    http.Response res = await http.post(Uri.parse(link),
        headers: {
          "Content-Type": "application/json",
          "x-rapidapi-host": "ai-translate.p.rapidapi.com",
          "x-rapidapi-key": "dd1742fe7cmsh4ce3393b3c5e582p124dbcjsn44b223f06aae"
        },
        body: body);
    if (res.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(utf8.decode(res.bodyBytes));
      print('==============Data===========${data}');
      List<dynamic> translations = data['texts'] ?? [];
      print('===============Translation LIst =============${translations}');
      return translations;
    }
    return null;
  }

  Future<Geminimodel?> getLanguages() async {
    String link = "https://ai-translate.p.rapidapi.com/languages";

    http.Response res = await http.get(
      Uri.parse(link),
      headers: {
        "Content-Type": "application/json",
        "x-rapidapi-host": "ai-translate.p.rapidapi.com",
        "x-rapidapi-key": "dd1742fe7cmsh4ce3393b3c5e582p124dbcjsn44b223f06aae"
      },
    );
    if (res.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(utf8.decode(res.bodyBytes));
      print('==============DataLanguages===========${data}');
      Geminimodel data1 = Geminimodel.mapToModel(data);
      return data1;
    }
    return null;
  }

  getGemini({required String text}) async {
    String link =
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=AIzaSyBa5eHdhcWi93OlpqBfoG5eQZVjrxo9oy8";

    Map m1 = {
      "contents": [
        {
          "parts": [
            {"text": text}
          ]
        }
      ]
    };

    final body = json.encode(m1);
    http.Response res = await http.post(Uri.parse(link),
        headers: {
          "Content-Type": "application/json",
        },
        body: body);
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      return data;
    }
    return null;
  }
}
