# mm

flutter packages pub run build_runner build

flutter clean
cd ios
pod install
flutter build ios --release
