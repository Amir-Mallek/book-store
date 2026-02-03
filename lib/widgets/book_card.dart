import 'dart:math';

import 'package:book_shop/theme/colors.dart';
import 'package:flutter/material.dart';

import 'avatar_image.dart';

class BookCard extends StatelessWidget {
  BookCard({ Key? key, required this.book, this.onTap}) : super(key: key);
  final book;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 280,
        margin: EdgeInsets.only(right: 25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            // Book Cover Image
            Container(
              height: 180,
              width: double.infinity,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: shadowColor.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
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
                    child: Icon(Icons.book, size: 50, color: Colors.grey[600]),
                  ),
                ),
              ),
            ),
            // Book Title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                book["title"], 
                maxLines: 2, 
                overflow: TextOverflow.ellipsis, 
                textAlign: TextAlign.center, 
                style: TextStyle(
                  fontSize: 14, 
                  color: primary,
                  fontWeight: FontWeight.w600
                )
              ),
            ),
            SizedBox(height: 5,),
            // Price
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: book["price"], 
                    style: TextStyle(
                      fontSize: 16, 
                      color: primary,
                      fontWeight: FontWeight.w500
                    )
                  ),
                  TextSpan(text: "   "),
                  TextSpan(
                    text: book["ori_price"], 
                    style: TextStyle(
                      color: Colors.grey, 
                      fontSize: 14, 
                      decoration: TextDecoration.lineThrough, 
                      fontWeight: FontWeight.w500
                    )
                  ),
                ]
              )
            )
          ],
        ),
      ),
    );
  }
}