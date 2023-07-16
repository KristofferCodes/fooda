import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../products/models/post_data_ui_model.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBlocBloc() : super(HomeBlocInitial()) {
    on<HomeBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
