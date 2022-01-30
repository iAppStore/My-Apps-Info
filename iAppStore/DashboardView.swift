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
            HStack(spacing: 4) {
                Image(ImageAssets.iAppStore.MyAppInfo.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20, alignment: .center)
            Text("info")
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .foregroundColor(Color.init(hex: "420085"))
            }
            ScrollView {
                VStack {
                    ForEach(vm.allListOfData, id: \.id) { data in
                        CellForEachApp(vm: vm, data: data)
                    }
                }
            }
        }

    }
}

struct CellForEachApp: View {
    @ObservedObject var vm: DashboardViewModel
    var data: DashboardModel
    var body: some View {
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
                                if let github = data.githubLink {
                                    Link("GitHub",
                                         destination: github)
                                }
                                Spacer()
                                
                                if let twitter = data.twitter {
                                    Link("Twitter",
                                         destination: twitter)
                                }
                                Spacer()
                                if let linkedIn = data.linkedIn {
                                    Link("LinkedIn",
                                         destination: linkedIn)
                                }
                                Spacer()
                                if let resume = data.resume {
                                    Link("Resume",
                                         destination: resume)
                                }
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
                    .tabViewStyle(.page(indexDisplayMode: data.screenShots.count <= 1 ? .never : .always))
                    ,alignment: .top
                )
                .sheet(isPresented: $vm.isPresent){
                    vm.selectedCell.view.onAppear {
                        print("Datalll \(vm.selectedCell.appName)")
                    }
                }
                .onTapGesture {
                    vm.selectedCell = data
                    vm.isPresent = true
                    print("data: \(vm.selectedCell.appName)")
                }
            
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(vm: DashboardViewModel())
    }
}
