import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pronet_storeroom_v_01/common/pages/error_page.dart';
import 'package:pronet_storeroom_v_01/features/auth/bloc/auth_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/building/bloc/building_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/building/repo/building_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/building/repo/models/building.dart';
import 'package:pronet_storeroom_v_01/features/settings/building/widgets/building_create_form.dart';

class BuildingDetailPage extends StatefulWidget {
  const BuildingDetailPage({super.key, required this.id});

  final int id;

  @override
  State<BuildingDetailPage> createState() => _BuildingDetailPageState();
}

class _BuildingDetailPageState extends State<BuildingDetailPage> {
  final _buildingBloc = BuildingBloc(
    GetIt.I<BuildingRepo>(),
  );
  final authBloc = GetIt.I<AuthBloc>();

  @override
  void initState() {
    _buildingBloc.add(LoadBuildingDetailEvent(id: widget.id));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant BuildingDetailPage oldWidget) {
    _buildingBloc.add(LoadBuildingDetailEvent(id: widget.id));
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool isAdmin = false;
    if (authBloc.state is AuthSuccessedState) {
      final authState = (authBloc.state as AuthSuccessedState);
      isAdmin = authState.user.is_staff;
    }

    return BlocBuilder<BuildingBloc, BuildingState>(
      bloc: _buildingBloc,
      builder: (context, state) {
        if (state is BuildingLoadingFailureState) {
          return ErrorPage(errorMessage: state.exception.toString());
        }
        if (state is BuildingDetailLoadedState) {
          if (state.building != null) {
            Building building = state.building!;

            return Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => context.go(
                            '/settings/building'), // Go back to the previous screen
                        icon: const Icon(Icons.arrow_back),
                        tooltip: 'Назад',
                      ),
                    ],
                  ),
                  Text(building.name.toString(),
                      style: theme.textTheme.headlineLarge),
                  Text(building.description.toString(),
                      style: Theme.of(context).textTheme.headlineSmall),
                  if (isAdmin) ...[
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) =>
                                BuildingCreateFormWidget(
                              building: building,
                              bloc: _buildingBloc,
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.primaryColor,
                          side: BorderSide.none,
                        ),
                        child: const Text('Редактировать'),
                      ),
                    ),
                  ],
                  const SizedBox(height: 30),
                  const Divider(),
                ],
              ),
            );
          }
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
