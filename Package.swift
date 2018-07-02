// swift-tools-version:4.0

import PackageDescription

let package = Package(
  name: "Clibcuda",
  pkgConfig: "cudart-9.0",
  providers: [
    .apt(["cuda-cudart-dev-9-0"])
  ],
  products: [ 
    .library(name: "Clibcuda", targets: ["Clibcuda"]) 
  ],
  dependencies: []
)
