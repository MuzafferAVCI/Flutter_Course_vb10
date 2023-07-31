import 'package:flutter/material.dart';

const double kZero = 0;

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({super.key});

  @override
  State<AnimatedLearnView> createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);
  }

  late AnimationController controller;
  bool _isVisible = true;
  bool _isOpacity = false;

  void _changeVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _changeOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _placeHolderWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _changeVisibility();
          controller.animateTo(_isVisible ? 1 : 0, duration: _DurationItems._durationLow);
        },
      ),
      body: Column(
        children: [
          ListTile(
            title: AnimatedOpacity(
                duration: _DurationItems._durationLow, opacity: _isOpacity ? 1 : 0, child: const Text('data')),
            trailing: IconButton(
                onPressed: () {
                  _changeOpacity();
                },
                icon: const Icon(Icons.precision_manufacturing_outlined)),
          ),
          AnimatedDefaultTextStyle(
              style: (_isVisible ? context.textTheme().headlineLarge : context.textTheme().titleMedium) ??
                  const TextStyle(),
              duration: _DurationItems._durationLow,
              child: const Text('data')),
          AnimatedIcon(icon: AnimatedIcons.view_list, progress: controller),
          AnimatedContainer(
            duration: _DurationItems._durationLow,
            width: MediaQuery.sizeOf(context).width * 0.2,
            height: _isVisible ? kZero : MediaQuery.sizeOf(context).height * 0.2,
            //
            color: Colors.blue,
            margin: const EdgeInsets.all(10),
          ),
          const Expanded(
              child: Stack(
            children: [
              AnimatedPositioned(
                  top: 10, curve: Curves.elasticOut, child: Text('data'), duration: _DurationItems._durationLow)
            ],
          )),
          Expanded(
            child: AnimatedList(
              itemBuilder: (context, index, animation) {
                return const Text('data');
              },
            ),
          )
        ],
      ),
    );
  }

  AnimatedCrossFade _placeHolderWidget() {
    return AnimatedCrossFade(
      //İki tane "View" arasında değişiklik yapmayı saglar.
      firstChild: const Placeholder(),
      secondChild: const SizedBox(),
      duration: _DurationItems._durationLow,
      crossFadeState: _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}

extension BuildContextExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}

class _DurationItems {
  static const _durationLow = Duration(seconds: 1);
}
