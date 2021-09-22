import 'package:bloc/bloc.dart';
import 'package:cenafood/ui/screens/user/notification.dart';
import 'package:cenafood/ui/screens/user/profile.dart';

enum DrawerEvents { ProfileEvent, NotificationEvent }

abstract class DrawerStates {}

class DrawerBloc extends Bloc<DrawerEvents, DrawerStates> {
  DrawerBloc(DrawerStates initialState) : super(initialState);

  DrawerStates get initialState => UserProfileScreen();

  @override
  Stream<DrawerStates> mapEventToState(DrawerEvents event) async* {
    switch (event) {
      case DrawerEvents.ProfileEvent:
        yield UserProfileScreen();
        break;
      case DrawerEvents.NotificationEvent:
        yield NotificationScreen();
        break;
    }
  }
}
