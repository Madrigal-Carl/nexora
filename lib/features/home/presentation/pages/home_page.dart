import 'package:flutter/material.dart';

import '../../../../shared/widgets/header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              title: 'Overview',
              subtitle: 'Stay on top of your projects and deadlines',
            ),
          ],
        ),
      ),
    );
  }
}
