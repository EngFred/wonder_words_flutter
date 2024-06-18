import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wonder_words/core/theme/bloc/theme_bloc_event.dart';
import 'package:wonder_words/core/theme/bloc/theme_block.dart';
import 'package:wonder_words/core/utils/utils.dart';
import 'package:wonder_words/features/auth/presentation/widgets/auth_button.dart';
import 'package:wonder_words/features/profile/presentation/bloc/user_bloc.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserBloc>(context).add(GetUser());
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeMode = context.read<ThemeBloc>().currentThemeMode;

    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        if (state is UserSuccess) {
          final user = state.userInfo;
          return Column(
            children: [
              SizedBox(
                height: 230,
                child: Stack(
                  children: [
                    SizedBox(
                      height: 180,
                      width: double.infinity,
                      child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl:
                              "https://cdn.motor1.com/images/mgl/9mN1A0/306:1918:3672:2754/2024-land-rover-range-rover-sv-carmel-edition.webp"),
                    ),
                    Positioned(
                        top: 100,
                        left: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 60,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child:
                                CachedNetworkImage(imageUrl: user.picUrl ?? ""),
                          ),
                        ))
                  ],
                ),
              ),
              Text(
                capitalizeFirstLetter(user.username!),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(user.accountDetails?.email ?? "--"),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).primaryColor, width: 2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${user.following}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                            width: 5), // Space between count and the word
                        const Text(
                          'Following',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).primaryColor, width: 2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${user.followers}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                            width: 5), // Space between count and the word
                        const Text(
                          'Followers',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Theme Prefrences",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RadioListTile<ThemeData>(
                    title: const Text('Light Theme'),
                    value: ThemeData.light(),
                    groupValue: themeMode,
                    onChanged: (ThemeData? value) {
                      setState(() {
                        themeMode = value!;
                      });
                      context.read<ThemeBloc>().add(SelectedLightTheme());
                    },
                  ),
                  const Divider(),
                  RadioListTile<ThemeData>(
                    title: const Text('Dark Theme'),
                    value: ThemeData.dark(),
                    groupValue: themeMode,
                    onChanged: (ThemeData? value) {
                      setState(() {
                        themeMode = value!;
                      });
                      context.read<ThemeBloc>().add(SelectedDarkTheme());
                    },
                  ),
                  const Divider(),
                  RadioListTile<String>(
                    title: const Text('Use system settings'),
                    value: "ThemeData()",
                    groupValue: "",
                    onChanged: (String? value) {
                      // setState(() {
                      //   themeMode = value!;
                      // });
                    },
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: AuthButton(
                    onClick: () {}, label: "Sign out", icon: Icons.logout),
              )
            ],
          );
        } else if (state is UserError) {
          return Center(
            child: Text(state.err),
          );
        }
        return Center(
          child: SpinKitDoubleBounce(
            color: Theme.of(context).primaryColor,
          ),
        );
      }),
    );
  }
}
