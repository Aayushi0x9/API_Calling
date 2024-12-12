class Geminimodel {
  List<Candidate>? candidates;
  UsageMetadata? usageMetadata;
  String? modelVersion;

  Geminimodel({
    this.candidates,
    this.usageMetadata,
    this.modelVersion,
  });

  factory Geminimodel.mapToModel(Map<String, dynamic> m1) => Geminimodel(
        candidates: List<Candidate>.from(
            m1["candidates"].map((e) => Candidate.mapToModel(e))),
        usageMetadata: UsageMetadata.mapToModel(m1["usageMetadata"]),
        modelVersion: m1["modelVersion"],
      );
}

class Candidate {
  Content? content;
  String? finishReason;
  double? avgLogprobs;

  Candidate({
    this.content,
    this.finishReason,
    this.avgLogprobs,
  });

  factory Candidate.mapToModel(Map<String, dynamic> m1) => Candidate(
        content: Content.mapToModel(m1["content"]),
        finishReason: m1["finishReason"],
        avgLogprobs: m1["avgLogprobs"].toDouble(),
      );
}

class Content {
  List<Part>? parts;
  String? role;

  Content({
    this.parts,
    this.role,
  });

  factory Content.mapToModel(Map<String, dynamic> m1) => Content(
        parts: List<Part>.from(m1["parts"].map((e) => Part.mapToModel(e))),
        role: m1["role"],
      );
}

class Part {
  String? text;

  Part({
    this.text,
  });

  factory Part.mapToModel(Map<String, dynamic> m1) => Part(
        text: m1["text"],
      );
}

class UsageMetadata {
  int? promptTokenCount, candidatesTokenCount, totalTokenCount;

  UsageMetadata({
    this.promptTokenCount,
    this.candidatesTokenCount,
    this.totalTokenCount,
  });

  factory UsageMetadata.mapToModel(Map<String, dynamic> m1) => UsageMetadata(
        promptTokenCount: m1["promptTokenCount"],
        candidatesTokenCount: m1["candidatesTokenCount"],
        totalTokenCount: m1["totalTokenCount"],
      );
}
