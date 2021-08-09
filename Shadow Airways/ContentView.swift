//
//  ContentView.swift
//  Shadow Airways
//
//  Created by Sam Kuttenkuler on 8/5/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        //add navView
        NavigationView {
            VStack{
                
            HomeContent()
            NavigationLink(destination:BookTicketView(), label: {
                Text("Book Flight")
                    .foregroundColor(Color.red)
                    .background(Color.blue)
                
            })
            }
    
        }
    }
}

struct HomeContent: View {
    //view block
    var body: some View {
        Text("Home Page")
            
    }
}
