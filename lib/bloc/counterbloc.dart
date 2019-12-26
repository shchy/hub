import 'package:bloc/bloc.dart';


abstract class CounterBlocInterface extends Bloc<CounterEvent, int>{
}

enum CounterEvent { increment, decrement }

class CounterBloc extends CounterBlocInterface {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.decrement:
        yield state - 1;
        break;
      case CounterEvent.increment:
        yield state + 1;
        break;
    }
  }
}