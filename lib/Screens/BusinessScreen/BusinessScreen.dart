import 'package:news_project/cubit/cubit.dart';
import 'package:news_project/shared/compenents/compenents.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = appcubit.get(context).business;
    return articlebuilder(list: list, context: context);
  }
}
