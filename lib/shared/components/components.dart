import 'package:flutter/material.dart';

import '../cubit/cubit.dart';

Widget defaultButton({
  double? width = double.infinity,
  Color? background = Colors.blue,
  bool isUpperCase = true,
  double radius = 10,
  required Function? buttonFunction,
  required String? text,
}) =>
    Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(
          radius,
        ),
      ),
      child: MaterialButton(
        onPressed: () {
          buttonFunction!();
        },
        child: Text(
          isUpperCase ? text!.toUpperCase() : text!,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

Widget defaultFormField({
  required TextEditingController? controller,
  required TextInputType? type,
  required String? text,
  required String? label,
  required IconData? prefix,
  bool isPassword = false,
  IconData? suffix,
  Function? suffixPresed,
  required Function? onTap,
  bool isClickable = true,
}) =>
    TextFormField(
      style: const TextStyle(
        color: Colors.black,
      ),
      obscureText: isPassword,
      controller: controller,
      keyboardType: type,
      cursorColor: Colors.black,
      validator: (value) {
        if (value!.isEmpty) {
          return text;
        }
        return null;
      },
      onTap: () {
        onTap!();
      },
      enabled: isClickable,
      decoration: InputDecoration(
        labelText: label,
        hintText: text,
        hintStyle: TextStyle(
          color: Colors.blueGrey[200],
        ),
        hintMaxLines: 1,
        labelStyle: TextStyle(
          color: Colors.blueGrey[800],
        ),
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixPresed!();
                },
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: const OutlineInputBorder(),
      ),
    );

Widget defaultText({
  required normalText,
}) =>
    Text(
      normalText,
      style: TextStyle(
        color: Colors.blueGrey[200],
      ),
    );

Widget buildTaskItem(Map model, context) => Dismissible(
      key: Key(
        model['id'].toString(),
      ),
      onDismissed: (direction) {
        AppCubit.get(context).deleteData(
          id: model['id'],
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              child: Text(
                "${model["time"]}",
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model["title"]}',
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${model["date"]}',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            IconButton(
              icon: const Icon(
                Icons.check_box,
                color: Colors.green,
              ),
              onPressed: () {
                AppCubit.get(context).updateData(
                  status: 'done',
                  id: model['id'],
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.archive, color: Colors.black45),
              onPressed: () {
                AppCubit.get(context).updateData(
                  status: 'archive',
                  id: model['id'],
                );
              },
            ),
          ],
        ),
      ),
    );

Widget? taskBuilder({required List<Map> tasks}) {
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Icon(
        Icons.menu,
        size: 100,
        color: Colors.grey,
      ),
      Text(
        "data",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey),
      ),
    ],
  );
  return null;
}
