import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/components.dart';
import '../../../shared/cubit/newcubit/cubit.dart';
import '../../../shared/cubit/newcubit/states.dart';

class ScincseScreen extends StatelessWidget {
  const ScincseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List lst = NewsCubit.get(context).science;
        return buildArticle(lst,context);
      },
    );
  }
}
