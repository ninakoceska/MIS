class Joke_Type {


  final String Type;

  Joke_Type({required this.Type});

  factory Joke_Type.fromJson(String json) {

        return Joke_Type(Type: json);
  }
}
