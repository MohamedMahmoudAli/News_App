import '../../shared/compenents/compenents.dart';
import 'package:flutter/material.dart';
import 'package:news_project/cubit/cubit.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = appcubit.get(context).science;
    return articlebuilder(context: context,list: list);
  }
}
