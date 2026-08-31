// swift-tools-version: 6.0

import PackageDescription

let sdkVersion = "9.14.0"
let baseUrl = "https://adsdk.bing.net/mobile/ios/releases"

let vungleAdapterChecksum = """
273b53fd3f3e98d33fb8541e6c99d47963c73536f06822648908b1c591a8aa2f
"""

let package = Package(
    name: "ANVungleAdapter",

    defaultLocalization: "en",

    platforms: [
        .iOS(.v15)
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
        ),
        
        .package(
            url: "https://github.com/appnexus/mobile-sdk-ios-spm.git",
            exact: Version(stringLiteral: sdkVersion)
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
                    package: "vungleadssdk-swiftpackagemanager"
                ),
                
                .product(
                    name: "AppNexusSDK",
                    package: "mobile-sdk-ios-spm"
                )
            ]
        )
    ]
)
