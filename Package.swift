// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "BarBar",
    platforms: [
        .macOS(.v14)
    ],
    targets: [
        .executableTarget(
            name: "BarBar"
        )
    ]
)
