// swift-tools-version: 6.0

import PackageDescription

let sdkVersion = "9.12.1"
let baseUrl = "https://adsdk.bing.net/mobile/ios/releases"

let vungleAdapterChecksum = "99e764f706b3a1c31580368601036022436a1733d06885b003d9878dbd109c23"

let package = Package(
    name: "ANVungleAdapter",

    defaultLocalization: "en",

    platforms: [
        .iOS(.v12)
    ],

    products: [
        .library(
            name: "ANVungleAdapter",
            targets: [
                "ANVungleAdapter",
                "ANVungleAdapterDependencies"
            ]
        )
    ],

    dependencies: [
        .package(
            url: "https://github.com/Vungle/VungleAdsSDK-SwiftPackageManager.git",
            exact: "7.3.2"
        )
    ],

    targets: [
        .binaryTarget(
            name: "ANVungleAdapter",
            url: "\(baseUrl)/\(sdkVersion)/static/ANVungleAdapter.zip",
            checksum: vungleAdapterChecksum
        ),

        .target(
            name: "ANVungleAdapterDependencies",
            dependencies: [
                .product(
                    name: "VungleAdsSDK",
                    package: "VungleAdsSDK-SwiftPackageManager"
                )
            ]
        )
    ]
)
