import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/data.dart';

// the provider class is for the data that never changes
final mealsProvider = Provider(
  (ref) => dummyMeals,
);
