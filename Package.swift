// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "DGSyntaxHighlighter",
    platforms: [
        .macOS(.v12),
        .iOS(.v15)
    ],
    products: [
        .library(name: "DGSyntaxHighlighter", targets: ["DGSyntaxHighlighter"])
    ],
    dependencies: [
        .package(url: "https://github.com/debugeek/DGExtension.git", branch: "main")
    ],
    targets: [
        .target(name: "DGSyntaxHighlighter", dependencies: [
            .product(name: "DGExtension", package: "DGExtension")
        ])
    ]
)
