import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hsg_loyalty/injection_container.dart';
import 'package:hsg_loyalty/presentation/blocs/pnb/pnb-work/pnb_work_bloc.dart';
import 'package:hsg_loyalty/presentation/blocs/pnb/pnb-work/pnb_work_event.dart';
import 'package:hsg_loyalty/presentation/blocs/pnb/pnb-work/pnb_work_state.dart';
import 'package:hsg_loyalty/presentation/widgets/text_button_widget.dart';
import 'package:hsg_loyalty/utils/constants/colors.dart';
import 'package:hsg_loyalty/utils/helpers/snackbar_helper.dart';
import '../../../../../domain/entity/pnb/pnbwork/pnb_work_observation_entity.dart';
import 'package:hsg_loyalty/utils/mixins/date_time_mixin.dart';


class PnbWorkScreen extends StatelessWidget with DateTimeMixin {
  const PnbWorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PnbWorkBloc>(
      create: (context) => sl()..add(const GetPnbWorkListEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Наблюдение работ'),
        ),
        body: BlocConsumer<PnbWorkBloc, PnbWorkState>(
          listener: (context, state) {
            if (state is DeletePnbWorkDone) {
              SnackBarHelper.showSuccessSnackbar(message: "Форма удалена");
              BlocProvider.of<PnbWorkBloc>(context)
                  .add(const GetPnbWorkListEvent());
            }
          },
          builder: (context, state) {
            if (state is PnbWorkLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PnbWorkError) {
              return const Center(child: Text('Что-то пошло не так',style: TextStyle(color: Colors.red),));
            } else if (state is PnbWorkDone) {
              return _buildListView(context, state.pnbWorkList!);
            }
            return const Center(child: Text('Что-то пошло не так!!!'));
          },
        ),
      ),
    );
  }

  Widget _buildListView(BuildContext context, List<PnbWorkObservationEntity> pnbWorkList) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButtonWidget(
            width: MediaQuery.of(context).size.width / 1.5,
            height: MediaQuery.of(context).size.height / 12,
            text: "Создать наблюдение",
            onPressed: () {
              context.push("/observerScreen/pnbWorkScreen/addPnbScreen");
            },
            color: AppColors.mainColor,
            textColor: Colors.white,
          ),
        ),
        const SizedBox(height: 20,),
        Expanded(
          child: ListView.builder(
            itemCount: pnbWorkList.length,
              itemBuilder: (context, index) {
                final work = pnbWorkList[index];
                return Card(
                  color: Colors.white,
                  elevation: 5,
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                work.organizationName,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Department: ${work.organizationDepartmentName}',
                                style: const TextStyle(fontSize: 16),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Author: ${work.authorFullname}',
                                style: const TextStyle(fontSize: 16),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Task: ${work.task}',
                                style: const TextStyle(fontSize: 16),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Date: ${formatTimestamp(work.dateCard)}',
                                style: const TextStyle(fontSize: 16),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'ID: ${work.id}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                              },
                            ),
                            const SizedBox(width: 8),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                context.read<PnbWorkBloc>().add(DeletePnbWorkEvent(work.id));
                              },

                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
        )
      ],
    );
  }
}

