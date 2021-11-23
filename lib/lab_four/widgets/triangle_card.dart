import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui_ci_embedded/lab_two/provider/cubit.dart';
import 'package:gui_ci_embedded/lab_two/provider/states.dart';
import 'package:lottie/lottie.dart';

class TriangleCard extends StatefulWidget {
  AnimationController controller;

  TriangleCard({Key key, this.controller}) : super(key: key);

  @override
  State<TriangleCard> createState() => _TriangleCardState();
}

class _TriangleCardState extends State<TriangleCard>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        cubit.animationInit();
        return Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(80),
          ),
          child: cubit.getAnimation(1)
              ? Center(
                  child: Lottie.asset(
                    'assets/lotties/triangleWave.json',
                  ),
                )
              : Center(
                  child: Lottie.asset(
                    'assets/lotties/triangleWave.json',
                    controller: widget.controller,
                  ),
                ),
        );
      },
    );
  }
}
