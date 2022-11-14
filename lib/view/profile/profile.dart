
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lu_bird/providers/profile_provider.dart';
import 'package:lu_bird/view/profile/profile_widget/profile_image.dart';
import 'package:lu_bird/view/profile/profile_widget/profile_list.dart';
import 'package:provider/provider.dart';

import '../../providers/authentication.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var pro = Provider.of<ProfileProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Container(
                  height: size.height * 0.21,
                  color: Colors.white,
                ),
                Container(
                  height: size.height - size.height * 0.21,
                  color: Colors.grey.withOpacity(0.1),
                ),
              ],
            ),
            topWidget(size, pro)
          ],
        ),
      ),
    );
  }
}

Widget topWidget(Size size, ProfileProvider pro) {
  final List<String> listName = [
    "Edit Profile",
    "About Us",
    "Privacy Policy",
    "Live Track",
    "LogOut",

  ];

  final List<IconData> listIcons = [
    Icons.person_outline,
    Icons.groups,
    Icons.privacy_tip,
    Icons.location_on,
    Icons.login_outlined,

  ];



  return SingleChildScrollView(
    child: SizedBox(
      height: 800.h,
      width: 360.w,
      child: Column(
        children: [
          SizedBox(height: size.height * 0.12),
          profileImage(size),
           Text(
            pro.profileName.isEmpty ? "Unknown Name" :pro.profileName,
            style: TextStyle(
              fontSize: 23.sp,
              fontWeight: FontWeight.bold,

            ),
          ),
          const SizedBox(height: 10),
          Text(
            pro.email.isEmpty ? "Unknown Email" : pro.email,
            style: TextStyle(fontSize: 13.sp, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          Expanded(

            child: ListView.builder(
              physics: const BouncingScrollPhysics(),

              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    if(index == 0){
                      Navigator.of(context).pushNamed("AboutMe");
                    }
                    else if(index == 1){
                      Navigator.of(context).pushNamed("MyOrders");
                    }
                    else if(index == 2){
                      Navigator.of(context).pushNamed("Favourite");
                    }
                    else if(index == 3){
                      Navigator.of(context).pushNamed("GPSSetting");
                    }
                    else if(index == 4){
                      Provider.of<Authentication>(context, listen: false).signOut();
                    }

                  },
                  child: profileList(
                    listName[index],
                    listIcons[index],

                  ),
                );
              },
              itemCount: 5,
            ),
          ),
          //const SizedBox(height: 55),
        ],
      ),
    ),
  );
}