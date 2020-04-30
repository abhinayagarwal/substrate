if [ "$RUNNER_OS" == "macOS" ]
then
  mkdir -p $HOME/javafx-static-libs-darwin
  mkdir -p $HOME/javafx-static-libs-ios
  cd $HOME/javafx-static-libs-darwin
  if [ "$1" == "host" ]
  then
    wget https://download2.gluonhq.com/substrate/javafxstaticsdk/openjfx-15-latest-darwin-x86_64-static.zip
    unzip openjfx-15-latest-darwin-x86_64-static.zip
  else
    wget https://download2.gluonhq.com/substrate/javafxstaticsdk/openjfx-15-latest-android-aarch64-static.zip
    unzip openjfx-15-latest-android-aarch64-static.zip
  fi
   cd $HOME/javafx-static-libs-ios
   wget https://download2.gluonhq.com/substrate/javafxstaticsdk/openjfx-15-latest-ios-arm64-static.zip
   unzip openjfx-15-latest-ios-arm64-static.zip
else
  mkdir -p $HOME/javafx-static-libs-linux && cd $HOME/javafx-static-libs-linux
  if [ "$1" == "host" ]
  then
    wget https://download2.gluonhq.com/substrate/javafxstaticsdk/openjfx-15-latest-linux-x86_64-static.zip
    unzip openjfx-15-latest-linux-x86_64-static.zip
  else
    wget https://download2.gluonhq.com/substrate/javafxstaticsdk/openjfx-15-latest-android-aarch64-static.zip
    unzip openjfx-15-latest-android-aarch64-static.zip
  fi
fi
cd $GITHUB_WORKSPACE