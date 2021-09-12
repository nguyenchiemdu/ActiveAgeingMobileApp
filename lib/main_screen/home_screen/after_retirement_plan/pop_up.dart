import 'package:flutter/material.dart';

showPopUp(BuildContext context, String title, String content) {
  return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(content),
                  Container(
                    child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Color(0xffD3F1E7)),
                        onPressed: () {
                          Navigator.pop(context, 'OK');
                        },
                        child: Text(
                          'Đã hiểu',
                          style: TextStyle(color: Color(0xff00865D)),
                        )),
                  )
                ],
              ),
            ),
            // actions: <Widget>[
            //   // TextButton(
            //   //   onPressed: () => Navigator.pop(
            //   //       context, 'Cancel'),
            //   //   child: const Text('Cancel'),
            //   // ),
            //   TextButton(
            //     onPressed: () =>
            //         Navigator.pop(context, 'OK'),
            //     child: const Text('OK'),
            //   ),
            // ],
          ));
}
