class LanguageModel {
  final String name;
  final String code;
  final String nativeName;

  LanguageModel(this.name, this.code, this.nativeName);

  // from json
  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    return LanguageModel(json['name'], json['code'], json['native_name']);
  }

  // to json
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'native_name': nativeName
    };
  }
}
