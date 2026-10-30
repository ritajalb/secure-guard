# Secure Guard

A small Flutter app that promotes everyday security habits for employees: checking how strong a password is and flagging emails that come from outside the organisation.

<img src="assets/images/secure.png" width="180"/>

## Screens

1. **Splash** → **Welcome / login** (badge number and password fields; the login is a front-end mock-up with no backend)
2. **Options**: choose a checker
3. **Password Checker**: live feedback as you type: minimum length of 8, and whether the password has uppercase, lowercase, a number and a special character
4. **Email Checker**: enter a sender address; anything outside the organisation's own domain is flagged as not secure (the trusted domain is one constant in `lib/main.dart`)

## Run it

```bash
flutter create .     # generates the platform folders (android, ios, web, ...)
flutter pub get
flutter run
```

This is an early, simple prototype built while learning Flutter: the checks are rule-based and nothing is stored or sent anywhere.

**Tech:** Flutter · Dart

**Author:** Ritaj Albogami
