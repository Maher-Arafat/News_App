// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/shared/components/components.dart';
import 'package:newapp/shared/cubit/newcubit/cubit.dart';
import 'package:newapp/shared/cubit/newcubit/states.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var lst = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: defultFormField(
                controller: searchController,
                type: TextInputType.text,
                onChange: (value) {
                  NewsCubit.get(context).getSearch(value);
                },
                validate: (String? value) {
                  if (value!.isEmpty) {
                    return 'Search Must not be empty';
                  }
                  return null;
                },
                label: 'Search',
                prefix: Icons.search,
              ),
            ),
            Expanded(child: buildArticle(lst, context,isSearch: true)),
          ]),
        );
      },
    );
  }
}
