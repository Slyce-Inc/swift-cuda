// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "libcuda",
    pkgConfig: "cuda-9.0",
    providers: [
        .apt(["cuda-dev"])
    ],
    products: [ .library(name: "libcuda", targets: ["libcuda"]) ],
    dependencies: [
    ]
)
