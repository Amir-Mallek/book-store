import 'dart:math';

import 'package:book_shop/theme/colors.dart';
import 'package:flutter/material.dart';

import 'avatar_image.dart';

class BookCover extends StatelessWidget {
  BookCover({ Key? key, required this.book, this.onTap }) : super(key: key);
  final book;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    double _width = 75, _height = 100;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 15),
        child: Column(
          children: [
            Container(
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: shadowColor.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  book["image"],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[300],
                    child: Icon(Icons.book, size: 30, color: Colors.grey[600]),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8,),
            Text(
              book["price"], 
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: primary,
                fontSize: 12
              )
            )
          ],
        ),
      ),
    );
  }
}