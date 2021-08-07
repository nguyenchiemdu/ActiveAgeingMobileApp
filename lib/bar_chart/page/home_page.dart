import 'package:flutter/material.dart';

import '../../main.dart';
import 'bar_chart_page_demo.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: PageView(
            children: [
              // BarChartPage(),
            ],
          ),
        ),
      );
}
