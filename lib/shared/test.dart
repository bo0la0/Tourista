


import 'package:flutter/material.dart';
import 'package:flutter_braintree/flutter_braintree.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  static final String tokenizationKey = 'sandbox_pghnxvzt_dxd53c5kpf76svwk';

  void showNonce(BraintreePaymentMethodNonce nonce) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Payment method nonce:'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('Nonce: ${nonce.nonce}'),
            SizedBox(height: 16),
            Text('Type label: ${nonce.typeLabel}'),
            SizedBox(height: 16),
            Text('Description: ${nonce.description}'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Braintree example app'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                var request = BraintreeDropInRequest(
                  tokenizationKey: 'sandbox_hcgxmbt3_dxd53c5kpf76svwk',
                  paypalEnabled: true,
                  collectDeviceData: true,
                  googlePaymentRequest: BraintreeGooglePaymentRequest(
                    totalPrice: '4.20',
                    currencyCode: 'USD',
                    billingAddressRequired: false,
                  ),
                  paypalRequest: BraintreePayPalRequest(
                    amount: '4.20',
                    displayName: 'student',


                  ),
                  cardEnabled: true,
                );
                BraintreeDropInResult? result = await BraintreeDropIn.start(request);
                if (result != null) {
                  print(result.paymentMethodNonce.description);
                  print(result.paymentMethodNonce.nonce);
                  showNonce(result.paymentMethodNonce);
                }
              },
              child: Text('LAUNCH NATIVE DROP-IN'),
            ),
            // ElevatedButton(
            //   onPressed: () async {
            //     final request = BraintreeCreditCardRequest(
            //       cardNumber: '4111111111111111',
            //       expirationMonth: '12',
            //       expirationYear: '2021',
            //       cvv: '123',
            //     );
            //     final result = await Braintree.tokenizeCreditCard(
            //       tokenizationKey,
            //       request,
            //     );
            //     if (result != null) {
            //       showNonce(result);
            //     }
            //   },
            //   child: Text('TOKENIZE CREDIT CARD'),
            // ),
            // ElevatedButton(
            //   onPressed: () async {
            //     final request = BraintreePayPalRequest(
            //       amount: null,
            //       billingAgreementDescription:
            //       'I hereby agree that flutter_braintree is great.',
            //       displayName: 'Your Company',
            //     );
            //     final result = await Braintree.requestPaypalNonce(
            //       tokenizationKey,
            //       request,
            //     );
            //     if (result != null) {
            //       showNonce(result);
            //     }
            //   },
            //   child: Text('PAYPAL VAULT FLOW'),
            // ),
            // ElevatedButton(
            //   onPressed: () async {
            //     final request = BraintreePayPalRequest(amount: '13.37');
            //     final result = await Braintree.requestPaypalNonce(
            //       tokenizationKey,
            //       request,
            //     );
            //     if (result != null) {
            //       showNonce(result);
            //     }
            //   },
            //   child: Text('PAYPAL CHECKOUT FLOW'),
            // ),
          ],
        ),
      ),
    );
  }
}