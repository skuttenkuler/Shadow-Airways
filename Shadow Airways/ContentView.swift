//
//  ContentView.swift
//  Shadow Airways
//
//  Created by Sam Kuttenkuler on 8/5/21.
//

import SwiftUI
import UIKit
import ExternalAccessory

struct HomeView: View {
    var body: some View {
        //add navView
        NavigationView {
            VStack{
                
            HomeContent()

            }.background(
                Image("background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            )
    
        }
    }
}

struct HomeContent: View {
    //view block
    
    var body: some View {
        Text("Shadow Airways")
            .font(.system(size: 40))
            .bold()
            .italic()
            .offset(y: -25)
        Spacer()
        
        NavigationLink(destination:BookTicketView(), label: {
            Text("Book Flight")
                .font(.system(size:60))
                .foregroundColor(Color.white)
                .background(Color.blue)
                .cornerRadius(20)
                
            })
}
}
