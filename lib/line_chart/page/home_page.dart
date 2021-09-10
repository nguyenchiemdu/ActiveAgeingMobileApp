import 'package:flutter/material.dart';

import 'line_chart_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: PageView(
            children: [
              LineChartPage(),
            ],
          ),
        ),
      );
}
