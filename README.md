# GradleScripts

My common used gradle scripts.

## `bintray.gradle`

Gradle script used for upload artifact to bintray.com.

### Usage

+ add this line into your module's `build.gradle`:

``` gradle
apply from: "https://raw.githubusercontent.com/Piasy/GradleScripts/master/PRJ_NAME/gradle/bintray.gradle"
```

+ add this block into your root project `build.gradle`, edit it in your need:

``` gradle
ext {
    userName = 'Piasy'
    developer = [
            id   : 'piasy',
            name : 'piasy',
            email: 'xz4215@gmail.com'
    ]
    license = [
            id  : 'MIT',
            name: 'The MIT License (MIT)',
            url : 'http://opensource.org/licenses/MIT'
    ]
    groupName = 'com.github.piasy'
    artifactName = 'dialogfragmentanywhere'
    artifactDescription = 'Anchor your dialog fragment to anywhere! '
    artifactLabels = ['DialogFragment', 'Position']
    releaseVersionCode = 1
    releaseVersionName = '1.0.0'

    androidCompileSdkVersion = 26
    androidBuildToolsVersion = '27.0.1'
    androidSupportSdkVersion = '27.0.1'
    minSdkVersion = 16
    targetSdkVersion = 26
}
```

+ create file `gradle/bintray.properties`, and add this block into it:

```
bintray.user=<your bintray username>
bintray.apikey=<your bintray api key>
```

+ run `./gradlew bintrayUpload`, your artifact will be uploaded to bintray.

## `simple_lib_android_bintray.gradle`

Build a library and example in the same module, publish to bintray.com.

+ add this line into your module's `build.gradle`:

``` gradle
apply from: "https://raw.githubusercontent.com/Piasy/GradleScripts/master/PRJ_NAME/gradle/simple_lib_android_bintray.gradle"
```

+ Add more ext attributes into root project `build.gradle`:

``` gradle
ext {
    ... // the same as you added when import bintray.gradle

    libDebugAppId = 'com.github.piasy.libxxx.example'
}
```

+ In your module's build.gradle, you only need specify dependency.
+ Download `simple_lib_android_bintray_release.sh`, and add execute permission for it, then run it for release.
+ If you want to run example, just hit the `Run` button of Android Studio.

## `piasy_android_simple_lib` template project

+ Clone this project, or download `piasy_android_simple_lib.sh` and `piasy_android_simple_lib.tar`, put them in the same folder;
+ Run `piasy_android_simple_lib.sh <project name> <dest path>`, then a well configured template project will be there, shine!
