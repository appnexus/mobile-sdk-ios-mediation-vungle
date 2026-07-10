// swift-tools-version: 6.0

import PackageDescription

let sdkVersion = "9.12.1"
let sdkVersion = "9.12.2"
let vungleAdapterChecksum = """
4a4d27b454f4ff39ca5bc9c6321cd2f3715b0dc89ebea7a4df1142d90b9059e5
c26a50b59a90ed69528379c5ac51c4e3932913c3b218c4439c5bd3fa3c6acddd
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
