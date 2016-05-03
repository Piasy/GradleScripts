# BintrayUploadScript
Gradle script used for upload artifact to bintray.com.

## Usage
+ add this line into your module's `build.gradle`:

```gradle
apply from: "https://raw.githubusercontent.com/Piasy/BintrayUploadScript/master/bintray.gradle"
```

+ add this block into your root project `build.gradle`, edit it in your need:

```gradle
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

    androidCompileSdkVersion = 'Google Inc.:Google APIs:23'
    androidBuildToolsVersion = '23.0.3'
    androidSupportSdkVersion = '23.3.0'
    minSdkVersion = 14
    targetSdkVersion = 23
}
```

+ create a file named `bintray.properties`, and add this block into it:

```
bintray.user=<your bintray username>
bintray.apikey=<your bintray api key>
```

+ run `./gradlew bintrayUpload`, your artifact will be uploaded to bintray.
