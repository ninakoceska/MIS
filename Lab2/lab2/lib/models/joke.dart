class Joke {
  int ID;
  String textA;
  String textB;
  String Type;

  Joke(
      {required this.ID,
      required this.textA,
      required this.textB,
      required this.Type});

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      ID: json['ID'],
      Type: json['Type'],
      textA: json['textA'],
      textB: json['textB'],
    );
  }
}
