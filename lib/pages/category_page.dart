import 'package:flutter/material.dart';
import 'package:meals_app/data/data.dart';
import 'package:meals_app/models/category_model.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/pages/meal_page.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with SingleTickerProviderStateMixin {
  //if we have more than one animation controller use TickerProviderStateMixin
  //thats an Explicit animation
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
      //these are the default value
      // lowerBound: 0,
      // upperBound: 1,
    );

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsPage(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      child: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.4,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          // availableCategories.map((categoryModel => CategoryGridItem(categoryModel: categoryModel)).toList()
          for (final categoryModel in availableCategories)
            CategoryGridItem(
              category: categoryModel,
              onSelectCategory: () {
                _selectCategory(context, categoryModel);
              },
            )
        ],
      ),
      builder: (context, child) => SlideTransition(
        position: Tween(
          begin: const Offset(0, 0.3),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Curves.easeInOut,
          ),
        ),
        child: child,
      ),
    );
  }
}

// راجع من البيلدر 
// Padding(
//         padding: EdgeInsets.only(
//           top: 100 - animationController.value * 100,
//         ),
//         child: child,
//       ),
