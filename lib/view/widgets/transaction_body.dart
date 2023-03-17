import 'package:ecoplants/controller/donation_controller.dart';
import 'package:ecoplants/controller/user_controller.dart';
import 'package:ecoplants/model/donation.dart';
import 'package:ecoplants/model/donation_transaction.dart';
import 'package:ecoplants/model/transaction.dart';
import 'package:ecoplants/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TransactionBody extends StatelessWidget {
  const TransactionBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userController = UserController.i;
    final donationController = DonationController.i;
    return Obx(
      () => userController.isLoading.value && donationController.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                SizedBox(
                  height: 41,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.2),
                                  width: 1)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/svg/Filter.svg'),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Filter',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          )),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () => donationController.index.value = 0,
                        child: LabelItem(content: 'Tanaman'),
                      ),
                      GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () => donationController.index.value = 1,
                          child: LabelItem(content: 'Donasi')),
                      // LabelItem(content: 'Official Store'),
                      // LabelItem(content: 'Harga Terendah'),
                      // LabelItem(content: 'Harga Tertinggi'),
                      // LabelItem(content: 'Malang'),
                    ],
                  ),
                ),
                Obx(
                  () => Expanded(
                      child: donationController.index.value == 0
                          ? PlantTransaction(userController: userController)
                          : DonationTransactionBody(
                              donationController: donationController)),
                )
              ],
            ),
    );
  }
}

class DonationTransactionBody extends StatelessWidget {
  const DonationTransactionBody({
    super.key,
    required this.donationController,
  });

  final DonationController donationController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Obx(
        () => ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              DonationTransaction donationTransaction =
                  donationController.listDonationTransaction[index];
              return Container(
                width: double.infinity,
                height: 152,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8.5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black.withOpacity(0.15)),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/images/dummy_seller.png'),
                        const Expanded(
                          child: Text(
                            'donasi',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: Utils.primaryColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            donationTransaction.status,
                            style: TextStyle(color: Utils.primaryColor),
                          ),
                        )
                      ],
                    ),
                    Text(
                      donationTransaction.donation.community.name,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 10),
                    ),
                    Container(
                      height: 1,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      width: double.infinity,
                      color: Colors.black.withOpacity(0.05),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 54,
                          width: 54,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.1)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.network(
                            donationTransaction.donation.picture,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              donationTransaction.donation.name,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black.withOpacity(0.8)),
                            ),
                            Text(
                              '1x ${Utils.convertToIdr(donationTransaction.nominal)}',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                            Text(
                              'Catatan : Semoga bermanfaat',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black.withOpacity(0.5)),
                            )
                          ],
                        )
                      ],
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                'Total Harga',
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black.withOpacity(0.5)),
                              ),
                              Text(
                                Utils.convertToIdr(donationTransaction.nominal),
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black.withOpacity(0.8)),
                              )
                            ],
                          ),
                          const Spacer(),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(
                                          color: Utils.primaryColor,
                                          width: 1))),
                              onPressed: () {},
                              child: Text(
                                'Donasi Lagi',
                                style: TextStyle(
                                    color: Utils.primaryColor,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 12,
                ),
            itemCount: donationController.listDonationTransaction.length),
      ),
    );
  }
}

class PlantTransaction extends StatelessWidget {
  const PlantTransaction({
    super.key,
    required this.userController,
  });

  final UserController userController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Obx(
        () => ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              Transaction transaction =
                  userController.user.value.transaction.elementAt(index);
              return Container(
                width: double.infinity,
                height: 152,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8.5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black.withOpacity(0.15)),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/images/dummy_seller.png'),
                        Expanded(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            transaction.product.merchant,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: Utils.primaryColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            transaction.status,
                            style: TextStyle(color: Utils.primaryColor),
                          ),
                        )
                      ],
                    ),
                    Text(
                      'Kota ${transaction.product.regency}, ${transaction.product.district}',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 10),
                    ),
                    Container(
                      height: 1,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      width: double.infinity,
                      color: Colors.black.withOpacity(0.05),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 54,
                          width: 54,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.1)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.network(
                            transaction.product.picture,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transaction.product.name,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black.withOpacity(0.8)),
                            ),
                            Text(
                              '${transaction.quantity}x ${Utils.convertToIdr(transaction.product.price)}',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                            Text(
                              'Catatan : Pacing Kayu',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black.withOpacity(0.5)),
                            )
                          ],
                        )
                      ],
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                'Total Harga',
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black.withOpacity(0.5)),
                              ),
                              Text(
                                Utils.convertToIdr(transaction.total),
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black.withOpacity(0.8)),
                              )
                            ],
                          ),
                          const Spacer(),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(
                                          color: Utils.primaryColor,
                                          width: 1))),
                              onPressed: () {},
                              child: Text(
                                'Beli Lagi',
                                style: TextStyle(
                                    color: Utils.primaryColor,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 12,
                ),
            itemCount: userController.user.value.transaction.length),
      ),
    );
  }
}

class LabelItem extends StatelessWidget {
  LabelItem({super.key, required this.content});
  String content;

  @override
  Widget build(BuildContext context) {
    final controller = DonationController.i;
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: getColor(controller.index.value, content), width: 1)),
        child: Text(
          content,
          style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 12,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Color getColor(int index, String content) {
    if (index == 0) {
      if (content == 'Tanaman') {
        return Utils.primaryColor;
      } else {
        return Colors.black.withOpacity(0.2);
      }
    } else {
      if (content == 'Donasi') {
        return Utils.primaryColor;
      } else {
        return Colors.black.withOpacity(0.2);
      }
    }
  }
}
