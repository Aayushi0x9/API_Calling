import 'package:api_calling/controller/translate_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TranslateScreen extends StatefulWidget {
  const TranslateScreen({super.key});

  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TranslateController>().loadLanguages();
  }

  @override
  Widget build(BuildContext context) {
    TranslateController translateW =
        Provider.of<TranslateController>(context, listen: false);
    TranslateController translateR =
        Provider.of<TranslateController>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Translate'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: translateW.textController,
              decoration: const InputDecoration(
                labelText: "Enter text to translate",
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton<String>(
                  hint: Text("Select a language"),
                  value: translateW.selectedLanguage,
                  items: translateW.languages?.entries
                      .map(
                        (e) => DropdownMenuItem(
                          child: Text(e.value),
                          value: e.key,
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    translateW.selectedLanguage = value!;
                    setState(() {});
                  },
                ),
                IconButton(
                    onPressed: () {
                      String inputText = translateW.textController.text.trim();
                      if (inputText.isNotEmpty) {
                        translateR.loadTranslateText(
                            text: inputText,
                            selectedLanguage:
                                translateW.selectedLanguage ?? 'hi');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please enter any text."),
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.swap_horiz_outlined)),
              ],
            ),
            TextField(
              controller: translateW.textTranslateController,
              decoration: const InputDecoration(
                labelText: "Translate",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
