import 'pie_chart_page_demo.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: PageView(
            children: [
              // PieChartPage(),
            ],
          ),
        ),
      );
}
