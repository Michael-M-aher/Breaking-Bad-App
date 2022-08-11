class Character {
  late int charId;
  late String name;
  late String birthday;
  late List<String> job;
  late String img;
  late String status;
  late String nickname;
  late List<int> appearance;
  late String actorName;
  late String category;
  late List<int> betterCallSaulAppearance;

  Character(
      {required this.charId,
      required this.name,
      required this.birthday,
      required this.job,
      required this.img,
      required this.status,
      required this.nickname,
      required this.appearance,
      required this.actorName,
      required this.category,
      required this.betterCallSaulAppearance});

  Character.fromJson(Map<String, dynamic> json) {
    charId = json['char_id'];
    name = json['name'];
    birthday = json['birthday'];
    job = json['occupation'].cast<String>();
    img = json['img'];
    status = json['status'];
    nickname = json['nickname'];
    appearance = json['appearance'].cast<int>();
    actorName = json['portrayed'];
    category = json['category'];
    betterCallSaulAppearance = json['better_call_saul_appearance'].cast<int>();
  }
}
