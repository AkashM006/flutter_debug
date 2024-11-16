import 'package:flutter/material.dart';
import 'package:flutter_debug/widgets/bordered_box.widget.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    void onClick() {}

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: BorderedBoxWidget(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const BorderedBoxWidget(
                child: Text("Hello"),
              ),
              Expanded(
                child: BorderedBoxWidget(
                  child: SingleChildScrollView(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: List.generate(
                          50,
                          (index) => BorderedBoxWidget(
                            child: Container(
                              height: 30,
                              width: double.infinity,
                              color: Colors.lightGreen,
                              child: Text("Hey there: $index"),
                            ),
                          ),
                        ),
                      )),
                ),
              ),
              BorderedBoxWidget(
                child: FilledButton(
                  onPressed: onClick,
                  child: const Text("Click me"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
