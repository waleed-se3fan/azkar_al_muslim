import 'package:azkar_al_muslim/app/abou_app_screen/about_app.dart';
import 'package:azkar_al_muslim/app/setting/fontsize.dart';
import 'package:azkar_al_muslim/app/setting/nightmode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/component/azkar_item.dart';
import '../cubit/app_cubit.dart';

class SettingScreen extends StatelessWidget {
  List setting = ['وضع ليلي', 'حجم الخط', 'حول التطبيق'];

  List settingScreens = [NightModeScreen(), FontSizeScreen(), AboutAppScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new_rounded)),
        title: Text('الاعدادات'),
      ),
      body: BlocProvider(
        create: (context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AppCubit.get(context);
            return Container(
              child: Column(
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
                                padding: EdgeInsets.all(10),
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
                                          color: Colors.yellow[50],
                                          fontSize: 20),
                                    )),
                              ),
                            ),
                          );
                        }),
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
