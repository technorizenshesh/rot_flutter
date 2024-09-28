import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';

class MyQrCodeController extends GetxController {
  DateTime startRangDate = DateTime.now();
  DateTime? endRangeDate = DateTime.now();
  List<DateTime?> datesList = [];
  final chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random rnd = Random();
  final count = 0.obs;
  final qrNumber = ''.obs;
  Uint8List? qrCodeBytes;
  Map<String, String?> parameters = Get.parameters;
  @override
  void onInit() {
    super.onInit();
    qrNumber.value = getRandomString(15);
    print('Qr Number:- ${qrNumber.value}');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  changeStartLastDate(DateTime start, DateTime? last) {
    startRangDate = start;
    endRangeDate = last;
  }

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));

  clickOnShareButton() {
    generateQrCode();
  }

  void generateQrCode() {
    QrPainter(
      data: qrNumber.value,
      version: QrVersions.auto,
      gapless: false,
      eyeStyle: const QrEyeStyle(
          eyeShape: QrEyeShape.square, color: Color(0xFF000000)),
      //color: const Color(0xFFFFFFFF),
    ).toImageData(200).then((value) {
      qrCodeBytes = value!.buffer.asUint8List();
      shareQrCode();
    });
  }

  void shareQrCode() async {
    if (qrCodeBytes != null) {
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/qr_code.png');
      await file.writeAsBytes(qrCodeBytes!);
      Share.shareFiles([file.path],
          subject: 'Received Payment By using this qr code',
          text: 'Manual Code:- ${qrNumber.value}');
    }
  }

  List<DateTime?> selectedDateRangeList = [];

  void openBottomSheetHorizontalCalender(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              height: 600,
              child: Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.only(left: 20.px, top: 15.px, bottom: 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.cancel_outlined,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 5),
                      child: CalendarDatePicker2(
                        config: CalendarDatePicker2Config(
                          firstDayOfWeek: 1,
                          calendarType: CalendarDatePicker2Type.range,
                          selectedDayTextStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                          selectedDayHighlightColor: Colors.transparent,
                          selectedRangeHighlightColor: Colors.blue,
                          hideYearPickerDividers: true,
                          disableMonthPicker: true,
                          weekdayLabels: [
                            "Sun",
                            "Mon",
                            "Tue",
                            "Wed",
                            "Thu",
                            "Fri",
                            "Sat"
                          ],
                          centerAlignModePicker: true,
                          customModePickerIcon: SizedBox(),
                          dayBuilder: ({
                            required DateTime date,
                            BoxDecoration? decoration,
                            bool? isDisabled,
                            bool? isSelected,
                            bool? isToday,
                            TextStyle? textStyle,
                          }) {
                            bool selectedStartDay = startRangDate != null &&
                                date.isAtSameMomentAs(startRangDate);
                            bool selectedEndDay = endRangeDate != null &&
                                date.isAtSameMomentAs(endRangeDate!);

                            bool isSelected = (startRangDate != null &&
                                    endRangeDate != null &&
                                    (date.isAfter(startRangDate) &&
                                        date.isBefore(endRangeDate!
                                            .add(Duration(days: 1)))) ||
                                selectedStartDay ||
                                selectedEndDay);
                            bool isPastDate = date.isBefore(
                                DateTime.now().subtract(Duration(days: 1)));

                            bool isSingleDaySelected = selectedStartDay &&
                                (endRangeDate == null ||
                                    selectedStartDay && selectedEndDay);

                            return Container(
                              height: 40,
                              width: 40,
                              margin: EdgeInsets.zero,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: isSelected
                                      ? Colors.blue
                                      : Colors.transparent,
                                  borderRadius: isSingleDaySelected
                                      ? BorderRadius.circular(25)
                                      : (selectedStartDay)
                                          ? BorderRadius.only(
                                              topLeft: Radius.circular(25),
                                              bottomLeft: Radius.circular(25),
                                            )
                                          : selectedEndDay
                                              ? BorderRadius.only(
                                                  topRight: Radius.circular(25),
                                                  bottomRight:
                                                      Radius.circular(25))
                                              : BorderRadius.circular(0)),
                              clipBehavior: Clip.hardEdge,
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: (selectedStartDay || selectedEndDay)
                                        ? Colors.white.withOpacity(0.6)
                                        : Colors.transparent),
                                clipBehavior: Clip.hardEdge,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Text(
                                      date.day.toString(),
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.black54),
                                    ),
                                    isPastDate
                                        ? Transform.rotate(
                                            angle: -10,
                                            child: Container(
                                              width: 20.px,
                                              height: 2.px,
                                              decoration: BoxDecoration(
                                                  color: Colors.black),
                                            ),
                                          )
                                        : SizedBox(
                                            height: 2,
                                          )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        value: selectedDateRangeList,
                        onValueChanged: (dates) {
                          final now = DateTime.now();
                          selectedDateRangeList = dates.where((date) {
                            return !date.isBefore(
                                DateTime(now.year, now.month, now.day));
                          }).toList();
                          setState(() {
                            startRangDate = dates[0];
                            if (dates.length > 1) {
                              endRangeDate = dates[dates.length - 1];
                            } else {
                              endRangeDate = null;
                            }
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
