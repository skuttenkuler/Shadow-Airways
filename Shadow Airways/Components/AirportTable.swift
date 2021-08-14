//
//  AirportTable.swift
//  Shadow Airways
//
//  Created by Sam Kuttenkuler on 8/14/21.
//

import SwiftUI

struct AirportTable: View {
    @StateObject var data = DataLoader()
    
    var body: some View {
        AirportsTable(data: data)
    }
}

struct AirportTable_Previews: PreviewProvider {
    static var previews: some View {
        AirportTable()
    }
}
struct AirportsTable: View {
    @ObservedObject var data : DataLoader

      var body: some View {
         VStack() {
            List(data.airportData){ item in
                HStack {
                    Text(item.state)
                }
            }
         }
      }
   }
