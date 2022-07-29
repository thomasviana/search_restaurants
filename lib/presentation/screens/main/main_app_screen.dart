import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_restaurants/presentation/screens/home/home_screen.dart';
import 'package:search_restaurants/presentation/screens/main/main_app_cubit/main_screen_cubit.dart';
import 'package:search_restaurants/presentation/screens/search_history/search_history_screen.dart';
import 'package:search_restaurants/presentation/theme/theme.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({Key? key}) : super(key: key);

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  late MainScreenCubit cubit;

  @override
  void initState() {
    cubit = context.read<MainScreenCubit>();
    super.initState();
  }

  Widget _buildPage(BuildContext context, int selectedPageIndex) {
    switch (selectedPageIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const SearchHistoryScreen();
      default:
        return const Placeholder(color: AppColors.black);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenCubit, MainScreenState>(
      builder: (context, state) {
        return Scaffold(
          body: _buildPage(context, state.selectedPageIndex ?? 0),
          bottomNavigationBar: BottomAppBar(
            child: SizedBox(
              height: 60,
              child: Row(
                children: [
                  NavBarButton(
                    isSelected: state.homeSelected,
                    onPressed: () {
                      cubit.onSelectedPageIndexChanged(0);
                    },
                    icon: Icons.home_outlined,
                    iconSelected: Icons.home,
                  ),
                  NavBarButton(
                    isSelected: state.searchHistorySelected,
                    onPressed: () {
                      cubit.onSelectedPageIndexChanged(1);
                    },
                    icon: Icons.format_list_bulleted_rounded,
                    iconSelected: Icons.format_list_bulleted_rounded,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class NavBarButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onPressed;
  final IconData icon;
  final IconData iconSelected;
  const NavBarButton({
    Key? key,
    required this.isSelected,
    required this.onPressed,
    required this.icon,
    required this.iconSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onPressed: onPressed,
        child: Icon(
          isSelected ? iconSelected : icon,
          size: 32,
          color: isSelected ? AppColors.primaryColor : AppColors.greySecondary,
        ),
      ),
    );
  }
}
