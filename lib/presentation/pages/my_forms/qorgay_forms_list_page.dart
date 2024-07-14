import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hsg_loyalty/utils/mixins/date_time_mixin.dart';
import '../../../domain/entity/create/observation_type_entity.dart';
import '../../../domain/entity/list/qorgay_entity.dart';
import '../../../injection_container.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/ModalHelper.dart';
import '../../blocs/profile/profile_bloc.dart';
import '../../blocs/profile/profile_state.dart';
import '../../blocs/qorgay/qorgay_bloc.dart';
import '../../blocs/qorgay/qorgay_event.dart';
import '../../blocs/qorgay/qorgay_state.dart';

class QorgayFormsListPage extends StatefulWidget with DateTimeMixin {
  const QorgayFormsListPage({Key? key}) : super(key: key);

  @override
  _QorgayFormsListPageState createState() => _QorgayFormsListPageState();
}

class _QorgayFormsListPageState extends State<QorgayFormsListPage> {
  String _selectedOption = 'Выбрать';
  final List<String> _dropdownOptions = ['Выбрать', 'Мои', 'Все'];

  Future<void> _refresh(BuildContext context) async {
    if (_selectedOption == 'Мои') {
      final profileState = context.read<ProfileBloc>().state;
      final userId = profileState is ProfileDone ? profileState.profileEntity?.id ?? -1 : -1;
      context.read<QorgayBloc>().add(GetQorgausByUseridEvent(userId));
    } else if (_selectedOption == 'Все') {
      context.read<QorgayBloc>().add(GetQorgausByPhoneIdEvent());
    }
  }

  void _onOptionSelected(String? value) {
    setState(() {
      _selectedOption = value!;
      if (_selectedOption != 'Выбрать') {
        _refresh(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          DropdownButton<String>(
            value: _selectedOption,
            items: _dropdownOptions.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: _onOptionSelected,
          ),
        ],
      ),
      body: BlocBuilder<QorgayBloc, QorgayState>(
        builder: (context, state) {
          if (state is QorgayLoading) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Подождите пару секунд"),
                  CircularProgressIndicator(),
                ],
              ),
            );
          }
          if (state is QorgayError) {
            return const Center(child: Text("Что-то пошло не так!"));
          }
          if (state is QorgaysForUserIdDone || state is QorgayDone) {
            List<QorgayEntity>? qorgayList;
            List<ObservationTypeEntity>? observationTypes;

            if (state is QorgaysForUserIdDone) {
              qorgayList = state.qorgayEntityList;
              observationTypes = state.observationTypeEntityList;
            } else if (state is QorgayDone) {
              qorgayList = state.qorgayEntityList;
              observationTypes = state.observationTypeEntityList;
            }

            if (qorgayList == null || qorgayList.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Нет добавленных элементов",
                      style: TextStyle(
                          color: AppColors.gray,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: AppColors.gray.withOpacity(0.4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {
                        context.go("/createPage");
                      },
                      child: FittedBox(
                        child: Text(
                          'ДОБАВИТЬ',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

            qorgayList.sort((a, b) => b.id!.compareTo(a.id as num));

            return RefreshIndicator(
              onRefresh: () => _refresh(context),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const Divider(
                      height: 8,
                      color: Colors.black,
                    );
                  },
                  itemCount: qorgayList.length,
                  itemBuilder: (context, index) {
                    final qorgay = qorgayList![index];
                    final observationType = observationTypes?.firstWhere(
                          (type) => type.id == qorgay.dictKorgauObservationTypeId,
                    );

                    return GestureDetector(
                      onTap: () {
                        ModalHelper.showDetailBottomSheetForQorgay(context, qorgay);
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 35,
                              child: Text(
                                qorgay.id.toString(),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text(observationType?.name ?? "Неизвестно",
                                style: Theme.of(context).textTheme.titleMedium),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(
                                Icons.access_time,
                                color: AppColors.gray,
                              ),
                              onPressed: () {},
                              tooltip: widget.formatTimestamp(qorgay.incidentDatetime!),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
