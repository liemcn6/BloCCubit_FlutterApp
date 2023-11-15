part of '../privacy_policy_screen.dart';

class PrivacyPolicyView extends StatefulWidget {
  const PrivacyPolicyView({super.key});

  @override
  State<PrivacyPolicyView> createState() => _PrivacyPolicyViewState();
}

class _PrivacyPolicyViewState extends State<PrivacyPolicyView> {
  var loadingPercentage = 0;
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      // ..addJavaScriptChannel('SnackBar', onMessageReceived: (message) {
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message.message)));
      // })
      ..setNavigationDelegate(NavigationDelegate(
        onNavigationRequest: (request) {
          if (request.url != ApiEndpoints.privacyPolicy) {
            return NavigationDecision.prevent;
          } else {
            return NavigationDecision.navigate;
          }
        },
        onPageFinished: (url) {
          controller.runJavaScriptReturningResult(
            //hide header of webpage

            "document.getElementsByClassName('col-8')[0].style.display='none';" +
                "document.getElementsByClassName('col-4')[0].style.display='none';" +
                "document.getElementsByTagName('hr')[0].style.display='none';" +
                //increase font size
                "document.getElementsByClassName('policy-content')[0].style.fontSize = '110%';",
          );
        },
      ))
      ..loadRequest(
        Uri.parse(ApiEndpoints.privacyPolicy),
      );
  }

  @override
  Widget build(BuildContext context) {
    final t = Utils.languageOf(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Header(
          title: t.terms_of_use,
          visibleBack: true,
        ),
      ),
      body: Stack(
        children: [
          WebViewWidget(
            controller: controller,
          ),
          IgnorePointer(
            child: Container(
              color: Colors.transparent,
            ),
          ),
          if (loadingPercentage < 100)
            LinearProgressIndicator(
              value: loadingPercentage / 100.0,
            ),
        ],
      ),
    );
  }
}
