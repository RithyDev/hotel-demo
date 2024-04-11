import 'package:flutter/material.dart';

Widget appBlockLoading(String title) {
  return Container(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: Card(
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(strokeWidth: 1),
                const SizedBox(
                  width: 16,
                ),
                Text(title)
              ],
            ),
          ),
        ),
      ));
}
