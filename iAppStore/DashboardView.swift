//
//  DashboardView.swift
//  iAppStore
//
//  Created by mohammad mugish on 28/01/22.
//

import Foundation
import SwiftUI

struct DashboardView: View {
    @ObservedObject var vm: DashboardViewModel
    var body: some View {
        VStack {
            HStack(spacing: 2) {
                Image(ImageAssets.iAppStore.iAppStoreIcon.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20, alignment: .center)
            Text("pp Store")
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .foregroundColor(Color.init(hex: "002B85"))
            }
            ScrollView {
                LazyVStack {
                    ForEach(vm.allListOfData, id: \.id) { data in
                        cellForEachApp(data: data)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func cellForEachApp(data: DashboardModel) -> some View {
        VStack(alignment: .leading) {
           
            Spacer()
            Color.black.frame(width: nil, height: 200, alignment: .center)
                .cornerRadius(22)
                .overlay(
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text(data.userName)
                            Text("-")
                            Text(data.appName)
                        }
                        .font(.system(size: 14, weight: .bold, design: .rounded))
                        Text(data.discription)
                            .lineLimit(1)
                            .font(.system(size: 12, weight: .regular, design: .rounded))
                        
                        HStack {
                            Text("GitHub")
                            Spacer()
                            Text("Twitter")
                            Spacer()
                            Text("LinkedIn")
                            Spacer()
                            Text("Resume")
                        }
                        .foregroundColor(Color.init(hex: "9BD4FF"))
                        .font(.system(size: 12, weight: .regular, design: .rounded))
                        .padding(.top, 12)
                    }.foregroundColor(.white)
                        .padding(.horizontal, 21)
                        .padding(.bottom, 14)
                    ,alignment: .bottomLeading
                )
                .padding(.horizontal, 12)
            
        }.frame(width: nil, height: UIScreen.main.bounds.height - 100, alignment: .center)
            .overlay(
                TabView {
                 ForEach(data.screenShots, id: \.self) { image in
                     Image(image)
                         .resizable()
                         .scaledToFit()
                         
                 }
                }.frame(width: nil, height: UIScreen.main.bounds.height - 180, alignment: .top)
                .tabViewStyle(.page(indexDisplayMode: data.screenShots.isEmpty ? .never : .always))
                ,alignment: .top
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(vm: DashboardViewModel())
    }
}

/* */
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
