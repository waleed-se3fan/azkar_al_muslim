import 'package:azkar_al_muslim/app/Home_screen/cubit/home_screen_cubit.dart';
import 'package:azkar_al_muslim/app/Home_screen/home.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QariScreen extends StatelessWidget {
  QariScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = HomeScreenCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'القراء',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal[600],
        elevation: 2,
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => HomeScreenCubit(),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.teal[600]!,
                Colors.teal[400]!,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            itemCount: cubit.qaris.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              final qari = cubit.qaris[index];
              return GestureDetector(
                onTap: () {
                  cubit.getQariAudio(index + 1);
                  Navigator.push(context, MaterialPageRoute(builder: (c) {
                    return SurahListScreen(
                      isSounded: true,
                      appbarText: cubit.qaris[index],
                    );
                  }));
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.teal[50]!,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      qari,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[800],
                        letterSpacing: 0.5,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
/////////////////////////////////////////////////////////////////////

class QariVoiceScreen extends StatelessWidget {
  final String qariName;
  final int index;

  const QariVoiceScreen({
    super.key,
    required this.qariName,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          qariName,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.library_music_rounded,
                size: 100,
                color: Colors.white,
              ),
              const SizedBox(height: 20),
              Text(
                'استمع إلى تلاوة $qariName',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              BlocBuilder<HomeScreenCubit, HomeScreenState>(
                builder: (context, state) {
                  if (state is GetQariAudioSuccess) {
                    return GestureDetector(
                      onTap: () async {
                        context
                            .read<HomeScreenCubit>()
                            .playAedio(state.audioList[index].audioUrl);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Icon(
                          !state.isPlayed ? Icons.play_arrow : Icons.stop,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              Text(
                'اضغط للتشغيل',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.teal[100],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
