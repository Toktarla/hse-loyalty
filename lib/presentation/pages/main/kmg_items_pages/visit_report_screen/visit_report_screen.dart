import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hsg_loyalty/injection_container.dart';
import 'package:hsg_loyalty/presentation/blocs/profile/profile_bloc.dart';
import 'package:hsg_loyalty/presentation/widgets/text_button_widget.dart';
import 'package:hsg_loyalty/presentation/widgets/visit_report_card.dart';
import 'package:hsg_loyalty/utils/constants/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsg_loyalty/utils/helpers/ModalHelper.dart';
import 'package:hsg_loyalty/utils/helpers/snackbar_helper.dart';
import 'package:hsg_loyalty/utils/mixins/date_time_mixin.dart';
import '../../../../blocs/departure-report/departure_report_bloc.dart';
import '../../../../blocs/departure-report/departure_report_event.dart';
import '../../../../blocs/departure-report/departure_report_state.dart';


class VisitReportScreen extends StatelessWidget with DateTimeMixin {
  const VisitReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return BlocProvider<DepartureReportBloc>(
      create: (_) => sl()..add(GetDepartureReportForUserEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Отчет'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Отчет о визите',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const SizedBox(height: 15),
                Center(
                  child: TextButtonWidget(
                    textColor: Colors.white,
                    width: width / 2,
                    height: 30.h,
                    text: '+ Добавить отчет',
                    onPressed: () {
                      context.push("/visitReportScreen/addReportScreen");
                    },
                    color: AppColors.color_quest_special,
                  ),
                ),
                const SizedBox(height: 30),
                _buildCurrentProcess(context, width),
                const SizedBox(height: 30),
                Center(
                  child: Text(
                    'Мои отчеты',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                _buildReportsList(context, width, height),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentProcess(BuildContext context, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Текущий процесс',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.color_quest_special,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('До просрочки осталось: ${'9 дней'}'),
                  const SizedBox(height: 10),
                  Container(
                    width: width * 0.6,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.color_quest_special.withOpacity(0.3),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: const LinearProgressIndicator(
                        value: 0.5,
                        backgroundColor: Colors.transparent,
                        valueColor: AlwaysStoppedAnimation<Color>(AppColors.color_quest_special),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text('Исполнено за месяц: 0/1',
              style: Theme.of(context).textTheme.displayMedium!.copyWith(fontStyle: FontStyle.italic)),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text('Просрочено за год: 10/11',
              style: Theme.of(context).textTheme.displayMedium!.copyWith(fontStyle: FontStyle.italic)),
        ),
      ],
    );
  }

  Widget _buildReportsList(BuildContext context, double width, double height) {
    return BlocConsumer<DepartureReportBloc, DepartureReportState>(
      listener: (context, state) {
        if (state is DepartureReportDeleted) {
          SnackBarHelper.showSuccessSnackbar(message: "Отчет был удален успешно");
          BlocProvider.of<DepartureReportBloc>(context).add(GetDepartureReportForUserEvent());
        }
      },
      builder: (context, state) {
        if (state is DepartureReportLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is DepartureReportError) {
          return const Center(child: Text('Ошибка при загрузке отчетов'));
        }
        if (state is DepartureReportDone) {
          final reports = state.departureReportAnswerEntity?.data ?? [];
          print(reports);
          if (reports.isEmpty) {
            return const Center(child: Text('Нет отчетов'));
          }

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: reports.length,
            itemBuilder: (context, index) {
              final report = reports[index];
              print(formatTimestamp(report.departureDate ?? ""));

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: VisitReportCard(
                  height: height / 6,
                  width: width,
                  title: report.authorFullName ?? "",
                  company: report.companyName ?? "",
                  date: formatTimestamp(report.departureDate ?? ""),
                  onTap: () {
                        ModalHelper.showDetailBottomSheetForDepartureReport(context, context.read<ProfileBloc>().state.profileEntity?.id ?? -1);
                  },
                  onDelete: () {
                    BlocProvider.of<DepartureReportBloc>(context).add(DeleteDepartureReportEvent(report.id ?? -1));
                  },
                ),
              );
            },
          );
        }
        return const Center(child: Text('Нет данных'));
      },
    );
  }
}
