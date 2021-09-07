//
//  TicketView.swift
//  Shadow Airways
//
//  Created by Sam Kuttenkuler on 8/5/21.
//

import SwiftUI

struct TicketView: View {
 
    var body: some View {
        ZStack{
            VStack{
            Text("FROM:").offset(x: -30,y: -95).font(.system(size:25).weight(.heavy))
            Text("TO:").offset(x: -50,y: -80).font(.system(size:25).weight(.heavy))
            Text("Departing: ").offset(x: 35,y: 138).font(.system(size:25).weight(.heavy))
            Text("Date:").offset(x: -95,y: 190).font(.system(size:25).weight(.heavy))
        Button("Book"){
            let image = snapshot()
            UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
        }.offset(x: 0 , y: 250).frame(maxWidth:.infinity)
    }.background(
        Image("Ticket2")
            .resizable()
            .edgesIgnoringSafeArea(.all)
            .frame(width:300, height: 650)
    )}
}

struct TicketView_Previews: PreviewProvider {
    static var previews: some View {
        TicketView()
    }
}
}
