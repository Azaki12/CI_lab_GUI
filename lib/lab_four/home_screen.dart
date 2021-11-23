import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:gui_ci_embedded/lab_four/widgets/sine_card.dart';
import 'package:gui_ci_embedded/lab_four/widgets/square_card.dart';
import 'package:gui_ci_embedded/lab_four/widgets/stair_case_card.dart';
import 'package:gui_ci_embedded/lab_four/widgets/triangle_card.dart';
import 'package:gui_ci_embedded/lab_three/slider_button/shimmer.dart';
import 'package:gui_ci_embedded/lab_two/provider/cubit.dart';
import 'package:gui_ci_embedded/lab_two/provider/states.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<Widget> cards = [];
  double amplitudeValue = 0.5;
  double frequencyValue = 0.5;
  final List<String> cardsTitles = [
    'Sine Wave',
    'Triangle Wave',
    'Square Wave',
    'Stair-Case wave'
  ];

  List<AnimationController> controllers = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 4; i++) {
      controllers.add(AnimationController(vsync: this));
    }

    cards.add(SineCard(
      controller: controllers[0],
    ));
    cards.add(TriangleCard(
      controller: controllers[1],
    ));
    cards.add(SquareCard(
      controller: controllers[2],
    ));
    cards.add(StairCaseCard(
      controller: controllers[3],
    ));
  }

  int cIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.red[300],
          body: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 600),
                        switchInCurve: Curves.easeOutBack,
                        switchOutCurve: Curves.easeInBack,
                        transitionBuilder: (child, animation) =>
                            ScaleTransition(scale: animation, child: child),
                        child: Shimmer.fromColors(
                          key: ValueKey(cIndex),
                          period: const Duration(seconds: 2),
                          highlightColor: const Color(0xFFF1F1F1),
                          baseColor: (cIndex == 0 || cIndex == 2)
                              ? Theme.of(context).colorScheme.background
                              : Theme.of(context).colorScheme.primary,
                          child: Text(
                            cardsTitles[cIndex],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .fontSize +
                                  45,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 600),
                      switchInCurve: Curves.easeOutBack,
                      switchOutCurve: Curves.easeInBack,
                      transitionBuilder: (child, animation) =>
                          ScaleTransition(scale: animation, child: child),
                      child: Shimmer.fromColors(
                        key: ValueKey(cIndex),
                        period: const Duration(seconds: 2),
                        highlightColor: const Color(0xFFF1F1F1),
                        baseColor: (cIndex == 0 || cIndex == 2)
                            ? Theme.of(context).colorScheme.background
                            : Theme.of(context).colorScheme.primary,
                        child: const Text(
                          'Amplitude',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 80,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Slider(
                            value: amplitudeValue,
                            onChanged: (value) {
                              amplitudeValue = value;
                              setState(() {});
                              print(value);
                            },
                          ),
                        ),
                        Text(
                          '${(amplitudeValue * 100).round()}%',
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 600),
                      switchInCurve: Curves.easeOutBack,
                      switchOutCurve: Curves.easeInBack,
                      transitionBuilder: (child, animation) =>
                          ScaleTransition(scale: animation, child: child),
                      child: Shimmer.fromColors(
                        key: ValueKey(cIndex),
                        period: const Duration(seconds: 2),
                        highlightColor: const Color(0xFFF1F1F1),
                        baseColor: (cIndex == 0 || cIndex == 2)
                            ? Theme.of(context).colorScheme.background
                            : Theme.of(context).colorScheme.primary,
                        child: const Text(
                          'Frequency',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 80,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Slider(
                            value: frequencyValue,
                            onChanged: (value) {
                              frequencyValue = value;
                              setState(() {});
                              print(value);
                            },
                          ),
                        ),
                        Text(
                          '${(frequencyValue * 100).round()}%',
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Swiper(
                  physics: const BouncingScrollPhysics(),
                  itemCount: cards.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      switch (cIndex) {
                        case 0:
                          setState(() {});
                          cubit.setAnimation(0, true);

                          break;
                        case 1:
                          setState(() {});
                          cubit.setAnimation(1, true);

                          break;
                        case 2:
                          setState(() {});

                          cubit.setAnimation(2, true);
                          break;
                        case 3:
                          setState(() {});
                          cubit.setAnimation(3, true);
                          break;
                        default:
                      }
                    },
                    child: cards[index],
                  ),
                  scrollDirection: Axis.vertical,
                  viewportFraction: 0.7,
                  layout: SwiperLayout.DEFAULT,
                  loop: true,
                  scale: 0.5,
                  onIndexChanged: (value) {
                    setState(() {
                      cIndex = value;
                    });
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
