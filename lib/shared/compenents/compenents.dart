import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:news_project/cubit/appstates.dart';
import 'package:news_project/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget buildarticleitem(article, context, index) => Container(
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: article['urlToImage'] == null
                        ? DecorationImage(
                            image: NetworkImage(
                                'https://img.freepik.com/premium-vector/vector-set-red-sketch-question-mark-doodle-circle_574806-1710.jpg?w=740'))
                        : DecorationImage(
                            image: NetworkImage('${article['urlToImage']}'))),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  height: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text('${article['title']}',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyText1),
                      ),
                      Text(
                        '${article['publishedAt']}',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        onTap: () {
        },
      ),
    );
void navigateto(context, Widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ),
    );

Widget DefaultButton(
        {Color backgroundcolor = Colors.blue,
        double width = double.infinity,
        required String text,
        required Function function}) =>
    Container(
      width: width,
      color: backgroundcolor,
      alignment: Alignment.center,
      height: 40,
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
Widget defaultTextField(
        {required TextEditingController controler,
        required String text,
        required IconData prefixicon,
        required Function validat,
        Function? onsubmited,
        Function? onchanged,
        required TextInputType type,
        bool? obscure,
        IconData? suffixicon,
        Function? suffixfunction}) =>
    TextFormField(
      keyboardType: type,
      controller: controler,
      decoration: InputDecoration(
        labelText: text,
        border: OutlineInputBorder(),
        suffixIcon: suffixicon != null
            ? IconButton(
                onPressed: () {
                  suffixfunction!();
                },
                icon: Icon(
                  suffixicon,
                ),
              )
            : null,
        prefixIcon: Icon(prefixicon),
      ),
      onChanged: (s) {
        onchanged!(s);
      },
      validator: (s) {
        validat(s);
      },
      onFieldSubmitted: (value) {
        onsubmited!(value);
      },
    );
Widget articlebuilder({list, context}) => BlocConsumer<appcubit, AppStates>(
    listener: (context, state) {},
    builder: (context, state) {
      return ConditionalBuilder(
          condition: list.length > 0,
          builder: (context) => ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  buildarticleitem(list[index], context, index),
              separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                    ),
                    child: Container(height: 1, color: Colors.black),
                  ),
              itemCount: 10),
          fallback: (context) => Center(
                child: CircularProgressIndicator(),
              ));
    });
