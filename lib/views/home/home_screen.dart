import 'package:e_learning_app/models/category.dart';
import 'package:e_learning_app/repositories/category_repository.dart';
import 'package:e_learning_app/views/home/widgets/category_section.dart';
import 'package:e_learning_app/views/home/widgets/home_app_bar.dart';
import 'package:e_learning_app/views/home/widgets/in_progress_section.dart';
import 'package:e_learning_app/views/home/widgets/recommended_section.dart';
import 'package:e_learning_app/views/home/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CategoryRepository _categoryRepository = CategoryRepository();
  List<Category> _categories = [];
  bool _isLoading = true;

  initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    try {
      final categories = await _categoryRepository.getCategories();
      setState(() {
        _categories = categories;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const HomeAppBar(),
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              const SearchBarWidget(),
              const SizedBox(height: 32),
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : CategorySection(categories: _categories),
              const SizedBox(height: 32),
              const InProgressSection(),
              const RecommendedSection(),
            ]),
          ),
        ),
      ],
    );
  }
}
