import 'package:flutter/material.dart';

Widget buildLoading() => Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              // color: Color(0xffffbf2f)
              ),
          child: Center(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
