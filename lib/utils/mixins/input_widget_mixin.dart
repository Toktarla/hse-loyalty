import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsg_loyalty/domain/entity/create/create_qorgay_entity.dart';
import 'package:hsg_loyalty/presentation/blocs/profile/profile_state.dart';
import 'package:hsg_loyalty/presentation/blocs/qorgay/qorgay_bloc.dart';
import 'package:hsg_loyalty/presentation/blocs/qorgay/qorgay_event.dart';
import 'package:hsg_loyalty/presentation/cubits/create_qorgay_cubit.dart';
import 'package:hsg_loyalty/presentation/pages/create/input_widgets/pick_observation_type_widget.dart';
import '../../../injection_container.dart';
import '../../presentation/blocs/profile/profile_bloc.dart';
import '../../presentation/pages/create/input_widgets/pick_observation_category_widget.dart';
import '../../presentation/pages/create/input_widgets/pick_datatime_widget.dart';
import '../../presentation/pages/create/input_widgets/pick_organization_widget.dart';
import '../../presentation/pages/create/input_widgets/pick_files_widget.dart';
import '../../presentation/pages/create/input_widgets/pick_departament_widget.dart';
import '../../presentation/pages/create/input_widgets/pick_observated_company_object_widget.dart';
import '../../presentation/pages/create/input_widgets/input_textfield_widget.dart';
import '../../presentation/pages/create/input_widgets/pick_two_variant_widget.dart';

mixin InputWidgetMixin {
  Widget createInputWidget(
      int index, {
        required BuildContext context,
        required TextEditingController observationTypeController,
        required TextEditingController fioController,
        required TextEditingController contractorController,
        required TextEditingController supervisedObjectController,
        required TextEditingController phoneNumberController,
        required TextEditingController case8Controller,
        required TextEditingController case10Controller,
        required TextEditingController case11Controller,
        required TextEditingController case12Controller,
        required TextEditingController case15Controller,
        required FocusNode fioFocusNode,
        required FocusNode case9FocusNode,
        required FocusNode case11FocusNode,
        required FocusNode case12FocusNode,
        required FocusNode case13FocusNode,
        required FocusNode case16FocusNode
      }) {
    switch (index) {
      // Тип Наблюдения
      case 0:
        return PickObservationTypeWidget(typeController: observationTypeController);
      // Ваш ФИО
      case 1:
        return BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return TextFieldInputPage(
              focusNode: fioFocusNode,
              isLoggedIn: state is ProfileDone,
              authorId: state.profileEntity?.id ?? -1,
              prefilledText: state.profileEntity?.fullName ?? "ФИО",
              hintText: 'Напишите ФИО',
              textController: fioController,
            );
          },
        );
      // Дата и время
      case 2:
        return PickDateTimeWidget(
          changeState: ({String? incidentDateTime,String? date, String? time}) {
            BlocProvider.of<CreateQorgayCubit>(context).updateInput(CreateQorgayEntity(
              incidentDateTime: incidentDateTime,
            ));
          },
        );
      // Организация/подрядчик
      case 3:
        return PickOrganizationWidget(
            hintText: 'Организация',
            isReadOnly: false,
            prefilledText: "Организация",
            contractorController: contractorController,
            changeState: ({String? organizationName, int? organizationId}) {
              BlocProvider.of<CreateQorgayCubit>(context).updateInput(CreateQorgayEntity(
                  organizationId: organizationId
              ));
              BlocProvider.of<QorgayBloc>(context).add(GetOrgDepartmentsEvent(organizationId));
            },
        );
      // Структурное подразделение
      case 4:
        return BlocBuilder<CreateQorgayCubit, CreateQorgayEntity>(
          builder: (context, state) {
            final orgId = state.organizationId;
            if (orgId != null) {
              return PickDepartamentWidget(
                  orgId: orgId,
                  changeState: ({String? departamentName, int? departamentId}) {
                    BlocProvider.of<CreateQorgayCubit>(context).updateInput(CreateQorgayEntity(
                        organizationDepartmentId: departamentId
                    ));
                  },
              );
            }
            return PickDepartamentWidget(
                orgId: null,
                changeState: ({String? departamentName, int? departamentId}) {
                    BlocProvider.of<CreateQorgayCubit>(context).updateInput(CreateQorgayEntity(
                        organizationDepartmentId: departamentId
                    ));
                },
            );
          },
        );
      case 5:
        return PickObservatedCompanyObjectWidget(
            contractorController: supervisedObjectController,
            changeState: ({String? supervisedObject, int? supervisedOrganizationId}) {
              BlocProvider.of<CreateQorgayCubit>(context).updateInput(CreateQorgayEntity(
                  supervisedOrganizationId: supervisedOrganizationId,
                  supervisedObject: supervisedObject ?? ""
              ));
            },
        );
      case 6:
        return const PickObservationCategoryWidget();
      case 7:
        return TextFieldInputPage(

          focusNode: case9FocusNode,
          hintText: 'Опишите ваше наблюдение/предложение',
          isLoggedIn: false,
          textController: case8Controller,
        );
      case 8:
        return PickFilesWidget();
      case 9:
        return TextFieldInputPage(
          focusNode: case11FocusNode,

          hintText: '',
          textController: case10Controller,
          isLoggedIn: false,
        );
      case 10:
        return TextFieldInputPage(
          focusNode: case12FocusNode,

          hintText: '',
          textController: case11Controller,
          prefilledText: 'Какие меры вы предприняли',
          isLoggedIn: false,
        );
      case 11:
        return TextFieldInputPage(
          focusNode: case13FocusNode,

          hintText: "",
          textController: case12Controller,
          isLoggedIn: false,
        );
      case 12:
        return PickTwoVariantPage(fieldToUpdate: 'isDiscussed');
      case 13:
        return PickTwoVariantPage(fieldToUpdate: 'isInformed');
      case 14:
        return TextFieldInputPage(
          focusNode: case16FocusNode,
          hintText: "",
          textController: case15Controller,
          isLoggedIn: false,
        );
      case 15:
        return PickTwoVariantPage(fieldToUpdate: 'isEliminated');
      default:
        return const Placeholder();
    }
  }
}

