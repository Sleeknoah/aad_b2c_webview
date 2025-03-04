# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.0.45] - 2023-04-26

Added new model class that map responses from Azure: AzureTokenResponse

Added a new model class that tracks down in a better way a token, instead of plan text and Obj called: Token, wich really comes handy when handling refresh tokens due to users need to know not only the token but also its expiration date.

Fixed refresh tokens not being retrieved on AADLoginButton and ADB2CEmbedWebView onRefreshToken callback

Added a new callback method called: onAnyTokenRetrieved, this method could be used instead of all the others

ClientAuthentication class is fixed now and both methods found on it: getAllTokens and refreshTokens work now was expected.

## [0.0.44] - 2023-02-28

We're super excited to announce `0.0.44` of `aad_b2c_webview`!

This major release fully focuses on adding robust functionality to the integration of Azure AD & embedded web views.

This is the second big release by two of our `standard` co-maintainers [Mohana Bhattacharya](https://github.com/mohanajuhi166) & [Chimdike Nnacheta](https://github.com/sleeknoah). Buy them a cake if you run into them, thanks for getting this release out!

### Major changes

- Created a login/sign up button, that can be easily integrated and customized for the mobile application
- Added ValueChanged callback to the login button, that returns the user's id token

### Changed features

- Updated login button implementation and fixes to ReadMe file
- Created a login button to login into Azure AD B2C. This can be used in any flutter app to login into Azure AD B2C
- Removed unwanted dependencies
- Added ValueChanged to give users more control of accessTokens and redirect process
- Other small fixes

## [0.0.42] - 2023-02-06

- Updated package to use PKCE flow for authentication
- Updated flutter secure storage's usage and secure access for token
- Updated redirect methods to use PKCE flow
- Updated README.md
- Updated CHANGELOG.md
- Updated pubspec.yaml

