class Type {

  final String TypeName;

  Type({
    required this.TypeName
  });

  factory Type.fromJson(String json) {

    return Type(TypeName: json);

  }
}
