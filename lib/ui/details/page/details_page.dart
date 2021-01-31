import 'package:challenge_marvel_heroes/domain/entities/character.dart';
import 'package:challenge_marvel_heroes/styles/colors.dart';
import 'package:challenge_marvel_heroes/styles/gradients.dart';
import 'package:challenge_marvel_heroes/ui/details/widgets/ability_widget.dart';
import 'package:challenge_marvel_heroes/ui/details/widgets/caracteristic_widget.dart';
import 'package:challenge_marvel_heroes/ui/details/widgets/poster_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailsPage extends StatefulWidget {
  final Character character;

  const DetailsPage({Key key, @required this.character}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  final kMinOpacity = 0.0;
  final kMaxOpacity = 0.6;


  ScrollController _scrollController;
  double appBarOpacity = 0.0;

  AnimationController _tweenController;
  Animation<double> widthImageAnimation;
  Animation<double> heightImageAnimation;
  Animation<double> marginDetails;
  Animation<double> opacityDetailsAnimation;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    _prepareFloatingAppBarByScroll();

    super.initState();

    _prepareAnimations();
  }

  @override
  void dispose() {
    _scrollController?.removeListener(() {});
    _tweenController?.dispose();
    _tweenController?.removeListener(() {});
    _scrollController.dispose();
    super.dispose();
  }

  double _calculateAppBarOpacity() {
    final offset = _scrollController.offset;
    if (offset <= 0) {
      return kMinOpacity;
    }

    if (offset >= kToolbarHeight) {
      return kMaxOpacity;
    }

    return offset * (kMaxOpacity / kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        backgroundColor: Colors.black.withOpacity(appBarOpacity),
        iconTheme: Theme.of(context).iconTheme,
        backwardsCompatibility: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: _buildScroll(context),
    );
  }

  Widget _buildScroll(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      controller: _scrollController,
      padding: EdgeInsets.zero,
      children: [
        _buildBody(context),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: widget.character.imagePath,
          child: Container(
            width: widthImageAnimation.value,
            height: heightImageAnimation.value,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  widget.character.imagePath,
                ),
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(
                gradient: kGradientBlack,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              top: 380,
              bottom: 48),
          child: Column(
            children: [
              _buildAlterEgo(context),
              _buildName(context),
              SizedBox(
                height: marginDetails.value,
              ),
              _opacityAnimation(_buildCaracteristics()),
              const SizedBox(
                height: 24,
              ),
              _opacityAnimation(_buildBiography(context)),
              const SizedBox(
                height: 32,
              ),
              _opacityAnimation(_buildAbilities(context)),
              const SizedBox(
                height: 32,
              ),
              _opacityAnimation(_buildMovies(context)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAlterEgo(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.character.alterEgo,
          style: Theme.of(context).textTheme.subtitle1.copyWith(
                color: kColorWhite.withOpacity(0.75),
              ),
        ),
      ],
    );
  }

  Widget _buildName(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Text(
            widget.character.name,
            style: Theme.of(context)
                .textTheme
                .headline1
                .copyWith(color: kColorWhite),
            softWrap: true,
          ),
        ),
      ],
    );
  }

  Widget _buildCaracteristics() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CaracteristicWidget(
          svgImage: 'assets/icons/age.svg',
          text: widget.character.caracteristics.formattedAge,
        ),
        CaracteristicWidget(
          svgImage: 'assets/icons/weight.svg',
          text: widget.character.caracteristics.formattedWeight,
        ),
        CaracteristicWidget(
          svgImage: 'assets/icons/height.svg',
          text: widget.character.caracteristics.formattedHeight,
        ),
        CaracteristicWidget(
          svgImage: 'assets/icons/universe.svg',
          text: widget.character.caracteristics.universe,
        ),
      ],
    );
  }

  Widget _buildBiography(BuildContext context) {
    return Text(
      widget.character.biography,
      style: Theme.of(context).textTheme.bodyText1.copyWith(
            color: kColorWhite.withOpacity(0.75),
          ),
    );
  }

  Widget _buildAbilities(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Habilidades',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        AbilityWidget(
          percent: widget.character.abilities.force,
          title: 'Força',
        ),
        const SizedBox(
          height: 24,
        ),
        AbilityWidget(
          percent: widget.character.abilities.intelligence,
          title: 'Inteligência',
        ),
        const SizedBox(
          height: 24,
        ),
        AbilityWidget(
          percent: widget.character.abilities.agility,
          title: 'Agilidade',
        ),
        const SizedBox(
          height: 24,
        ),
        AbilityWidget(
          percent: widget.character.abilities.endurance,
          title: 'Resistência',
        ),
        const SizedBox(
          height: 24,
        ),
        AbilityWidget(
          percent: widget.character.abilities.velocity,
          title: 'Velocidade',
        ),
      ],
    );
  }

  Widget _buildMovies(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Filmes',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 230,
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => PosterTile(
                  assetImage: widget.character.movies.elementAt(index)),
              separatorBuilder: (context, index) => Container(width: 16.0),
              itemCount: widget.character.movies.length),
        ),
      ],
    );
  }

  void _prepareFloatingAppBarByScroll() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      final newAppBarOpacity = _calculateAppBarOpacity();

      if (newAppBarOpacity != appBarOpacity) {
        setState(() {
          appBarOpacity = newAppBarOpacity;
        });
      }
    });
  }

  void _prepareAnimations() {
    _tweenController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    widthImageAnimation =
        Tween<double>(begin: 1563, end: 1447).animate(_tweenController);

    heightImageAnimation =
        Tween<double>(begin: 876, end: 812).animate(_tweenController);

    marginDetails = Tween<double>(begin: 70, end: 48).animate(_tweenController);

    opacityDetailsAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            parent: _tweenController,
            curve: const Interval(0.5, 1, curve: Curves.easeIn)));

    _tweenController.addListener(() {
      setState(() {});
    });
    _tweenController.forward();
  }

  Widget _opacityAnimation(Widget child) {
    return Opacity(
      opacity: opacityDetailsAnimation.value,
      child: child,
    );
  }
}
