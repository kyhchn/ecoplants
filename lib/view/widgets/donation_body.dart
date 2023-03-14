import 'package:ecoplants/routes.dart';
import 'package:ecoplants/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonationBody extends StatelessWidget {
  const DonationBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) => GestureDetector(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => Get.toNamed(Routes.donationDetail),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8.5, horizontal: 17),
            decoration: BoxDecoration(
                border:
                    Border.all(color: Colors.black.withOpacity(0.1), width: 1),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              AssetImage('assets/images/reforestation.jpg'))),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: SizedBox(
                    height: 111,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Donasi Penghijauan Hutan Tretes Jawa Timur',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Komunitas Impala UB',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                          width: 200,
                          child: Row(
                            children: [
                              Container(
                                height: 4,
                                width: 200 * 0.4,
                                color: Utils.primaryColor,
                              ),
                              Expanded(
                                  child: Container(
                                height: 4,
                                color: Utils.primaryColor.withOpacity(0.2),
                              ))
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Terkumpul',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              'Sisa Hari',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 10,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Utils.convertToIdr(40000000),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              30.toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      itemCount: 5,
      separatorBuilder: (context, index) => Utils.verticalSeparator,
    );
  }
}
