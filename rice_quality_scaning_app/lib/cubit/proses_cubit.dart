// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:meta/meta.dart';
// import 'package:rice_quality_scanning/model/proses_model.dart';
// import 'package:rice_quality_scanning/services/proses_service.dart';
// part 'proses_state.dart';

// class ProsesCubit extends Cubit<ProsesState> {
//   ProsesCubit() : super(ProsesInitial());

//   void fetchDestination() async {
//     try {
//       emit(ProsesLoading());

//       List<ProsesModel> destinations = await ProsesService().fetchProses();

//       emit(ProsesSuccess(destinations));
//     } catch (e) {
//       emit(
//         ProsesFailed(
//           e.toString(),
//         ),
//       );
//     }
//   }
// }
