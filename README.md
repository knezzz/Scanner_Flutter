# Scanner POC
Requirements:
- Scan DataMatrix and BarCodes
- View UI is customizable in Flutter

## qr_code_scanner
Setup:
- Android: /
- iOS: Permissions

Reading speed: slow

It uses zxing in Android and MTBBarcode scanner in iOS for code detection.

Requirements:
- [x] Scan DataMatrix and BarCodes
- [x] View UI is customizable in Flutter

Cons:
- Android min version from 16 -> 21 (~5% devices)

Pros:
- Last update is January 2021.
- Only setup on android is changing minVersion

## qr_mobile_vision
Setup:
- Android:
- iOS:

Reading speed: really fast

Uses MLKit for code detection.

Requirements:
- [x] Scan DataMatrix and BarCodes
- [x] View UI is customizable in Flutter

Cons:
- iOS version from 9 -> 11
Pros:
- Last update is December 2020.
- Much faster than qr_code_scanner

## fast_qr_reader_view
Setup:
- Android: firebase project
- iOS: Permissions

Requirements:
- [x] Scan DataMatrix and BarCodes
- [x] View UI is customizable in Flutter

Cons:
- Last update is November 2018.
- Needs firebase
- Android min version from 16 -> 21 (~5% devices)
- **NOT WORKING ON ANDROID** --
Uses depreciated code on android, making it unable to run on android devices, iOS works fine.
**Does not meet the requirements!**

## flutter_barcode_scanner
Requirements: 
- [x] Scan DataMatrix and BarCodes
- [ ] View UI is customizable in Flutter

**Does not meet the requirements!**
