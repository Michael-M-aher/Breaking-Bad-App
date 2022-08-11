import '../models/character.dart';
import '../models/quote.dart';
import '../web_services/characters_web_service.dart';

class CharactersRepository {
  final CharacterWebService characterWebService;

  CharactersRepository(this.characterWebService);

  Future<List<Character>> getAllCharacters() async {
    final characters = await characterWebService.getAllCharacters();
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }

  Future<List<Quote>> getQuotes(String charName) async {
    final quotes = await characterWebService.getQuotes(charName);
    return quotes.map((quote) => Quote.fromJson(quote)).toList();
  }
}
