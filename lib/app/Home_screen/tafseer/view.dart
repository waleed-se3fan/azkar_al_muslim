import 'package:azkar_al_muslim/app/Home_screen/cubit/home_screen_cubit.dart';
import 'package:azkar_al_muslim/app/Home_screen/home.dart';
import 'package:azkar_al_muslim/data/models/tafseer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_share/flutter_share.dart';

class TafseerListScreen extends StatelessWidget {
  final bool isSounded;
  final String appbarText;
  const TafseerListScreen(
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
                              : null,
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
                      isTafseer: true,
                    ))
                  : state is SearchLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Expanded(
                          child: SuhrasView(
                            surahs: cubit.data ?? [],
                            isSounded: isSounded,
                            isTafseer: true,
                          ),
                        );
            },
          ),
        ],
      ),
    );
  }
}

class TafserAyatScreen extends StatelessWidget {
  final String surahName;
  final int index;

  const TafserAyatScreen({
    super.key,
    required this.surahName,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    int newindex = index + 1;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          surahName,
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            HomeScreenCubit()..getQuraanwithTafseer(newindex.toString()),
        child: Container(
          decoration: Theme.of(context).brightness == Brightness.light
              ? BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.teal[100]!,
                      Colors.teal[50]!,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                )
              : null,
          child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
            builder: (context, state) {
              return state is GetQuranWithTafseerSuccess
                  ? ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: state.tafseerList.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ExpansionTile(
                            tilePadding: const EdgeInsets.all(16),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.teal[400]!, width: 2),
                                    color: Colors.teal[50],
                                  ),
                                  child: Text(
                                    state.tafseerList[index].aya,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    state.tafseerList[index].arabic_text,
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Text(
                                  state.tafseerList[index].translation,
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                              const Divider(thickness: 1),
                              ButtonBar(
                                alignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.copy,
                                        color: Colors.white),
                                    onPressed: () {
                                      Clipboard.setData(ClipboardData(
                                          text: state
                                              .tafseerList[index].translation));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              'تم نسخ (${state.tafseerList[index].translation})'),
                                          backgroundColor: Colors.teal,
                                          duration: const Duration(seconds: 2),
                                        ),
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.share_outlined,
                                        color: Colors.white),
                                    onPressed: () {
                                      FlutterShare.share(
                                          title: 'مشاركة',
                                          text: state
                                              .tafseerList[index].translation);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
        ),
      ),
    );
  }
}
