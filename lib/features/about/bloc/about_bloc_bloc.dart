import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'about_bloc_event.dart';
part 'about_bloc_state.dart';

class AboutBlocBloc extends Bloc<AboutBlocEvent, AboutBlocState> {
  AboutBlocBloc() : super(AboutBlocInitial()) {
    on<AboutBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
