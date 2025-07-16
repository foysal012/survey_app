import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:survey_app/provider/question_provider.dart';
import '../../resources/app_color.dart';
import '../../resources/app_style.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<QuestionProvider>(context, listen: false).initialMethod();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back,
              color: AppColor.appWhite)
        ),
        title: Text('Question Page',
            style: AppStyle.boldTextStyle(
                fontSize: AppStyle.fontSize18,
                color: AppColor.appWhite)
        ),
        backgroundColor: AppColor.primaryColor,
      ),

      body: Consumer<QuestionProvider>(
        builder: (context, questionProvider, child) {
          return questionProvider.isScreenLoading?
          Center(child: CupertinoActivityIndicator(color: AppColor.primaryColor, radius: 15.0)) :
          Container(
            padding: AppStyle.padding(10.0),
            decoration: BoxDecoration(
              color: AppColor.appBackgroundColor
            ),
            child: Column(
              children: [
                // ListView.builder(
                //   // itemCount: questionProvider.questionData.length,
                //   itemCount: questionProvider.currentIndex == 0 ? 1 : questionProvider.currentIndex,
                //   shrinkWrap: true,
                //   itemBuilder: (context, index) {
                //     final dataInfo = questionProvider.questionData[index];
                //   return Container(
                //     child: Column(
                //       children: [
                //         Text('${dataInfo.question?.slug}?'),
                //         AppStyle.gap(10.0),
                //         ListView.builder(
                //           itemCount: dataInfo.options?.length,
                //           shrinkWrap: true,
                //           itemBuilder: (context, index) {
                //             final optionInfo = dataInfo.options?[index];
                //             return Container(
                //               child: Row(
                //                 children: [
                //                   Radio(
                //                       value: optionInfo?.value,
                //                       groupValue: questionProvider.groupValue,
                //                       onChanged: (value) {
                //                         debugPrint('Selected value is: ${value}');
                //                         questionProvider.setGroupValue(value??'');
                //                         questionProvider.setReferId();
                //                       },
                //                   ),
                //                   Text('${optionInfo?.value}'),
                //                 ],
                //               ),
                //             );
                //           },),
                //
                //         AppStyle.gap(10.0),
                //
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             GestureDetector(
                //               onTap: ()=> questionProvider.skipQuestion(),
                //               child: Container(
                //                   height: 30,
                //                   width: 45,
                //                   alignment: Alignment.center,
                //                   padding: AppStyle.padding(2.5),
                //                   decoration: BoxDecoration(
                //                       color: AppColor.appRed,
                //                       borderRadius: AppStyle.radius(10.0)
                //                   ),
                //                   child: Text('Skip', style: AppStyle.textStyle(
                //                     fontSize: 14,
                //                     color: AppColor.appWhite
                //                   ))),
                //             ),
                //             AppStyle.gap(30.0),
                //
                //             GestureDetector(
                //               onTap: () {
                //                 questionProvider.goToNextQuestion();
                //               },
                //               child: Container(
                //                   height: 30,
                //                   width: 45,
                //                   alignment: Alignment.center,
                //                   padding: AppStyle.padding(2.5),
                //                   decoration: BoxDecoration(
                //                       color: AppColor.primaryColor,
                //                       borderRadius: AppStyle.radius(10.0)
                //                   ),
                //                   child: Text('Next',
                //                       style: AppStyle.textStyle(
                //                           fontSize: 14,
                //                           color: AppColor.appWhite
                //                       )
                //                   )),
                //             )
                //           ],
                //         )
                //       ],
                //     ),
                //   );
                // },)

                Expanded(
                  child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        final currentQuestion = questionProvider.questionData[questionProvider.currentIndex];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${currentQuestion.question?.slug}?'),
                            AppStyle.gap(10.0),

                            if (currentQuestion.options != null)
                              ListView.builder(
                                itemCount: currentQuestion.options?.length ?? 0,
                                shrinkWrap: true,
                                itemBuilder: (context, optIndex) {
                                  final option = currentQuestion.options![optIndex];
                                  return Row(
                                    children: [
                                      Radio(
                                        value: option.value,
                                        groupValue: questionProvider.groupValue,
                                        onChanged: (value) {
                                          questionProvider.setGroupValue(value ?? '');
                                        },
                                      ),
                                      Text('${option.value}'),
                                    ],
                                  );
                                },
                              ),

                            AppStyle.gap(20.0),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () => questionProvider.skipQuestion(),
                                  child: Container(
                                    height: 30,
                                    width: 60,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppColor.appRed,
                                      borderRadius: AppStyle.radius(10.0),
                                    ),
                                    child: Text('Skip', style: AppStyle.textStyle(fontSize: 14, color: AppColor.appWhite)),
                                  ),
                                ),
                                AppStyle.gap(30.0),
                                GestureDetector(
                                  onTap: () => questionProvider.goToNextQuestion(),
                                  child: Container(
                                    height: 30,
                                    width: 60,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppColor.primaryColor,
                                      borderRadius: AppStyle.radius(10.0),
                                    ),
                                    child: Text('Next', style: AppStyle.textStyle(fontSize: 14, color: AppColor.appWhite)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      }

                    /// new code
                    //   itemCount: 1,
                    //   itemBuilder: (context, index) {
                    //     final currentQuestion = questionProvider.questionData[questionProvider.currentIndex];
                    //     final questionId = currentQuestion.id;
                    //
                    //     return Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text('${currentQuestion.question?.slug}?'),
                    //
                    //         AppStyle.gap(10.0),
                    //
                    //         if (currentQuestion.type == "multipleChoice" || currentQuestion.type == "dropdown")
                    //           ListView.builder(
                    //             itemCount: currentQuestion.options?.length ?? 0,
                    //             shrinkWrap: true,
                    //             itemBuilder: (context, optIndex) {
                    //               final option = currentQuestion.options![optIndex];
                    //               return Row(
                    //                 children: [
                    //                   Radio(
                    //                     value: option.value,
                    //                     groupValue: questionProvider.answers[questionId],
                    //                     onChanged: (value) {
                    //                       questionProvider.setAnswer(questionId??'', value ?? '');
                    //                     },
                    //                   ),
                    //                   Text(option.value??''),
                    //                 ],
                    //               );
                    //             },
                    //           ),
                    //
                    //         if (currentQuestion.type == "textInput" || currentQuestion.type == "numberInput")
                    //           TextField(
                    //             onChanged: (value) {
                    //               questionProvider.setAnswer(questionId??'', value);
                    //             },
                    //             decoration: InputDecoration(
                    //               hintText: currentQuestion.type == "numberInput" ? "Enter number" : "Enter text",
                    //             ),
                    //           ),
                    //
                    //         if (currentQuestion.type == "checkbox")
                    //           ListView.builder(
                    //             itemCount: currentQuestion.options?.length ?? 0,
                    //             shrinkWrap: true,
                    //             itemBuilder: (context, optIndex) {
                    //               final option = currentQuestion.options![optIndex];
                    //               final selectedValues = (questionProvider.answers[questionId]?.split(",") ?? []);
                    //               final isChecked = selectedValues.contains(option.value);
                    //               return Row(
                    //                 children: [
                    //                   Checkbox(
                    //                     value: isChecked,
                    //                     onChanged: (checked) {
                    //                       var updated = [...selectedValues];
                    //                       if (checked == true) {
                    //                         updated.add(option.value??'');
                    //                       } else {
                    //                         updated.remove(option.value);
                    //                       }
                    //                       questionProvider.setAnswer(questionId??'', updated.join(","));
                    //                     },
                    //                   ),
                    //                   Text(option.value??''),
                    //                 ],
                    //               );
                    //             },
                    //           ),
                    //
                    //         AppStyle.gap(20.0),
                    //
                    //             if (currentQuestion.skip?.id != '-1')
                    //           ElevatedButton(
                    //             onPressed: () => questionProvider.skipQuestion(),
                    //             child: Text("Skip"),
                    //           ),
                    //
                    //         if (currentQuestion.type == "textInput" || currentQuestion.type == "numberInput" || currentQuestion.type == "checkbox")
                    //           ElevatedButton(
                    //             onPressed: () => questionProvider.goToNextByReferTo(),
                    //             child: Text("Next"),
                    //           ),
                    //
                    //         if(currentQuestion.referTo?.id == "submit" || currentQuestion.options == null)
                    //           ElevatedButton(
                    //             onPressed: () => questionProvider.goToNextByReferTo(),
                    //             child: Text("Submit"),
                    //           )
                    //       ],
                    //     );
                    //   }

                  ),
                )

              ],
          ),
        );
      },)
    );
  }
}
