import 'package:azkar_al_muslim/app/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FontSizeScreen extends StatelessWidget {
  const FontSizeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return BlocProvider(
          create: (context) => AppCubit(),
          child: Scaffold(
            appBar: AppBar(
              title: Text('حجم الخط'),
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new_rounded)),
            ),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(': حدد حجم الخط المناسب ',
                        style: TextStyle(color: Colors.yellow[50])),
                  ),
                  Expanded(
                    child: Slider(
                        activeColor: Colors.black,
                        inactiveColor: Colors.yellow[50],
                        min: 0,
                        max: 100,
                        value: AppCubit.font_size,
                        onChanged: (val) {
                          cubit.changeFontSize(val);
                        }),
                  ),
                  Text(': مثال ', style: TextStyle(color: Colors.yellow[50])),
                  Expanded(
                    flex: 2,
                    child: Text('أسْتَغْفِرُ اللهَ وَأتُوبُ إلَيْهِ',
                        style: TextStyle(
                            fontSize: AppCubit.font_size,
                            color: Colors.yellow[50])),
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
