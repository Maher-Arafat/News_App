// ignore_for_file: non_constant_identifier_names

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';

import 'package:newapp/shared/cubit/newcubit/cubit.dart';

import '../../modules/news_app/webview/webview.dart';
import '../cubit/appcubit/cubit.dart';

Widget buildArticleItem(article, context) => InkWell(
      onTap: () {
        NewsCubit.get(context).navigateTo(
          context,
          WebViewScreen(url: article['url']),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage('${article['urlToImage']}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: SizedBox(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: AppCubit.get(context).isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget myDivder() => Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey[300],
    );

Widget buildArticle(lst, context, {isSearch = false}) => ConditionalBuilder(
      condition: lst.length > 0,
      builder: (context) => ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              buildArticleItem(lst[index], context),
          separatorBuilder: (context, index) => myDivder(),
          itemCount: lst.length),
      fallback: (context) => isSearch
          ? Container()
          : const Center(
              child: CircularProgressIndicator(
              color: Colors.teal,
            )),
    );

Widget defultFormField({
  bool isPassword = false,
  required TextEditingController controller,
  required TextInputType type,
  Function(String)? onSubmit,
  Function(String)? onChange,
  Function()? onTap,
  required FormFieldValidator<String> validate,
  required String label,
  required IconData prefix,
  IconData? sufix,
  Function()? sufixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      enabled: isClickable,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: sufix != null
            ? IconButton(onPressed: sufixPressed, icon: Icon(sufix))
            : null,
        border: const OutlineInputBorder(),
      ),
    );
