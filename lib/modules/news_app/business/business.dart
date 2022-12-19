import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/shared/cubit/newcubit/cubit.dart';
import 'package:newapp/shared/cubit/newcubit/states.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List lst = NewsCubit.get(context).business;
        return ScreenTypeLayout(
          mobile: Builder(builder: (context) {
            NewsCubit.get(context).setDesktop(false);
            return buildArticle(lst, context);
          }),
          desktop: Builder(builder: (context) {
            NewsCubit.get(context).setDesktop(true);
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: buildArticle(lst, context),
                ),
                if (lst.length > 0)
                  Expanded(
                      child: Container(
                    color: Colors.grey[200],
                    height: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                        '${lst[NewsCubit.get(context).selectedBusinessItem]['description']}',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  )),
              ],
            );
          }),
          breakpoints: ScreenBreakpoints(
            desktop: 600,
            tablet: 600,
            watch: 100,
          ),
        );
      },
    );
  }
}
