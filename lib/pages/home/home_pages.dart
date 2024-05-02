import 'package:feriados/pages/home/home_cubit.dart';
import 'package:feriados/pages/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeCubit cubit;
  @override
  void initState() {
    cubit = GetIt.instance<HomeCubit>();
    cubit.getFeriados();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: cubit,
        builder: (context, state) {
          if (state is LoadingHome) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedHome) {
            return ListView.builder(
              itemCount: state.feriados.length,
              itemBuilder: (context, index) {
                final feriado = state.feriados[index];
                return ListTile(
                  title: Text(feriado.name!),
                );
              },
            );
          } else if (state is FailureHome) {
            return Center(
              child: Text('Erro ao carregar feriados: ${state.message}'),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
