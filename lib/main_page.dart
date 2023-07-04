import 'package:deeplink/home/home_page.dart';
import 'package:deeplink/news/news_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = useState(0);

    final homeController = useScrollController();
    final newsController = useScrollController();

    final tabs = useMemoized(
      () => [
        HomePage(controller: homeController),
        NewsPage(controller: newsController),
      ],
      [
        homeController,
        newsController,
      ],
    );

    return Scaffold(
      body: IndexedStack(
        index: currentIndex.value,
        children: tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex.value,
        onTap: (index) {
          if (index == currentIndex.value) {
            final controller = index == 0 ? homeController : newsController;
            controller.animateTo(
              0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
            return;
          }
          currentIndex.value = index;
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'News',
          ),
        ],
      ),
    );
  }
}
