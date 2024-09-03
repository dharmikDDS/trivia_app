import 'package:bloc_clean_tdd_demo/core/app/text_styles.dart';
import 'package:bloc_clean_tdd_demo/core/presentation/app_scaffold.dart';
import 'package:bloc_clean_tdd_demo/features/history/presentation/blocs/history_bloc.dart';
import 'package:bloc_clean_tdd_demo/features/history/presentation/blocs/history_events.dart';
import 'package:bloc_clean_tdd_demo/features/history/presentation/blocs/history_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      GetIt.I<HistoryBloc>().add(FetchHistoriesEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: BlocBuilder(
        bloc: GetIt.I<HistoryBloc>(),
        builder: (context, state) {
          if (state is LoadingHistoriesState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is FailureHistoriesState) {
            return Center(
              child: Text(state.err),
            );
          }

          if (state is SuccessHistoriesState) {
            return (state.trivias.isEmpty)
                ? const Center(
                    child: Text('Not saved any trivias.'),
                  )
                : ListView.builder(
                    itemCount: state.trivias.length,
                    itemBuilder: (context, triviaIndex) {
                      return ListTile(
                        isThreeLine: true,
                        title: Text(
                          state.trivias[triviaIndex].number.toString(),
                          style: textStyle18SemiBold,
                        ),
                        subtitle: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Text(
                            state.trivias[triviaIndex].trivias[index],
                            style: textStyle16,
                          ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 5),
                          itemCount: state.trivias[triviaIndex].trivias.length,
                        ),
                      );
                    },
                  );
          }

          return Container();
        },
      ),
    );
  }
}
