import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hsg_loyalty/presentation/widgets/call_text_field.dart';
import 'package:hsg_loyalty/utils/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({Key? key}) : super(key: key);

  Future<void> _launchPhoneCall(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    Uri uri = Uri.parse(url);

    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $phoneNumber');
    }
  }
  _launchEmail(String emailAddress) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: emailAddress,
      query: 'subject=Your%20Subject&body=Your%20Body',
    );

    if (!await launchUrl(params)) {
      throw Exception('Could not launch $params');
    }
  }
  @override
  Widget build(BuildContext context) {
    const cityNumber = '1444';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Экстренный call-center',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Center(
          child: ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              const Text('Круглосуточный экстренный саll-центр',
              textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  color: AppColors.black,
                )),
              const SizedBox(height: 10),
              const Text(
                'для приема и регистрации происшествий чрезвычайных ситуаций, связанных с деятельностью компанию, звоните на номер:',
                style: TextStyle(
                  fontSize: 16,
                  height: 0,
                  color: AppColors.black,
                  fontWeight: FontWeight.w400
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                'Городской',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(fontSize: ScreenUtil().setSp(16)),
                textAlign: TextAlign.center,
                ),
              const SizedBox(height: 10),
              CallTextField(
                  onTap: () => _launchPhoneCall(cityNumber),
                  height: 32.h,
                  width: MediaQuery.sizeOf(context).width,
                  text: cityNumber
              ),
              const SizedBox(height: 20),
              Text(
                'Мобильный',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(fontSize: ScreenUtil().setSp(16)),
                textAlign: TextAlign.center,
                ),
              const SizedBox(height: 10),
              CallTextField(
                  onTap: () => _launchPhoneCall('78000801444'),
                  height: 32.h,
                  width: MediaQuery.sizeOf(context).width,
                  text: '+7 (800) 080 1444'
              ),
              const SizedBox(height: 20),
              Text(
                'E-mail',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(fontSize: ScreenUtil().setSp(16)),
                textAlign: TextAlign.center,
                ),
              const SizedBox(height: 10),
              CallTextField(
                  onTap: () => _launchEmail('sms@kmg.kz'),
                  height: 32.h,
                  width: MediaQuery.sizeOf(context).width,
                  text: 'sms@kmg.kz'
              ),

            ],
          ),
        ),
      ),
    );
  }
}
