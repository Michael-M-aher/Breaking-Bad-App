import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import '../../bussiness_logic/cubit/characters_cubit.dart';
import '../../constants/my_colors.dart';
import '../../data/models/character.dart';
import '../widgets/character_info.dart';
import '../widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersDetails extends StatelessWidget {
  final Character character;

  const CharactersDetails({super.key, required this.character});

  Widget checkIfQuotesLoaded(CharactersState state) {
    if (state is QuotesLoaded) {
      return displayRandomQuoteOrEmpty(state);
    } else {
      return const LoadingIndicator();
    }
  }

  Widget displayRandomQuoteOrEmpty(state) {
    var quotes = (state).quotes;
    if (quotes.length != 0) {
      int randomQuoteIndex = Random().nextInt(quotes.length - 1);
      return Center(
        child: DefaultTextStyle(
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            color: MyColors.myWhite,
            fontFamily: 'Agne',
          ),
          child: AnimatedTextKit(
            repeatForever: true,
            pause: const Duration(seconds: 5),
            animatedTexts: [
              TypewriterAnimatedText(quotes[randomQuoteIndex].quote),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.name,
          style: const TextStyle(color: MyColors.myWhite),
        ),
        background: Hero(
          tag: character.charId,
          child: Image.network(
            character.img,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharactersCubit>(context).getQuotes(character.name);
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: <Widget>[
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CharacterInfo(
                        title: 'Job : ',
                        value: character.job.join(' / '),
                        endIndent: 330,
                      ),
                      CharacterInfo(
                        title: 'Appeared in : ',
                        value: character.category,
                        endIndent: 265,
                      ),
                      CharacterInfo(
                        title: 'Seasons : ',
                        value: character.appearance.join(' / '),
                        endIndent: 295,
                      ),
                      CharacterInfo(
                        title: 'Status : ',
                        value: character.status,
                        endIndent: 315,
                      ),
                      character.betterCallSaulAppearance.isEmpty
                          ? Container()
                          : CharacterInfo(
                              title: 'Better Call Saul Seasons : ',
                              value: character.betterCallSaulAppearance
                                  .join(' / '),
                              endIndent: 165,
                            ),
                      CharacterInfo(
                        title: 'Actor/Actress : ',
                        value: character.actorName,
                        endIndent: 250,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<CharactersCubit, CharactersState>(
                        builder: (context, state) {
                          return checkIfQuotesLoaded(state);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 500,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
