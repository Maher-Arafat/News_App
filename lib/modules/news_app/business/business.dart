import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/shared/cubit/newcubit/cubit.dart';
import 'package:newapp/shared/cubit/newcubit/states.dart';

import '../../../shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List lst = NewsCubit.get(context).business;
        return buildArticle(lst,context);
      },
    );
  }
}
