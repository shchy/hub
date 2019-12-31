# mm

flutter packages pub run build_runner build


rm -rf "$(getconf DARWIN_USER_CACHE_DIR)/org.llvm.clang/ModuleCache"
rm -rf ~/Library/Developer/Xcode/DerivedData
rm -rf ~/Library/Caches/com.apple.dt.Xcode

flutter clean
cd ios
pod install
flutter build ios --release

open ios/Runner.xcworkspace 