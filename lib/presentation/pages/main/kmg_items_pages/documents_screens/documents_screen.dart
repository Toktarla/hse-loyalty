import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hsg_loyalty/presentation/blocs/module/mobile_module_bloc.dart';
import 'package:hsg_loyalty/presentation/blocs/module/mobile_module_state.dart';
import 'package:hsg_loyalty/presentation/widgets/document_item_widget.dart';


class DocumentsScreen extends StatelessWidget {
  final int? mobileModuleId;


  const DocumentsScreen({super.key, this.mobileModuleId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Документы'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<MobileModuleBloc, MobileModuleState>(
          builder: (context, state) {
            if (state is MobileModuleLoading) {
              return const Center(child: CircularProgressIndicator(),);
            }
            if (state is MobileModuleError) {
              return const Center(child: Text("Что то пошло не так!"),);
            }
            if (state is MobileModulesDone) {
              final mobileModuleList = state.mobileModuleEntityList
              !.where((element) => element.parentId == mobileModuleId).toList();

              return ListView(
                physics: const ClampingScrollPhysics(),
                children: List.generate(
                  (mobileModuleList.length / 3).ceil(), 
                  (rowIndex) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: IntrinsicHeight(
                      child: Row(
                        children: List.generate(
                          3, 
                          (colIndex) {
                            final int index = 3*rowIndex+colIndex;
                            if(index < mobileModuleList.length){
                            
                              final Map<String, dynamic> videoData = {
                                "appBarTitle": mobileModuleList[index].name!,
                                "mediaModuleId": mobileModuleList[index].id
                              };
                              
                              return Expanded(
                                child: DocumentItem(
                                  text: mobileModuleList[index].name!,
                                  onTap: () { 
                                    context.push('/documentsScreen/documentsShowScreen', extra: videoData);
                                  },
                                  heightBetweenImageAndText: 7.h,
                                  textFontSize: ScreenUtil().setSp(12),
                                  )
                                );
                            } else {
                              return const Spacer();
                            }
                          }
                        )
                      )
                    )
                  )
                )
              ); 
            }
            return Container();
          },
        ),
      ),
    );
  }
}
