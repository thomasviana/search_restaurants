import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'status.dart';

abstract class MyState {
  final Status status;

  const MyState({
    this.status = Status.initial,
  });
}

class Observer<B extends StateStreamable<S>, S extends MyState>
    extends StatelessWidget {
  final StateStreamable<S>? bloc;
  @required
  final Widget Function(BuildContext context, S state) onSuccess;

  final Widget Function(BuildContext context, S state)? onFailure;

  const Observer({
    Key? key,
    this.bloc,
    required this.onSuccess,
    this.onFailure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StateStreamable<S>, S>(
      bloc: bloc ?? context.read<B>(),
      builder: (context, state) {
        switch (state.status) {
          case Status.initial:
            return const SizedBox();
          case Status.loading:
            return SizedBox(
              height: MediaQuery.of(context).size.height / 1.3,
              child: const Center(
                child: CupertinoActivityIndicator(),
              ),
            );
          case Status.success:
            return onSuccess(context, state);
          case Status.failure:
            if (onFailure == null) {
              return SizedBox(
                height: MediaQuery.of(context).size.height / 1.3,
                child: const Center(child: Text('Error')),
              );
            } else {
              return onFailure!(context, state);
            }
          default:
            return const SizedBox();
        }
      },
    );
  }
}
