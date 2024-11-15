//
//  ContentView.swift
//  ToggleCard
//
//  Created by Shreyas Vilaschandra Bhike on 15/11/24.
//
//  MARK: Instagram
//  TheAppWizard
//  MARK: theappwizard2408

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color("bg").ignoresSafeArea(.all)
            VStack {
                HStack{
                    ToggleCard(
                            content: "Wi-Fi",
                            icon: "wifi",
                            inActiveIcon: "wifi.slash",
                            activeColor: Color.blue,
                            inactiveColor: Color("bg2")
                          )
                               
                    ToggleCard(
                             content: "Fan",
                             icon: "fan.fill",
                             inActiveIcon: "fan.slash",
                             activeColor: Color.green,
                             inactiveColor: Color("bg2")
                            )
                }
                HStack{
                    ToggleCard(
                             content: "Lamp",
                             icon: "lamp.floor.fill",
                             inActiveIcon: "lamp.floor",
                             activeColor: Color.yellow,
                             inactiveColor: Color("bg2")
                            )
                               
                    ToggleCard(
                             content: "Privacy",
                             icon: "eye.fill",
                             inActiveIcon: "eye.slash",
                             activeColor: Color.pink,
                             inactiveColor: Color("bg2")
                               )
                }
            }
        }
    }
}


struct ToggleCard: View {
    @State private var isTapped = false
    @State private var splashOpacity = 0.0
    
    var content: String
    var icon: String
    var inActiveIcon: String
    var activeColor: Color
    var inactiveColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(isTapped ? activeColor : inactiveColor)
                .overlay(
                    Circle()
                        .fill(Color.white.opacity(0.5))
                        .scaleEffect(isTapped ? 2.5 : 0.1)
                        .opacity(splashOpacity)
                )
                .animation(.easeOut(duration: 0.6), value: isTapped)
                .onTapGesture {
                    withAnimation {
                        isTapped.toggle()
                        splashOpacity = 1.0
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation {
                            splashOpacity = 0.0
                        }
                    }
                }
            
            VStack {
                Image(systemName: isTapped ? icon : inActiveIcon)
                    .font(.system(size: 35))
                    .foregroundStyle(.white)
                
                Spacer().frame(height: 10)
                
                Text(isTapped ? "\(content) Enabled" : "\(content) Disabled")
                    .font(.callout)
                    .foregroundStyle(.white)
            }
            .padding(10)
        }
        .frame(width: 180, height: 150)
    }
}




#Preview {
    ContentView()
}
