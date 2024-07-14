import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hsg_loyalty/data/model/vitalrules/creation_page_model.dart';
import 'package:hsg_loyalty/data/model/vitalrules/user_answers_dto_model.dart';
import 'package:hsg_loyalty/data/model/vitalrules/vital_rule_form_model.dart';
import 'package:hsg_loyalty/domain/entity/vitalrule/creation_page_entity.dart';
import 'package:hsg_loyalty/utils/constants/constants.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import '../../../model/create/isSuccessResponse.dart';
part 'vital_rules_api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class VitalRulesApi {
  factory VitalRulesApi(Dio dio) = _VitalRulesApi;

  @PUT("vital-rules-questionnaire/create-or-edit-answer?IsMobile=true")
  Future<HttpResponse<IsSuccessResponse>> saveVitalRuleForm(@Body() UserAnswersDtoModel requestBody,@Header("Cookie") String cookie);

  @DELETE("vital-rules-questionnaire/delete-answer?IsMobile=true") 
  Future<HttpResponse<IsSuccessResponse>> deleteVitalRuleForm(@Query("formId") int formId,@Header("Cookie") String cookie);
  
  @GET("vital-rules-questionnaire/index?IsMobile=true")
  Future<HttpResponse<VitalRuleFormModel>> getVitalRuleFormList(@Header("Cookie") String cookie,@Query('getAll') bool getAll);

  @GET("vital-rules-questionnaire/show-answer/{formId}?isMobile=true&withoutSaving=true")
  Future<HttpResponse<UserAnswersDtoModel>> getVitalRuleForm(@Header("Cookie") String cookie, @Path("formId") int formId);

  @GET("vital-rules-questionnaire/creationPage?isMobile=true")
  Future<HttpResponse<CreationPageModel>> getVitalRuleCreationPage(@Header("Cookie") String cookie);

}
