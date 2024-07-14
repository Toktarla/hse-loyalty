import 'package:dio/dio.dart';
import 'package:hsg_loyalty/utils/constants/constants.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/dio.dart';
import '../../../model/create/isSuccessResponse.dart';
import '../../../model/questionnaires/questionnaire_form_model.dart';
import '../../../model/questionnaires/questionnaire_model.dart';
part 'questionnaire_api.g.dart';

@RestApi(baseUrl: baseUrl)

abstract class QuestionnaireApi {
  factory QuestionnaireApi(Dio dio) = _QuestionnaireApi;

  @GET("questionnaire/list")
  Future<HttpResponse<QuestionnaireModel>> getQuestionnaires(
      @Query("page") String page,
  );

  @GET("questionnaire/get/{id}")
  Future<HttpResponse<QuestionnaireFormModel>> getQuestionnaireById(
      @Path("id") String id,
      );

  @POST("questionnaire/save-answer")
  Future<HttpResponse<IsSuccessResponse>> saveQuestionnaireAnswer(
      @Body() QuestionnaireFormModel questionnaireFormModel,
      );
}