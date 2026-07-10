// swift-tools-version: 6.0

import PackageDescription

let sdkVersion = "9.12.2"
let baseUrl = "https://adsdk.bing.net/mobile/ios/releases"

let vungleAdapterChecksum = """
c26a50b59a90ed69528379c5ac51c4e3932913c3b218c4439c5bd3fa3c6acddd
"""

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
