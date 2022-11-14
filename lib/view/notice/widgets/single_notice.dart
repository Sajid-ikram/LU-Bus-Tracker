import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lu_bird/models/notice_model.dart';
import 'package:photo_view/photo_view.dart';

class SingleNotice extends StatelessWidget {
  const SingleNotice({Key? key, required this.notice}) : super(key: key);
  final NoticeModel notice;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      margin: EdgeInsets.fromLTRB(30.w, 10.h, 30.w, 10.h),
      padding: EdgeInsets.fromLTRB(20.w, 21.h, 5, 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color:  Colors.grey.withOpacity(0.3), width: 1),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 45.h,
                width: 45.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withOpacity(0.4),
                  image: const DecorationImage(
                    image: AssetImage("assets/lu.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(width: 15.w),
              Text(
                "LU Transport",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h),
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                notice.description!,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 14.sp, height: 1.4),
              ),
            ),
          ),
          if (notice.imageUrl != "") SizedBox(height: 15.h),
          if (notice.imageUrl != "")
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return PhotoView(
                      imageProvider: NetworkImage(notice.imageUrl!),
                    );
                  }),
                );
              },
              child: Container(
                width: double.infinity,
                height: 226.h,
                padding: EdgeInsets.only(right: 15.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    notice.imageUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
