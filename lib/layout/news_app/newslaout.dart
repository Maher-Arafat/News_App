// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/shared/cubit/appcubit/cubit.dart';
import 'package:newapp/shared/cubit/newcubit/cubit.dart';

import '../../modules/news_app/search/search_screen.dart';
import '../../shared/cubit/newcubit/states.dart';

class newsLayout extends StatelessWidget {
  const newsLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'News App',
            ),
            actions: [
              IconButton(
                onPressed: () {
                  cubit.navigateTo(context, SearchScreen());
                },
                icon: const Icon(
                  Icons.search,
                ),
              ),
              IconButton(
                onPressed: () {
                  AppCubit.get(context).changeModeState();
                },
                icon: const Icon(
                  Icons.brightness_4_outlined,
                ),
              ),
            ],
          ),
          body: cubit.scrns[cubit.crntIdx],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.crntIdx,
            items: cubit.bottomItms,
            onTap: (idx) {
              cubit.changeBottomNavBar(idx);
            },
          ),
        );
      },
    );
  }
}
