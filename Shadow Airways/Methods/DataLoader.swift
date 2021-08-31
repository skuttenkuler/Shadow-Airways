//
//  DataLoader.swift
//  Shadow Airways
//
//  Created by Sam Kuttenkuler on 8/14/21.
//

import Foundation

public class DataLoader: ObservableObject {
    @Published var airportData = [States]()
    
    //initiate
    init(){
        load()
    }
    func load(){
        if let path = Bundle.main.url(forResource: "flights", withExtension: "json"){
            do{
                let data = try Data(contentsOf: path)
                let jsonDecoder = JSONDecoder()
                let jsonData = try jsonDecoder.decode([States].self, from: data)
                self.airportData = jsonData
            } catch{
                print(error)
            }
        }
    }
}
