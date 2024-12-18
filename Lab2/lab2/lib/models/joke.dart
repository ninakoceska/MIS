class Joke {

  int Id;
  String Type;
  String TextA;
  String TextB;


  Joke({
      required this.Id,
      required this.Type,
      required this.TextA,
      required this.TextB
  });

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      Id: json['id'],
      Type: json['type'],
      TextA: json['setup'],
      TextB: json['punchline'],
    );
  }
}
