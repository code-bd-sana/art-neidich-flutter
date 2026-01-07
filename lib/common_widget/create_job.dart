import 'package:flutter/material.dart';

class CreateJob extends StatelessWidget {
  const CreateJob({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      heroTag: "overview_fab",
        backgroundColor: const Color(0xFF2D8D7C),
        onPressed: () {},
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          "Create new Job",
          style: TextStyle(color: Colors.white),
        ),
      );
  }
}