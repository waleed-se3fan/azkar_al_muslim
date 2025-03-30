import 'package:azkar_al_muslim/app/Home_screen/ahadeeth/view.dart';
import 'package:azkar_al_muslim/app/Home_screen/cubit/home_screen_cubit.dart';
import 'package:azkar_al_muslim/app/Home_screen/maeaqeet_alsalah/view.dart';
import 'package:azkar_al_muslim/app/Home_screen/prophetsstories/view.dart';
import 'package:azkar_al_muslim/app/Home_screen/soundview/readers.dart';
import 'package:azkar_al_muslim/app/Home_screen/tafseer/view.dart';
import 'package:azkar_al_muslim/app/almasbaha/almasbaha.dart';
import 'package:azkar_al_muslim/app/asmaa_allah/azkar_alsabah/azkar_alsabah.dart';
import 'package:azkar_al_muslim/app/cubit/app_cubit.dart';
import 'package:azkar_al_muslim/data/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_share/flutter_share.dart';

import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';

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
        child: Column(
          children: [
            const HomeCard(),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildOption(
                    context: context,
                    title: 'القرآن الكريم\n(بدون إنترنت)',
                    icon: Icons.menu_book_rounded,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (c) {
                        return const SurahListScreen(
                          isSounded: false,
                          appbarText: "القران الكريم",
                        );
                      }));
                    },
                  ),
                  _buildOption(
                    context: context,
                    title: 'القرآن الكريم\n(بالتفسير)',
                    icon: Icons.menu_book_rounded,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (c) {
                        return const TafseerListScreen(
                            isSounded: false,
                            appbarText: 'القران الكريم بالتفسير');
                      }));
                    },
                  ),
                  _buildOption(
                    context: context,
                    title: 'القرآن صوت',
                    icon: Icons.volume_up_rounded,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (c) {
                        return QariScreen();
                      }));
                    },
                  ),
                  _buildOption(
                    context: context,
                    title: 'مواقيت الصلاة',
                    icon: Icons.access_time_rounded,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (c) {
                        return const PrayerTimesScreen();
                      }));
                    },
                  ),
                  _buildOption(
                    context: context,
                    title: 'أذكار الصباح والمساء',
                    icon: Icons.wb_sunny_rounded,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (c) {
                        return AzkarAlsabahScreen();
                      }));
                    },
                  ),
                  _buildOption(
                    context: context,
                    title: 'المسبحة',
                    icon: Icons.fingerprint_rounded,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (c) {
                        return const AlbasbahaScreen();
                      }));
                    },
                  ),
                  _buildOption(
                    context: context,
                    title: 'قصص الأنبياء',
                    icon: Icons.book_rounded,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (c) {
                        return ProphetsStoriesScreen();
                      }));
                    },
                  ),
                  _buildOption(
                    context: context,
                    title: 'احاديث',
                    icon: Icons.star_rounded,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (c) {
                        return const HadithScreen();
                      }));
                    },
                  ),
                ],
              ),
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
    required BuildContext context,
  }) {
    var appCubit = context.watch<AppCubit>();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: Theme.of(context).brightness == Brightness.light
            ? BoxDecoration(
                color: Colors.teal.shade700,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
              )
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.tealAccent),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: appCubit.font_size,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

/////////////////////////////////////////////

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String gregorianDate = DateFormat("yyyy/MM/dd").format(now);

    HijriCalendar hijriDate = HijriCalendar.now();
    String hijriDay = hijriDate.hDay.toString();
    String hijriMonth = hijriDate.longMonthName;
    String hijriYear = hijriDate.hYear.toString();
    var appCubit = context.watch<AppCubit>();

    List<String> arabicDays = [
      "الأحد",
      "الإثنين",
      "الثلاثاء",
      "الأربعاء",
      "الخميس",
      "الجمعة",
      "السبت"
    ];
    String arabicDay = arabicDays[now.weekday % 7];

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: Theme.of(context).brightness == Brightness.light
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [Colors.teal[400]!, Colors.teal[200]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              )
            : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.wb_sunny, color: Colors.white, size: 30),
                const SizedBox(height: 5),
                Text(
                  gregorianDate,
                  style: TextStyle(
                    fontSize: appCubit.font_size,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.brightness_3, color: Colors.white, size: 30),
                const SizedBox(height: 5),
                Text(
                  "$hijriDay $hijriMonth $hijriYear هـ",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.calendar_today, color: Colors.white, size: 30),
                const SizedBox(height: 5),
                Text(
                  arabicDay,
                  style: TextStyle(
                    fontSize: appCubit.font_size,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//////////////////////////////////////////////
class SurahListScreen extends StatelessWidget {
  final bool isSounded;
  final String appbarText;
  const SurahListScreen(
      {super.key, required this.isSounded, required this.appbarText});

  @override
  Widget build(BuildContext context) {
    var cubit = HomeScreenCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(appbarText),
      ),
      body: Column(
        children: [
          isSounded
              ? Container()
              : Padding(
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
                      fillColor:
                          Theme.of(context).brightness == Brightness.light
                              ? Colors.teal.shade700
                              : null, // Softer teal for input
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
                  ? Expanded(
                      child: SuhrasView(
                      surahs: state.surahs,
                      isSounded: isSounded,
                      isTafseer: false,
                    ))
                  : state is SearchLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Expanded(
                          child: SuhrasView(
                            surahs: cubit.data ?? [],
                            isSounded: isSounded,
                            isTafseer: false,
                          ),
                        );
            },
          ),
        ],
      ),
    );
  }
}
////////////////////////////////////////////////////

class SuhrasView extends StatelessWidget {
  final List<Surahs> surahs;
  final bool isSounded;
  final bool isTafseer;
  const SuhrasView(
      {super.key,
      required this.surahs,
      required this.isSounded,
      required this.isTafseer});

  @override
  Widget build(BuildContext context) {
    var cubit = HomeScreenCubit.get(context);
    return ListView.builder(
      itemCount: surahs.length,
      itemBuilder: (context, index) {
        final surah = surahs[index];
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.teal.shade700
                : null,
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
              print(isSounded.toString());
              isSounded
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            QariVoiceScreen(qariName: surah.name, index: index),
                      ),
                    )
                  : isTafseer
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TafserAyatScreen(
                              index: index,
                              surahName: surahs[index].name,
                            ),
                          ),
                        )
                      : Navigator.push(
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
  final List<AyatModel> ayat;

  const SurahAyatScreen({
    super.key,
    required this.surahName,
    required this.ayat,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = HomeScreenCubit.get(context);
    var appCubit = context.watch<AppCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          surahName,
          style: TextStyle(
            fontSize: appCubit.font_size,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 2,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: Theme.of(context).brightness == Brightness.light
              ? LinearGradient(
                  colors: [
                    Colors.teal[100]!,
                    Colors.teal[50]!,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              : null,
        ),
        child: ListView.separated(
          padding: const EdgeInsets.all(10),
          itemCount: ayat.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return GestureDetector(
              onLongPress: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Wrap(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.copy, color: Colors.black),
                          title: const Text('نسخ'),
                          onTap: () {
                            Clipboard.setData(
                                ClipboardData(text: ayat[index].text));
                            Navigator.pop(context);

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'تم نسخ (${ayat[index].text})',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white, // لون النص
                                    fontSize: appCubit.font_size,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                backgroundColor: Colors.teal,
                                behavior: SnackBarBehavior.floating,
                                margin: const EdgeInsets.all(16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                duration: const Duration(seconds: 2),
                                action: SnackBarAction(
                                  label: 'UNDO',
                                  textColor: Colors.white,
                                  onPressed: () {},
                                ),
                              ),
                            );
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.favorite_border,
                              color: Colors.black),
                          title: const Text('أضف الي المفضلة'),
                          onTap: () async {
                            await cubit.addToFavourite(ayat[index].text);
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'تم اضافة (${ayat[index].text}) الي المفضلة',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                backgroundColor: Colors.teal,
                                behavior: SnackBarBehavior.floating,
                                margin: const EdgeInsets.all(16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                duration: const Duration(seconds: 2),
                                action: SnackBarAction(
                                  label: 'UNDO',
                                  textColor: Colors.white,
                                  onPressed: () {},
                                ),
                              ),
                            );
                          },
                        ),
                        ListTile(
                            leading: const Icon(
                              Icons.share_outlined,
                              color: Colors.black,
                            ),
                            title: const Text('مشاركة'),
                            onTap: () async {
                              Navigator.pop(context);
                              FlutterShare.share(
                                  title: 'مشاركة', text: ayat[index].text);
                            }),
                      ],
                    );
                  },
                );
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  padding: const EdgeInsets.all(13),
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
                            style: TextStyle(
                              fontSize: appCubit.font_size,
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
                            fontSize: appCubit.font_size,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            //height: 1.6,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

//////////////////////////////////////////////