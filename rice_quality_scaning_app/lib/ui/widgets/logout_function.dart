import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:rice_quality_scanning/cubit/auth_cubit.dart';
import 'package:rice_quality_scanning/ui/screens/theme.dart';

class ButtonLogOut extends StatelessWidget {
  const ButtonLogOut({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<AuthCubit>().signOut();
      },
      child: Container(
        height: 45,
        width: 120,
        margin: const EdgeInsets.only(
          bottom: 10,
        ),
        decoration: BoxDecoration(
          color: kprimeColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.error),
                ),
              );
            } else if (state is AuthInitial) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/signIn-page', (route) => false);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: kWhiteColor,
                ),
              );
            }
            return Center(
              child: Text(
                'logout',
                style: whiteStyle.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
