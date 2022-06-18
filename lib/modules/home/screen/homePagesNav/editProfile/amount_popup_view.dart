
import 'package:flutter/material.dart';
import 'package:flutter_braintree/flutter_braintree.dart';

import 'package:tourista/shared/components/components.dart';
import 'package:tourista/shared/components/constants.dart';
import 'package:tourista/shared/cubit/cubit.dart';

class AmountView extends StatefulWidget {
  const AmountView(
      {Key? key,
      this.onCancelClick,
      this.barrierDismissible = true,
      })
      : super(key: key);
  final bool barrierDismissible;
  final Function()? onCancelClick;
  @override
  _AmountViewState createState() => _AmountViewState();
}
class _AmountViewState extends State<AmountView>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  var amount = TextEditingController();
  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);
    animationController?.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: AnimatedBuilder(
          animation: animationController!,
          builder: (BuildContext context, Widget? child) {
            return AnimatedOpacity(
              duration: const Duration(milliseconds: 100),
              opacity: animationController!.value,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {
                  if (widget.barrierDismissible) {
                    Navigator.pop(context);
                  }
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(60.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              offset: const Offset(4, 4),
                              blurRadius: 8.0),
                        ],
                      ),
                      child: InkWell(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(24.0)),
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: dfaultTexField(prefix: Icons.account_balance_wallet, controller: amount, label: 'amount',type: TextInputType.numberWithOptions()),
                            ),
                            const Divider(
                              height: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, right: 16, bottom: 16, top: 8),
                              child: Container(
                                height: 48,
                                decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(24.0)),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.6),
                                      blurRadius: 8,
                                      offset: const Offset(4, 4),
                                    ),
                                  ],
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(24.0)),
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      double money = double.parse(amount.text);
                                      try {
                                        var request = BraintreeDropInRequest(
                                          tokenizationKey: 'sandbox_hcgxmbt3_dxd53c5kpf76svwk',
                                          paypalEnabled: true,
                                          collectDeviceData: true,
                                          googlePaymentRequest: BraintreeGooglePaymentRequest(
                                            totalPrice: amount.text,
                                            currencyCode: 'USD',
                                            billingAddressRequired: false,
                                          ),
                                          paypalRequest: BraintreePayPalRequest(
                                            amount: amount.text ,
                                            displayName: 'tourista',
                                            currencyCode : 'USD',
                                          ),
                                          cardEnabled: true,
                                        );
                                        BraintreeDropInResult? result = await BraintreeDropIn.start(request);
                                        if (result != null) {
                                          // print(result.paymentMethodNonce.description);
                                          // print(result.paymentMethodNonce.nonce);
                                          AppCubit.get(context).addBalance(amount: money);
                                        }

                                      } catch (_) {}
                                      Navigator.pop(context);
                                    },
                                    child: Center(
                                      child: Text(
                                        'Pay now',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
