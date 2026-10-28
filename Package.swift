// swift-tools-version: 6.1
import PackageDescription

// GRDB.swift 7.11.1 with SQLCipher, for Mosaic (see MOSAIC.md). Sources are upstream, unchanged.
let package = Package(
    name: "GRDB",
    platforms: [.macOS(.v10_15), .iOS(.v13)],
    products: [.library(name: "GRDB", targets: ["GRDB"])],
    dependencies: [
        .package(url: "https://github.com/sqlcipher/SQLCipher.swift.git", exact: "4.20.0"),
    ],
    targets: [
        .target(name: "GRDBSQLCipher", dependencies: [
            .product(name: "SQLCipher", package: "SQLCipher.swift"),
        ]),
        .target(
            name: "GRDB",
            dependencies: [
                .product(name: "SQLCipher", package: "SQLCipher.swift"),
                .target(name: "GRDBSQLCipher"),
            ],
            path: "GRDB",
            resources: [.copy("PrivacyInfo.xcprivacy")],
            cSettings: [.define("SQLITE_HAS_CODEC")],
            swiftSettings: [
                .define("SQLITE_ENABLE_FTS5"), .define("SQLITE_ENABLE_SNAPSHOT"),
                .define("SQLITE_HAS_CODEC"), .define("SQLCipher"),
                .enableUpcomingFeature("MemberImportVisibility"),
            ]),
    ],
    swiftLanguageModes: [.v6]
)
