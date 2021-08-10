//
//  DataLoader.swift
//  Shadow Airways
//
//  Created by Sam Kuttenkuler on 8/9/21.
//

import Foundation
//class to load data
public class DataLoader {
    @Published var airportData = [AirportData]()
    init() {
        loadData()
        print("loaded")
    }
    
    //load data
    func loadData() {
        
        //get location
        if let fileLocation = Bundle.main.url(forResource: "flights", withExtension: "json") {
            //handle error
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromFile = try jsonDecoder.decode([AirportData].self, from: data)
                self.airportData = dataFromFile
            } catch{
                print(error)
            }
        }
    }
    
    
    
}
