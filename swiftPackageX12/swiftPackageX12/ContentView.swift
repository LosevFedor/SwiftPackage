//
//  ContentView.swift
//  swiftPackageX12
//
//  Created by Fedor Losev on 20.08.2020.
//

import SwiftUI
import PackageLib

struct ContentView: View {
    var body: some View {
      VStack{
        HStack{
          Image(uiImage: PackageLib().getPngImage())
            .resizable()
            .frame(width: 100, height: 100, alignment: .center)
          Text("This is PNG image from PackageLib")
        }
        HStack{
          let medias = PackageLib().getImageFroMediaFolder()
          ForEach (medias, id:\.self) { media in
            Image(media, bundle: PackageLib().getCurrentBundle())
              .frame(width: 100, height: 100, alignment: .center)
          }
          Text("This is images from Media.xcassets")
        }
        HStack{
          Text(PackageLib().getDatasFromCsvFile())
        }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
