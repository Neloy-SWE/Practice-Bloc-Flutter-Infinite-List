/*
* Created by Neloy on 12 July, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'package:flutter/material.dart';

class BottomLoader extends StatelessWidget {
  const BottomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(strokeWidth: 1.5,),
      ),
    );
  }

}