import 'package:flutter/material.dart';
import 'package:img_app/view/screens/home_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const Page(),
      'home': (context) => const Home(),
    },
    theme: ThemeData(useMaterial3: true),
  ));
}

class Page extends StatefulWidget {
  const Page({Key? key}) : super(key: key);

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> with TickerProviderStateMixin {

  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 7),
    );

    animationController.repeat();
  }

  double a = 0;
  double b = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image"),
        elevation: 2,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Slider(
              onChangeStart: (value) => a,
              onChangeEnd: (value) => b,
              value: a,
              onChanged: (val) {
                setState(() {
                });
              },
            ),
          ),
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 5,
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 5,
                child: AnimatedBuilder(
                      animation: animationController,
                      builder: (BuildContext context, widget) {
                        return Transform.rotate(
                          angle: 0,
                          child: widget,
                        );
                      },
                      child: const Image(
                        image: AssetImage('assets/img/flutter.jpg'),
                      ),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
