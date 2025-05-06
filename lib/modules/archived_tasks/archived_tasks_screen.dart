import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class ArchivedTasksScreen extends StatelessWidget {
  const ArchivedTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (AppCubit.get(context).archivedTasks.isEmpty) {
          return Center(
              child: taskBuilder(tasks: AppCubit.get(context).archivedTasks));
        } else {
          return ListView.separated(
            itemBuilder: (context, index) {
              return buildTaskItem(
                  AppCubit.get(context).archivedTasks[index], context);
            },
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 20,
              ),
              child: Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[300],
              ),
            ),
            itemCount: AppCubit.get(context).archivedTasks.length,
          );
        }
      },
    );
  }
}
