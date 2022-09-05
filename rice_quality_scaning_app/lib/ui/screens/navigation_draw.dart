import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rice_quality_scanning/cubit/auth_cubit.dart';
import 'package:rice_quality_scanning/ui/screens/theme.dart';

class NavigationDrew extends StatelessWidget {
  const NavigationDrew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AuthSuccess) {
              return SafeArea(
                child: Column(
                  children: [
                    Container(
                      height: 110,
                      width: 110,
                      margin: const EdgeInsets.only(top: 10, bottom: 20),
                      decoration: const BoxDecoration(
                        color: kprimeColor,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/profile.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      state.user.name.toLowerCase(),
                      style: greenStyle.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      state.user.email,
                      style: greenStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return SafeArea(
                child: Column(
                  children: [
                    Container(
                      height: 110,
                      width: 110,
                      margin: const EdgeInsets.only(top: 10, bottom: 20),
                      decoration: const BoxDecoration(
                        color: kprimeColor,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/profile.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      'Munawar'.toLowerCase(),
                      style: greenStyle.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'mun@gmail.com',
                      style: greenStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
