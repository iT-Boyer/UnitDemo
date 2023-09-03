// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let proxy = "https://gh.con.sh/https://github.com/"
let proxy2 = "https://github.com/"
let package = Package(
    name: "UnitDemo",
    products: [
      .executable(name: "Unit", targets: ["UnitDemo"]),
      .library(name: "UnitLib", targets: ["UnitLib"])
    ],

    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
      //.package(url: proxy + "AliSoftware/OHHTTPStubs", branch: "master"),
      .package(url: proxy + "apple/swift-argument-parser", from: "1.0.0"),
      .package(url: proxy + "Quick/Quick.git", .upToNextMajor(from: "5.0.0")),
      //.package(url: proxy2 + "iT-Boyer/Nimble.git", branch: "main"),
      .package(path: "/Users/boyer/hsg/Nimble"),
      //.package(url: proxy + "it-boyer/fastlane.git", branch: "public"),
      //.package(url: proxy + "Alamofire/Alamofire", branch: "master"),
     // .package(url: proxy + "SwiftyJSON/SwiftyJSON.git", from: "5.0.1"),
        .package(url: proxy + "kareman/SwiftShell", .upToNextMajor(from: "5.1.0")),
        .package(url: proxy + "sharplet/Regex",.upToNextMajor(from: "2.1.1")),
        //.package(url: proxy + "groue/GRDB.swift.git", from: "5.17.0"),
        //.package(path: "/Users/boyer/hsg/GRDB.swift"),

    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "UnitDemo",
            dependencies: [
                        //.product(name: "Fastlane", package: "fastlane"),
                        //    "Alamofire",
                        //   "SwiftyJSON",
                        "SwiftShell",
                        "Regex",
                        "UnitLib",
                        //.product(name: "GRDB", package: "GRDB.swift"),
                        .product(name: "ArgumentParser", package: "swift-argument-parser")]),

        .target(name: "UnitLib",dependencies: ["SwiftShell", "Regex"]),
        .testTarget(
            name: "UnitDemoTests",
            dependencies: ["UnitDemo", "UnitLib","Quick", "Nimble"]),
    ]
)
