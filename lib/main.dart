import 'package:flutter/material.dart';
import 'package:mm/ui/app.dart';
import 'package:mm/ui/di/container.dart';

void main() => runApp(DIContainer().provide(App()));


