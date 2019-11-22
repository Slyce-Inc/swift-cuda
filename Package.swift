// swift-tools-version:5.0

import PackageDescription

#if os(Linux)
import Foundation

let fileManager = FileManager.default
guard let pcFileToUse = (try! fileManager.contentsOfDirectory(atPath:"/usr/lib/pkgconfig")
  .filter { $0.hasPrefix("cudart-") && $0.hasSuffix(".pc") }
  .sorted()
  .last) else {
  fatalError("Unable to locate a .pc for cudart")
}
let versionToUse = NSURL(fileURLWithPath:pcFileToUse).deletingPathExtension!.lastPathComponent
#else
let versionToUse = "cudart"
#endif

let package = Package(
  name: "CUDA",
  products: [ 
    .library(name: "CUDA", targets: ["CUDA"]),
    .library(name: "Clibcuda", targets: ["Clibcuda"]) 
  ],
  dependencies: [],
  targets: [
    .target(
      name: "CUDA",
      dependencies: [ "Clibcuda" ]),
    .systemLibrary(
      name: "Clibcuda", 
      pkgConfig: versionToUse, 
      providers: [
        .apt([versionToUse])
      ]), 
  ]
)
