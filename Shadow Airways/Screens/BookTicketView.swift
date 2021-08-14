//
//  BookTicketView.swift
//  Shadow Airways
//
//  Created by Sam Kuttenkuler on 8/5/21.
//
import SwiftUI
import UIKit

struct BookTicketView: View {
    
    var body: some View {
        VStack{
        Text("BOOK TICKET")
        BookTicketContent()
    }
}

struct BookTicketContent: View {
    //variables
    @State private var departure = Date()
    @State private var returnDate = Date()
   
    //view block
    var body: some View {
        //Form
        AirportTable()
        Form{
        
        //Origin
        
        //Destination
        //Departure Date
        DatePicker("Departure", selection: $departure, in: Date()...)
        //Return Date
        DatePicker("Return", selection: $returnDate, in: Date()...)
        //logic to get data and pass to next view
        //Navigation Link to ticket
        
        }
        Spacer()
        NavigationLink(destination:TicketView(), label: {
            Text("BOOK FLIGHT")
                .font(.system(size:60))
                .foregroundColor(Color.white)
                .background(Color.blue)
                .cornerRadius(20)
                
            })
        }
    }
}

