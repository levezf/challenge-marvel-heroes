import 'package:challenge_marvel_heroes/dependency_injection.dart';
import 'package:challenge_marvel_heroes/styles/colors.dart';
import 'package:challenge_marvel_heroes/styles/gradients.dart';
import 'package:challenge_marvel_heroes/ui/home/bloc/home_bloc.dart';
import 'package:challenge_marvel_heroes/ui/home/widgets/category_circle.dart';
import 'package:challenge_marvel_heroes/ui/home/widgets/section_character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => sl<HomeBloc>(),
      child: Builder(
        builder: (c) => _build(c),
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 26,
          child: SvgPicture.asset(
            'assets/icons/marvel.svg',
            color: kColorRed,
          ),
        ),
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/menu.svg',
          ),
          onPressed: null,
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/icons/search.svg'),
            onPressed: null,
          ),
        ],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    BlocProvider.of<HomeBloc>(context).add(GetAllCharactersEvent());

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    'Bem vindo ao Marvel Heroes',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    'Escolha o seu\npersonagem',
                    style: Theme.of(context).textTheme.headline2,
                    softWrap: true,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            _buildRowCategories(),
            const SizedBox(
              height: 48,
            ),
            _buildListsCharacteres(),
          ],
        ),
      ),
    );
  }

  Widget _buildRowCategories() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          CategoryCircle(
            asset: 'assets/icons/hero.svg',
            gradient: kGradientBlue,
          ),
          CategoryCircle(
            asset: 'assets/icons/villain.svg',
            gradient: kGradientRed,
          ),
          CategoryCircle(
            asset: 'assets/icons/antihero.svg',
            gradient: kGradientPurple,
          ),
          CategoryCircle(
            asset: 'assets/icons/alien.svg',
            gradient: kGradientGreen,
          ),
          CategoryCircle(
            asset: 'assets/icons/human.svg',
            gradient: kGradientPink,
          ),
        ],
      ),
    );
  }

  Widget _buildListsCharacteres() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoaded) {
          return Column(
            children: [
              SectionCharecter(title: 'Heróis', characters: state.heroes),
              SectionCharecter(title: 'Vilões', characters: state.villains),
              SectionCharecter(
                  title: 'Anti-heróis', characters: state.antiHeroes),
              SectionCharecter(title: 'Alienígenas', characters: state.aliens),
              SectionCharecter(title: 'Humanos', characters: state.humans),
            ],
          );
        }

        return Container();
      },
    );
  }
}
