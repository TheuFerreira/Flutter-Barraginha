import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/tutorial/components/dot_widget.dart';
import 'package:flutter_barraginha/app/screens/tutorial/controllers/tutorial_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({Key? key}) : super(key: key);

  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  final _controller = TutorialController();
  final _pageController = PageController(initialPage: 0);
  bool showPrevious = true;
  bool showContinue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F1F1),
      body: Column(
        children: [
          Expanded(
            child: Observer(
              builder: (context) => PageView.builder(
                controller: _pageController,
                itemCount: _controller.pages.length,
                itemBuilder: (ctx, i) => _controller.pages[i],
                onPageChanged: _controller.updatePage,
              ),
            ),
          ),
          Container(
            color: Theme.of(context).colorScheme.primary,
            height: 40,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Observer(
              builder: (context) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedOpacity(
                      opacity: _controller.showPrevious ? 1 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: ElevatedButton(
                        onPressed: Navigator.of(context).pop,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(50, 35),
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                        ),
                        child: const Text('Sair'),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        for (var i = 0; i < _controller.pages.length; i++)
                          DotWidget(isSelected: i == _controller.selectedPage),
                      ],
                    ),
                    AnimatedOpacity(
                      opacity: _controller.showContinue ? 1 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: ElevatedButton(
                        onPressed: () => _controller.continueToExit(context),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(50, 35),
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                        ),
                        child: const Text('Continuar'),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
