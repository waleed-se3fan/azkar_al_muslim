import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/variables/constant.dart';
import '../cubit/app_cubit.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('الاعدادات'),
      ),
      body: BlocProvider(
        create: (context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: setting.length,
                      itemBuilder: (c, i) {
                        return Container(
                          alignment: Alignment.topRight,
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: TextButton.icon(
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return settingScreens[i];
                                    }));
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    color: Colors.yellow[50],
                                  ),
                                  label: Text(
                                    setting[i],
                                    style: TextStyle(
                                        color: Colors.yellow[50], fontSize: 20),
                                  )),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
