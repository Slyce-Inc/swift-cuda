// swift-tools-version:4.0

import PackageDescription

let package = Package(
  name: "Clibcuda",
  pkgConfig: "cuda-9.0",
  providers: [
    .apt(["cuda-dev"])
  ],
  products: [ 
    .library(name: "Clibcuda", targets: ["Clibcuda"]) 
  ],
  dependencies: []
)
