import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:practice_bloc_flutter_infinite_list/simple_bloc_observeer.dart';

import 'my_app.dart';

void main(){
  Bloc.observer = const SimpleBlocObserver();
  runApp(MyApp());
}