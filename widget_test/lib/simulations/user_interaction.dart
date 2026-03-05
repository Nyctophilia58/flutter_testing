import 'package:flutter/material.dart';

class UserInteraction extends StatefulWidget {
  final String appTitle;
  const UserInteraction({super.key, required this.appTitle});

  @override
  State<UserInteraction> createState() => _UserInteractionState();
}

class _UserInteractionState extends State<UserInteraction> {
  final todos = <String>[];
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.appTitle)),
      body: Column(
        children: [
          TextField(controller: controller),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];

                return Dismissible(
                  key: Key('$todo$index'),
                  onDismissed: (direction) => todos.removeAt(index),
                  background: Container(color: Colors.red),
                  child: ListTile(title: Text(todo)),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            todos.add(controller.text);
            controller.clear();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
