import 'package:bloc/bloc.dart';
import '../../data/models/character.dart';
import '../../data/models/quote.dart';
import '../../data/repository/characters_repository.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository characterRepository;
  CharactersCubit(this.characterRepository) : super(CharactersInitial());
  void getAllCharacters() {
    characterRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
    });
  }

  void getQuotes(String charName) {
    characterRepository.getQuotes(charName).then((quotes) {
      emit(QuotesLoaded(quotes));
    });
  }
}
