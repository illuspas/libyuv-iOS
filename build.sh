LIB=libyuv.a
LIBS_PATH=`pwd`
SDK=`xcrun --sdk iphoneos --show-sdk-version`

mkdir -p universal/lib universal/include

xcodebuild -sdk iphoneos$SDK
xcodebuild -sdk iphonesimulator$SDK
lipo -create build/Release-iphoneos/$LIB build/Release-iphonesimulator/$LIB -output $LIBS_PATH/universal/lib/$LIB
cp -r yuv/include/* $LIBS_PATH/universal/include
rm -rf build
