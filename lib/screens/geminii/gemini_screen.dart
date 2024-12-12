import 'package:api_calling/controller/gemini_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GeminiScreen extends StatefulWidget {
  const GeminiScreen({super.key});

  @override
  State<GeminiScreen> createState() => _GeminiScreenState();
}

class _GeminiScreenState extends State<GeminiScreen> {
  @override
  Widget build(BuildContext context) {
    GeminiController geminiR =
        Provider.of<GeminiController>(context, listen: true);
    GeminiController geminiW =
        Provider.of<GeminiController>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gemini App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: geminiW.messages.length,
              itemBuilder: (context, index) {
                final message = geminiW.messages[index];
                final isUser = message?['role'] == "user";
                return Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    alignment:
                        isUser ? Alignment.centerRight : Alignment.centerLeft,
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.blue[100] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(message?['text'] ?? ""),
                  ),
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: geminiW.textController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    String text = geminiW.textController.text;
                    geminiR.sendMessages(textController: text);
                  },
                  icon: Icon(Icons.send)),
            ],
          )
        ],
      ),
    );
  }
}
