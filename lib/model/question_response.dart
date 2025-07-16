// To parse this JSON data, do
//
//     final questionResponse = questionResponseFromJson(jsonString);

import 'dart:convert';

QuestionResponse questionResponseFromJson(String str) => QuestionResponse.fromJson(json.decode(str));

String questionResponseToJson(QuestionResponse data) => json.encode(data.toJson());

class QuestionResponse {
  List<Record>? record;
  Metadata? metadata;

  QuestionResponse({
    this.record,
    this.metadata,
  });

  factory QuestionResponse.fromJson(Map<String, dynamic> json) => QuestionResponse(
    record: json["record"] == null ? [] : List<Record>.from(json["record"]!.map((x) => Record.fromJson(x))),
    metadata: json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
  );

  Map<String, dynamic> toJson() => {
    "record": record == null ? [] : List<dynamic>.from(record!.map((x) => x.toJson())),
    "metadata": metadata?.toJson(),
  };
}

class Metadata {
  String? id;
  bool? private;
  DateTime? createdAt;
  String? name;

  Metadata({
    this.id,
    this.private,
    this.createdAt,
    this.name,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
    id: json["id"],
    private: json["private"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "private": private,
    "createdAt": createdAt?.toIso8601String(),
    "name": name,
  };
}

class Record {
  String? id;
  ReferTo? skip;
  String? type;
  List<Option>? options;
  Question? question;
  ReferTo? referTo;
  Validations? validations;

  Record({
    this.id,
    this.skip,
    this.type,
    this.options,
    this.question,
    this.referTo,
    this.validations,
  });

  factory Record.fromJson(Map<String, dynamic> json) => Record(
    id: json["id"],
    skip: json["skip"] == null ? null : ReferTo.fromJson(json["skip"]),
    type: json["type"],
    options: json["options"] == null ? [] : List<Option>.from(json["options"]!.map((x) => Option.fromJson(x))),
    question: json["question"] == null ? null : Question.fromJson(json["question"]),
    referTo: json["referTo"] == null ? null : ReferTo.fromJson(json["referTo"]),
    validations: json["validations"] == null ? null : Validations.fromJson(json["validations"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "skip": skip?.toJson(),
    "type": type,
    "options": options == null ? [] : List<dynamic>.from(options!.map((x) => x.toJson())),
    "question": question?.toJson(),
    "referTo": referTo?.toJson(),
    "validations": validations?.toJson(),
  };
}

class Option {
  String? value;
  ReferTo? referTo;

  Option({
    this.value,
    this.referTo,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
    value: json["value"],
    referTo: json["referTo"] == null ? null : ReferTo.fromJson(json["referTo"]),
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "referTo": referTo?.toJson(),
  };
}

class ReferTo {
  String? id;

  ReferTo({
    this.id,
  });

  factory ReferTo.fromJson(Map<String, dynamic> json) => ReferTo(
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}

class Question {
  String? slug;

  Question({
    this.slug,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "slug": slug,
  };
}

class Validations {
  String? regex;

  Validations({
    this.regex,
  });

  factory Validations.fromJson(Map<String, dynamic> json) => Validations(
    regex: json["regex"],
  );

  Map<String, dynamic> toJson() => {
    "regex": regex,
  };
}
