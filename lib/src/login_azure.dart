import 'package:aad_b2c_webview/src/aad_b2c_webview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AADLoginButton extends StatefulWidget {
  final String userFlowUrl;
  final String clientId;
  final String redirectUrl;
  final Function(BuildContext context)? onRedirect;
  final BuildContext? context;
  final ValueChanged<String>? onAccessToken;
  final ValueChanged<String>? onIDToken;
  final ValueChanged<String>? onRefreshToken;
  final bool useImage;
  final String? title;
  final TextStyle? style;
  final List<String> scopes;
  final String userFlowName;
  const AADLoginButton({
    super.key,
    required this.userFlowUrl,
    required this.clientId,
    required this.redirectUrl,
    this.onRedirect,
    required this.context,
    this.onAccessToken,
    this.onIDToken,
    this.onRefreshToken,
    this.useImage = true,
    this.title,
    this.style,
    required this.scopes,
    required this.userFlowName,
  })  : assert(userFlowUrl != ''),
        assert(userFlowName != ''),
        assert(clientId != ''),
        assert(redirectUrl != '');

  @override
  State<AADLoginButton> createState() => _AADLoginButtonState();
}

class _AADLoginButtonState extends State<AADLoginButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(widget.context ?? context).push(
          MaterialPageRoute(
            builder: (context) {
              return ADB2CEmbedWebView(
                userFlowUrl: widget.userFlowUrl,
                userFlowName: widget.userFlowName,
                clientId: widget.clientId,
                redirectUrl: widget.redirectUrl,
                onRedirect: widget.onRedirect,
                onAccessToken: (accessToken) {
                  widget.onAccessToken!(accessToken);
                },
                onIDToken: (idToken) {
                  widget.onIDToken!(idToken);
                },
                onRefreshToken: (refreshToken) {
                  widget.onRefreshToken!(refreshToken);
                },
                scopes: widget.scopes,
              );
            },
          ),
        );
      },
      child: Material(
        elevation: 4.0,
        borderRadius: BorderRadius.circular(
          6.0,
        ),
        color: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              8.0,
            ),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 36.0,
            ),
            child: Row(
              textDirection: TextDirection.ltr,
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    widget.title ?? 'Login with Azure AD',
                    style: widget.style ?? GoogleFonts.nunito(),
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.center,
                  ),
                ),
                if (widget.useImage)
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: Image.asset(
                      'assets/icons8-azure-48.png',
                      package: 'aad_b2c_webview',
                    ),
                  )
                else
                  const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
