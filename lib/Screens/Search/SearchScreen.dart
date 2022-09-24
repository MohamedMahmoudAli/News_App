import 'package:news_project/cubit/appstates.dart';
import 'package:news_project/shared/compenents/compenents.dart';
import 'package:flutter/material.dart';
import 'package:news_project/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var searchcontroler = TextEditingController();
    return BlocConsumer<appcubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          String s = '';
          List list = appcubit.get(context).search;
          return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.keyboard_arrow_left,
                  ),
                  color: Colors.black,
                ),
                title: Text(
                  'Search',
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      child: defaultTextField(
                        type: TextInputType.text,
                        controler: searchcontroler,
                        text: 'Search',
                        prefixicon: Icons.search,
                        validat: (String value) {
                          if (value.isEmpty) {
                            return 'search must not be empty';
                          }
                          return null;
                        },
                        onsubmited: (value) {
                          appcubit.get(context).getsearch(value);
                        },
                      ),
                    ),
                   const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                        child: articlebuilder(list: list, context: context))
                  ],
                ),
              ));
        });
  }
}
