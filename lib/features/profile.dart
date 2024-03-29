import 'package:exam_4/assets/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../assets/icons.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            hoverColor: Colors.grey,
            trailing: Icon(Icons.arrow_forward_ios),
            leading: CircleAvatar(
              radius: 50,
              backgroundColor: dark,
              child: SvgPicture.asset(
                '',
              ),
            ),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Jasur Jaxongirov',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '+998 99 474 66 28',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          Gap(30),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: GestureDetector(
                  onTap: () {
                    print("medg");
                  },
                  child: Container(
                      width: 150,
                      height: 52,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white38,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 8,
                          ),
                          SvgPicture.asset(AppIcons.medg, fit: BoxFit.cover),
                          SizedBox(
                            width: 12,
                          ),
                          Text('MedG haqida',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: GestureDetector(
                  onTap: () {
                    print("qo'llab quvatlash");
                  },
                  child: Container(
                      width: 150,
                      height: 52,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white38,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 8,
                          ),
                          SvgPicture.asset(AppIcons.qollab_quvatlash,
                              fit: BoxFit.cover),
                          SizedBox(
                            width: 12,
                          ),
                          Text("Qo'llab-\n quvatlash",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      )),
                ),
              ),
            ],
          ),
          Gap(50),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListTile(
                hoverColor: Colors.grey,
                trailing: Icon(Icons.arrow_forward_ios),
                leading: SvgPicture.asset(AppIcons.logout),
                title: Text(
                  'Logout',
                  style: TextStyle(fontSize: 24, color: red),
                ),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
