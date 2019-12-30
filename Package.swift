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
  name: "swift-cuda",
  products: [
    .library(name: "CUDA", targets: ["CUDA"]),
    .library(name: "Clibcudart", targets: ["Clibcudart"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "CUDA",
      dependencies: [ "Clibcudart" ]),
    .systemLibrary(
      name: "Clibcudart",
      pkgConfig: versionToUse,
      providers: [
        .apt([versionToUse])
      ]),
  ]
)
