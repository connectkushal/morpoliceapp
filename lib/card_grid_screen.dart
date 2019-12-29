import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'widgets/drawer_widget.dart';
import 'widgets/empty_card.dart';

class CardGridScreen extends StatefulWidget {
  CardGridScreen({Key key}) : super(key: key);

  @override
  _CardGridScreenState createState() => _CardGridScreenState();
}

class _CardGridScreenState extends State<CardGridScreen> {
  @override
  Widget build(BuildContext context) {
    var columnCount = 3;

    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text("Mor Portal"),
      ),
      body: SafeArea(
        child: AnimationLimiter(
          child: GridView.count(
            childAspectRatio: 1.0,
            padding: const EdgeInsets.all(8.0),
            crossAxisCount: columnCount,
            children: List.generate(
              30,
              (int index) {
                return AnimationConfiguration.staggeredGrid(
                  columnCount: columnCount,
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: const ScaleAnimation(
                    scale: 0.5,
                    child: FadeInAnimation(
                      child: EmptyCard(),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
