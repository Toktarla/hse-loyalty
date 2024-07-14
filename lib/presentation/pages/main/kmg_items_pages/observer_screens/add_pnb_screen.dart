import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsg_loyalty/domain/entity/pnb/pnbwork/place_entity.dart';
import 'package:hsg_loyalty/domain/entity/pnb/pnbwork/pnb_work_observation_form_entity.dart';
import 'package:hsg_loyalty/injection_container.dart';
import 'package:hsg_loyalty/presentation/blocs/place/place_bloc.dart';
import 'package:hsg_loyalty/presentation/blocs/place/place_event.dart';
import 'package:hsg_loyalty/presentation/blocs/place/place_state.dart';
import 'package:hsg_loyalty/presentation/blocs/profile/profile_bloc.dart';
import 'package:hsg_loyalty/presentation/blocs/profile/profile_state.dart';
import 'package:hsg_loyalty/presentation/cubits/pnb_observation_cubit.dart';
import 'package:hsg_loyalty/presentation/pages/create/input_widgets/input_textfield_widget.dart';
import 'package:hsg_loyalty/presentation/pages/create/input_widgets/pick_datatime_widget.dart';
import 'package:hsg_loyalty/presentation/pages/create/input_widgets/pick_departament_widget.dart';
import 'package:hsg_loyalty/presentation/pages/create/input_widgets/pick_observated_company_object_widget.dart';
import 'package:hsg_loyalty/presentation/pages/create/input_widgets/pick_organization_widget.dart';
import 'package:hsg_loyalty/presentation/pages/main/pick_list_from_dialog.dart';
import 'package:intl/intl.dart';


class AddPnbScreen extends StatefulWidget {
  const AddPnbScreen({super.key});

  @override
  State<AddPnbScreen> createState() => _AddPnbScreenState();
}

class _AddPnbScreenState extends State<AddPnbScreen> {

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _fioController = TextEditingController();
  final TextEditingController contractorController = TextEditingController();
  final TextEditingController supervisedObjectController = TextEditingController();
  final TextEditingController _kolichestvoUchastnikovController = TextEditingController();
  final TextEditingController _obsuzhdennyeVoprosyController = TextEditingController();
  final TextEditingController _prinyatyeResheniyaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Наблюдение работ'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 25,),
                BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    return TextFieldInputPage(
                      isLoggedIn: state is ProfileDone,
                      authorId: state.profileEntity?.id ?? -1,
                      prefilledText: state.profileEntity?.fullName ?? "ФИО",
                      hintText: 'Напишите ФИО',
                      textController: _fioController,
                    );
                  },
                ),
                const SizedBox(height: 25,),
                PickOrganizationWidget(
                  hintText: 'Организация',
                  isReadOnly: false,
                  prefilledText: "Организация",
                  contractorController: contractorController,
                  changeState: ({String? organizationName, int? organizationId}) {
                    // BlocProvider.of<CreateQorgayCubit>(context).updateInput(CreateQorgayEntity(
                    //     organizationId: organizationId
                    // ));
                    // BlocProvider.of<QorgayBloc>(context).add(GetOrgDepartmentsEvent(organizationId));
                  },
                ),
                const SizedBox(height: 25,),
                BlocBuilder<PnbObservationCubit, PnbWorkObservationFormEntity>(
                  builder: (context, state) {
                    final orgId = state.organizationId;
                    if (orgId != null) {
                      return PickDepartamentWidget(
                        orgId: orgId,
                        changeState: ({String? departamentName, int? departamentId}) {
                          BlocProvider.of<PnbObservationCubit>(context).updateInput(PnbWorkObservationFormEntity(
                              organizationDepartmentId: departamentId
                          ));
                        },
                      );
                    }
                    return PickDepartamentWidget(
                      orgId: null,
                      changeState: ({String? departamentName, int? departamentId}) {
                        BlocProvider.of<PnbObservationCubit>(context).updateInput(PnbWorkObservationFormEntity(
                            organizationDepartmentId: departamentId
                        ));
                      },
                    );
                  },
                ),
                const SizedBox(height: 25,),
                PickDateTimeWidget(
                  changeState: ({String? incidentDateTime, String? date, String? time}) {
                    BlocProvider.of<PnbObservationCubit>(context).updateInput(
                        PnbWorkObservationFormEntity(
                      date: date,
                      time: time
                    )
                    );
                  },

                ),
                const SizedBox(height: 25,),
                TextField(
                    controller: _kolichestvoUchastnikovController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      // int? peopleCount = int.tryParse(value);
                      // if (peopleCount != null) {
                      //   BlocProvider.of<AddReportEntityCubit>(context).updateInput(
                      //     DepartureReportEntity(
                      //       peopleCount: peopleCount,
                      //     ),
                      //   );
                      // }
                    }),
                const SizedBox(height: 25,),
                PickObservatedCompanyObjectWidget(
                    contractorController: supervisedObjectController,
                    showObjectTextField: false,
                    changeState: ({String? supervisedObject, int? supervisedOrganizationId}) {
                      BlocProvider.of<PnbObservationCubit>(context).updateInput(PnbWorkObservationFormEntity(
                          organizationId: supervisedOrganizationId,
                      ));
                    },
                ),
                const SizedBox(height: 25,),

                // Place
            BlocProvider<PlaceBloc>(
              create: (context) => sl()..add(const GetPlacesEvent()),
              child: BlocBuilder<PlaceBloc, PlaceState>(
                builder: (context, state) {
                  if (state is PlaceLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is PlaceError) {
                    return const Center(
                      child: Text("Что-то пошло не так!"),
                    );
                  }

                  if (state is PlacesDone) {
                    return PickDataListFromDialog<PlaceEntity>(
                      changeState: ({dynamic firstArgument, dynamic secondArgument}) {
                        // Handle state change
                      },
                      listData: state.placeEntityList ?? [],
                      showSecondTextField: false,
                      firstTextFieldHintText: "Места",
                      getItemName: (PlaceEntity entity) => entity.nameRu ?? "", // Extract the name
                    );
                  }
                  return Container();
                },
              ),
            )




            ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _fioController.dispose();
    _dateController.dispose();
    _kolichestvoUchastnikovController.dispose();
    _obsuzhdennyeVoprosyController.dispose();
    _prinyatyeResheniyaController.dispose();
  }
}
