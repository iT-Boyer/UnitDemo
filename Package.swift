// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UnitDemo",
    products: [
      .executable(name: "Unit", targets: ["UnitDemo"]),
      .library(name: "UnitLib", targets: ["UnitLib"])
    ],

    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
      .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),
      .package(url: "https://github.com/Quick/Quick.git", from: "5.0.0"),
      .package(url: "https://github.com/Quick/Nimble.git", from: "10.0.0"),
      //.package(url: "https://github.com/it-boyer/fastlane.git", branch: "public"), linux 不支持
      .package(url: "https://github.com/Alamofire/Alamofire", branch: "master"),
      .package(url: "https://github.com/postmates/PMJSON.git", from: "4.0.0"),
        .package(url: "https://github.com/kareman/SwiftShell", .upToNextMajor(from: "5.1.0")),
        .package(url: "https://github.com/sharplet/Regex",.upToNextMajor(from: "2.1.1")),
       //chatgpt api
       .package(url: "https://github.com/adamrushy/OpenAISwift.git", from: "1.2.0")
        //.package(url: "https://github.com/groue/GRDB.swift.git", from: "5.17.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "UnitDemo",
            dependencies: [
                        //.product(name: "Fastlane", package: "fastlane"),
                        "Alamofire",
                        "PMJSON",
                        "SwiftShell",
                        "Regex",
                        "UnitLib",
                        "OpenAISwift",
                        //.product(name: "GRDB", package: "GRDB.swift"),
                        .product(name: "ArgumentParser", package: "swift-argument-parser")]),

        .target(name: "UnitLib",dependencies: ["SwiftShell", "Regex"]),
        .testTarget(
            name: "UnitDemoTests",
            dependencies: ["UnitDemo", "UnitLib","Quick","Nimble"]),
    ]
)
