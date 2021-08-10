//
//  BookTicketView.swift
//  Shadow Airways
//
//  Created by Sam Kuttenkuler on 8/5/21.
//

import SwiftUI

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let airData = DataLoader()
        print(airData)
    }
}
struct BookTicketView: View {
    var body: some View {
        Text("BOOK TICKET")
        
    }
}

struct BookTicketContent: View {
    //view block
    var body: some View {
        Text("hello")
        //Origin
        //Destination
        //Departure Date
        //Return Date
        //logic to get data and pass to next view
        //Navigation Link to ticket
    }
}
