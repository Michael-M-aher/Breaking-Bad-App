// ignore_for_file: public_member_api_docs, sort_constructors_first
class Quote {
  late String quote;
  Quote({
    required this.quote,
  });
  Quote.fromJson(Map<String, dynamic> json) {
    quote = json['quote'];
  }
}
