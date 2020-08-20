
import UIKit

protocol ProtocolPackageLib{
  init()
  var imagePngFile: String { get }
  var imagePlusBlue: String { get }
  var imagePlusPurple: String { get }
  var someCsvFile: String { get }
  
  func getPngImage() -> UIImage
  func getImageFroMediaFolder() -> [String]
  func openCSV(fileName:String, fileType: String)-> String?
  func getDatasFromCsvFile() -> String
}


@available(iOS 13.0, *)
public struct PackageLib: ProtocolPackageLib {
  
  // MARK: Init must be public
  public init(){}
  
  // MARK: - Internal propery
  var imagePngFile = PngFiles.plusGreen.rawValue
  var imagePlusBlue = MediaFiles.plusBlue.rawValue
  var imagePlusPurple = MediaFiles.plusPurple.rawValue
  var someCsvFile = CsvFiles.someCsvFile.rawValue
  
  // MARK: - Internal Func
  func openCSV(fileName:String, fileType: String)-> String?{
    guard let filepath = Bundle.module.path(forResource: fileName, ofType: fileType)
    else {
      return nil
    }
    do {
      let contents = try String(contentsOfFile: filepath, encoding: .utf8)
      
      return contents
    } catch {
      print("File Read Error for file \(filepath)")
      return nil
    }
  }
  
  // MARK: Public func
  public func getPngImage() -> UIImage{
    return UIImage(named: imagePngFile, in: Bundle.module, with: nil)!
  }
  
  public func getCurrentBundle() -> Bundle{
    return Bundle.module
  }
  
  public func getImageFroMediaFolder() -> [String]{
    let arrayFromMedia = [imagePlusBlue, imagePlusPurple]
    return arrayFromMedia
  }
  
  public func getDatasFromCsvFile() -> String {
    let dataString: String = openCSV(fileName: someCsvFile, fileType: ExtensionFiles.csv.rawValue) ?? "Can't open CSV file"
    return dataString
  }
}

