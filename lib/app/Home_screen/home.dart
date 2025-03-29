import 'package:azkar_al_muslim/app/Home_screen/cubit/home_screen_cubit.dart';
import 'package:azkar_al_muslim/app/Home_screen/soundview/readers.dart';
import 'package:azkar_al_muslim/data/models/models.dart';
import 'package:azkar_al_muslim/data/quraan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/variables/constant.dart';

import '../cubit/app_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenCubit, HomeScreenState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Text('الرئيسية'),
            ),
            body: const QuraanScreen());
      },
    );
  }
}

class QuraanScreen extends StatelessWidget {
  const QuraanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildOption(
              title: 'القرآن الكريم\n(بدون إنترنت)',
              icon: Icons.menu_book_rounded,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (c) {
                  return const SurahListScreen();
                }));
              },
            ),
            _buildOption(
              title: 'القرآن صوت',
              icon: Icons.volume_up_rounded,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (c) {
                  return QariScreen();
                }));
              },
            ),
            _buildOption(
              title: 'مواقيت الصلاة',
              icon: Icons.access_time_rounded,
              onTap: () {
                // TODO: Navigate to Prayer Times screen
              },
            ),
            _buildOption(
              title: 'تفسير القرآن',
              icon: Icons.explore_rounded,
              onTap: () {
                // TODO: Navigate to Tafseer screen
              },
            ),
            _buildOption(
              title: 'أذكار الصباح والمساء',
              icon: Icons.wb_sunny_rounded,
              onTap: () {
                // TODO: Navigate to Morning and Evening Azkar screen
              },
            ),
            _buildOption(
              title: 'المسبحة',
              icon: Icons.fingerprint_rounded,
              onTap: () {
                // TODO: Navigate to Tasbeeh screen
              },
            ),
            _buildOption(
              title: 'قصص الأنبياء',
              icon: Icons.book_rounded,
              onTap: () {
                // TODO: Navigate to Prophets Stories screen
              },
            ),
            _buildOption(
              title: 'دعاء ختم القرآن',
              icon: Icons.auto_awesome_rounded,
              onTap: () {
                // TODO: Navigate to Quran Completion Dua screen
              },
            ),
            _buildOption(
              title: 'فضل السور',
              icon: Icons.star_rounded,
              onTap: () {
                // TODO: Navigate to Surah Virtues screen
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.teal.shade700,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.tealAccent),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

//////////////////////////////////////////////
class SurahListScreen extends StatelessWidget {
  const SurahListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = HomeScreenCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('القران الكريم'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: (value) {
                cubit.searchForSurahs(value);
              },
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search Surahs...',
                hintStyle: TextStyle(color: Colors.grey.shade300),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: Colors.teal.shade700, // Softer teal for input
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          BlocBuilder<HomeScreenCubit, HomeScreenState>(
            builder: (context, state) {
              return state is SearchSuccess
                  ? Expanded(child: SuhrasView(surahs: state.surahs))
                  : state is SearchLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Expanded(
                          child: SuhrasView(
                            surahs: cubit.data ?? [],
                          ),
                        );
            },
          ),
        ],
      ),
    );
  }
}

class SuhrasView extends StatelessWidget {
  final List<Surahs> surahs;
  const SuhrasView({super.key, required this.surahs});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: surahs.length,
      itemBuilder: (context, index) {
        final surah = surahs[index];
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.teal.shade700, // Card color
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: CircleAvatar(
              backgroundColor: Colors.tealAccent,
              child: Text(
                surah.number.toString(),
                style: const TextStyle(color: Colors.teal),
              ),
            ),
            title: Text(
              surah.name,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              '${surahs[index].type} • ${surahs[index].verses.length} verses',
              style: TextStyle(color: Colors.grey.shade300),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SurahAyatScreen(
                    surahName: surahs[index].name,
                    ayat: surahs[index].verses,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

//////////////////////////////////////////////////////////////

class SurahAyatScreen extends StatelessWidget {
  final String surahName;
  final List<Ayat> ayat;

  const SurahAyatScreen({
    super.key,
    required this.surahName,
    required this.ayat,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          surahName,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal[600],
        elevation: 2,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.teal[100]!,
              Colors.teal[50]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: ayat.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.teal.withOpacity(0.15),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.teal[400]!,
                          width: 2,
                        ),
                        color: Colors.teal[50],
                      ),
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      ayat[index].text,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.teal[900],
                        //height: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

//////////////////////////////////////////////