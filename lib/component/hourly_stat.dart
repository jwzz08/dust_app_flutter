import 'package:flutter/material.dart';

import '../const/color.dart';

class HoulyStat extends StatelessWidget {
  const HoulyStat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          color: lightColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: darkColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16.0),
                    topLeft: Radius.circular(16.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    '시간별 미세먼지',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              ...List.generate(
                  24,
                      (index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 4.0),
                    child: Row(
                      children: [
                        Expanded(child: Text('11시')),
                        Expanded(
                          child: Image.asset(
                            'asset/img/best.png',
                            height: 20.0,
                          ),
                        ),
                        Expanded(
                            child: Text(
                              '보통',
                              textAlign: TextAlign.right,
                            )),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
