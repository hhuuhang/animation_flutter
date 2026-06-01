import 'package:flutter/material.dart';
import '../models/animation_item.dart';

class AppDrawer extends StatelessWidget {
  final AnimationCategory? selectedCategory;
  final Function(AnimationCategory?) onCategorySelected;

  const AppDrawer({
    super.key,
    this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF121212),
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF6C63FF), Color(0xFF3F8CFF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.animation, size: 48, color: Colors.white),
                  SizedBox(height: 12),
                  Text(
                    'Flutter Animations',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.apps, color: Colors.white70),
            title: const Text('All Animations',
                style: TextStyle(color: Colors.white)),
            selected: selectedCategory == null,
            selectedTileColor: Colors.white.withOpacity(0.1),
            onTap: () {
              onCategorySelected(null);
              Navigator.pop(context);
            },
          ),
          const Divider(color: Colors.white10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'CATEGORIES',
              style: TextStyle(
                color: Colors.white.withOpacity(0.3),
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: AnimationCategory.values.length,
              itemBuilder: (context, index) {
                final category = AnimationCategory.values[index];
                return ListTile(
                  leading: Icon(category.icon, color: Colors.white70),
                  title: Text(category.label,
                      style: const TextStyle(color: Colors.white)),
                  selected: selectedCategory == category,
                  selectedTileColor: Colors.white.withOpacity(0.1),
                  onTap: () {
                    onCategorySelected(category);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
