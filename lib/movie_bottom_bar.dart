import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter_api_movie/pages/movie_list.dart';

class MovieBottomBar extends StatefulWidget {
  const MovieBottomBar({Key? key}) : super(key: key);

  @override
  State<MovieBottomBar> createState() => _MovieBottomBarState();
}

class _MovieBottomBarState extends State<MovieBottomBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    String appBarTitle = _updateAppBarTitle(_selectedIndex);

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: _getPage(_selectedIndex),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: navBarItems,
      ),
    );
  }

  String _updateAppBarTitle(int index) {
    switch (index) {
      case 0:
        return 'Popular Movies';
      case 1:
        return 'Upcoming Movies';
      case 2:
        return 'Top Rated Movies';
      default:
        return 'Movie App';
    }
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return MovieList(category: 'popular');
      case 1:
        return MovieList(category: 'upcoming');
      case 2:
        return MovieList(category: 'top_rated');
      default:
        return Container();
    }
  }

  final List<SalomonBottomBarItem> navBarItems = [
    SalomonBottomBarItem(
      icon: const Icon(Icons.star),
      title: const Text("Popular"),
      selectedColor: Colors.purple,
      unselectedColor: Colors.grey,
    ),
    SalomonBottomBarItem(
      icon: const Icon(Icons.schedule),
      title: const Text("Upcoming"),
      selectedColor: Colors.pink,
      unselectedColor: Colors.grey,
    ),
    SalomonBottomBarItem(
      icon: const Icon(Icons.trending_up),
      title: const Text("Top Rated"),
      selectedColor: Colors.orange,
      unselectedColor: Colors.grey,
    ),
  ];
}
