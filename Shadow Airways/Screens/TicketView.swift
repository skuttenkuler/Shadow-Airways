//
//  TicketView.swift
//  Shadow Airways
//
//  Created by Sam Kuttenkuler on 8/5/21.
//

import SwiftUI

struct TicketView: View {
    var body: some View {
        VStack{
            
            Text("FROM:").offset(x: -50,y: -160).font(.system(size:25).weight(.heavy))
        Text("TO:").offset(x: -70,y: -130).font(.system(size:25).weight(.heavy))
            Text("Departing:").offset(x: 20,y: 170).font(.system(size:25).weight(.heavy))
        Text("Date:").offset(x: -130,y: 260).font(.system(size:25).weight(.heavy))
        Button("Book"){
            let image = body.snapshot()
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
        }.background(
            Image("Ticket2")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
        
   
}

struct TicketView_Previews: PreviewProvider {
    static var previews: some View {
        TicketView()
    }
}
}
