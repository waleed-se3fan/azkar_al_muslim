import 'package:azkar_al_muslim/app/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            body: cubit.widgets[cubit.currentIndex],
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 10,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.transparent,
                selectedItemColor: Colors.tealAccent,
                unselectedItemColor: Colors.white.withOpacity(0.7),
                showSelectedLabels: true,
                showUnselectedLabels: true,
                selectedFontSize: 14,
                unselectedFontSize: 12,
                elevation: 0,
                currentIndex: cubit.currentIndex,
                onTap: (i) {
                  cubit.changeIndex(i);
                },
                items: [
                  _buildNavBarItem(
                    icon: Icons.home,
                    label: 'الرئيسية',
                    isActive: cubit.currentIndex == 0,
                  ),
                  _buildNavBarItem(
                    icon: Icons.star,
                    label: 'المفضلة',
                    isActive: cubit.currentIndex == 1,
                  ),
                  _buildNavBarItem(
                    icon: Icons.compass_calibration,
                    label: 'البوصلة',
                    isActive: cubit.currentIndex == 2,
                  ),
                  _buildNavBarItem(
                    icon: Icons.question_mark_rounded,
                    label: 'مساعدة',
                    isActive: cubit.currentIndex == 3,
                  ),
                  _buildNavBarItem(
                    icon: Icons.settings,
                    label: 'الإعدادات',
                    isActive: cubit.currentIndex == 4,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  BottomNavigationBarItem _buildNavBarItem({
    required IconData icon,
    required String label,
    required bool isActive,
  }) {
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          Icon(
            icon,
            size: 28,
            color: isActive ? Colors.tealAccent : Colors.white.withOpacity(0.7),
          ),
          if (isActive)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 3,
              width: 20,
              decoration: BoxDecoration(
                color: Colors.tealAccent,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
        ],
      ),
      label: label,
    );
  }
}
