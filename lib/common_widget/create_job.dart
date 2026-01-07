import 'package:artneidich_app/helpers/all_routes.dart';
import 'package:artneidich_app/helpers/navigation_service.dart';
import 'package:flutter/material.dart';

class CreateJob extends StatelessWidget {
  final String heroTag;
  const CreateJob({super.key, required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      heroTag: heroTag,
      backgroundColor: const Color(0xFF2D8D7C),
      onPressed: () {
        NavigationService.navigateTo(Routes.createJobScreen);
      },
      icon: const Icon(Icons.add, color: Colors.white),
      label: const Text(
        "Create new Job",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
