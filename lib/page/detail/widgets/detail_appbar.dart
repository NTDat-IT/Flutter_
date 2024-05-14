import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_appdemo/apps/untils/const.dart';

import '../../my_app.dart';

class DetailAppBar extends StatefulWidget implements PreferredSizeWidget {
  const DetailAppBar({Key? key}) : super(key: key);

  @override
  State<DetailAppBar> createState() => _DetailAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

String cityName = 'Hà Nội';

class _DetailAppBarState extends State<DetailAppBar> {
  final TextEditingController _searchController = TextEditingController();
  // Giá trị mặc định của thành phố

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: false,
      elevation: 0,
      title: Row(
        children: [
          const Icon(
            CupertinoIcons.location,
          ),
          const SizedBox(
            width: 20,
          ),
          _buildTitleWidget(),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              cityName = '';
              Mykey.ApiCity = cityName;
            });
          },
          icon: const Icon(CupertinoIcons.search),
        ),
        const SizedBox(
          width: 20,
        )
      ],
    );
  }

  Widget _buildTitleWidget() {
    return Expanded(
      child: TextField(
        controller: _searchController,
        onChanged: (value) {
          setState(() {
            cityName = value;
            Mykey.ApiCity = value;
          });
        },
        decoration: const InputDecoration(
          hintText: 'Enter city name',
          hintStyle: TextStyle(color: Colors.white),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
