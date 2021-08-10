//
//  ViewController.swift
//  Shadow Airways
//
//  Created by Sam Kuttenkuler on 8/10/21.
//

import Foundation
import UIKit

struct Airports: Decodable {
    let state: String
}

class ViewController: UIViewController {
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    @Published var airportData = [Airports]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //get location
        if let fileLocation = Bundle.main.url(forResource: "flights", withExtension: "json") {
            //handle error
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromFile = try jsonDecoder.decode([Airports].self, from: data)
                self.airportData = dataFromFile
                print(self.airportData.count)
            } catch{
                print(error)
            }
        }
    }
}
