import 'package:flutter/material.dart';

import '../../../../shared/widgets/header.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            Header(
              title: 'Projects',
              subtitle: 'Organize and track all your projects',
            ),
          ],
        ),
      ),
    );
  }
}
