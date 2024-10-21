import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/localization/local_cubit/local_cubit.dart';
import '../../../../core/utils/shared_preferences_helper.dart';

class AppBarCommonScaffold extends StatelessWidget {
  final String title;
  final Color searchIconColor;
  final Color fillColor;

  const AppBarCommonScaffold({
    required this.title,
    required this.searchIconColor,
    required this.fillColor,
    Key? key,
  }) : super(key: key);
  Future<void> _navigateToNotifications(BuildContext context) async {
    final userId = await SharedPreferencesHelper.getUserID();
    if (userId != null) {
      context.go('/notifications', extra: {'userId': userId});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context).translate('user_id_not_found')),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 650;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              children: [
                /*IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),*/
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              if (!isMobile)
                IconButton(
                  iconSize: 25,
                  icon: const Icon(Icons.notifications, color: Colors.black),
                  onPressed: () => _navigateToNotifications(context),
                ),
              const SizedBox(width: 20),
              IconButton(
                icon: const Icon(Icons.translate),
                onPressed: () {
                  final localeCubit = BlocProvider.of<LocaleCubit>(context);
                  if (localeCubit.state.languageCode == 'en') {
                    localeCubit.toArabic();
                  } else {
                    localeCubit.toEnglish();
                  }
                },
              ),

              const SizedBox(width: 20),
              Container(
                width: 140,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white24, width: 1),
                  borderRadius: BorderRadius.circular(55),
                  image: const DecorationImage(
                    image: AssetImage('images/logo18.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}