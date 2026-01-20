import 'package:flutter/material.dart';
import 'package:get/get.dart';

CounterController controller = CounterController();

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.grey,
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: GetBuilder(
                init: controller,
                builder: (context) {
                  return Text(
                    '${controller.count}',
                    style: TextStyle(fontSize: 39, fontWeight: FontWeight.bold),
                  );
                },
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProfileScreen();
                    },
                  ),
                );
              },
              child: Text('Go to profile screen'),
            ),
          ],
        ),

        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () {
                controller.increment();
              },
              child: Icon(Icons.add),
            ),
            SizedBox(width: 10),
            FloatingActionButton(
              onPressed: () {
                controller.decrement();
              },
              child: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('profile')),
      body: Center(child: GetBuilder(
        init: controller,
        builder: (context) {
          return Text("${controller.count}");
        }
      )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              controller.increment();
            },
            child: Icon(Icons.add),
          ),
          const SizedBox(width: 12),
          FloatingActionButton(
            onPressed: () {
              controller.decrement();
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class CounterController extends GetxController {
  int count = 0;
  void increment() {
    count++;
    update();
  }

  void decrement() {
    count--;
    update();
  }
}
