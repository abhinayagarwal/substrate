#!/bin/sh

mkdir -p $HOME/android-sdk
cd $HOME/android-sdk
if [[ "$RUNNER_OS" == "Linux" ]]
then
  wget https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
  unzip -q sdk-tools-linux-4333796.zip
else
  wget https://dl.google.com/android/repository/sdk-tools-darwin-4333796.zip
  unzip -q sdk-tools-darwin-4333796.zip
fi
cd tools/lib/
mkdir java11
cd java11
wget https://repo1.maven.org/maven2/javax/activation/activation/1.1.1/activation-1.1.1.jar
wget https://repo1.maven.org/maven2/org/glassfish/jaxb/jaxb-xjc/2.3.2/jaxb-xjc-2.3.2.jar
wget https://repo1.maven.org/maven2/com/sun/xml/bind/jaxb-impl/2.3.0.1/jaxb-impl-2.3.0.1.jar
wget https://repo1.maven.org/maven2/org/glassfish/jaxb/jaxb-core/2.3.0.1/jaxb-core-2.3.0.1.jar
wget https://repo1.maven.org/maven2/org/glassfish/jaxb/jaxb-jxc/2.3.2/jaxb-jxc-2.3.2.jar
wget https://repo1.maven.org/maven2/javax/xml/bind/jaxb-api/2.3.1/jaxb-api-2.3.1.jar
wget https://repo1.maven.org/maven2/com/sun/istack/istack-commons-runtime/3.0.10/istack-commons-runtime-3.0.10.jar
cd $HOME/android-sdk
mkdir licenses
echo "24333f8a63b6825ea9c5514f83c2829b004d1fee" > "$HOME/android-sdk/licenses/android-sdk-license"
echo "Install Android SDK"
java -Dcom.android.sdklib.toolsdir=$HOME/android-sdk/tools -classpath "$HOME/android-sdk/tools/lib/*:$HOME/android-sdk/tools/lib/java11/*" com.android.sdklib.tool.sdkmanager.SdkManagerCli "platforms;android-27" "build-tools;27.0.3" "platform-tools" "extras;android;m2repository" "extras;google;m2repository" "ndk-bundle"
# Check the contents
ls -la
cd $GITHUB_WORKSPACE

# Android NDK
# mkdir -p $HOME/android-ndk && cd $HOME/android-ndk
# wget https://dl.google.com/android/repository/android-ndk-r21b-darwin-x86_64.zip
# unzip android-ndk-r21b-darwin-x86_64.zip