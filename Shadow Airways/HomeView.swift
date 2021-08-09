//
//  HomeView.swift
//  Shadow Airways
//
//  Created by Sam Kuttenkuler on 8/5/21.
//

import SwiftUI

//set location struct
struct Location: Decodable {
    var name: String?
}

struct HomeView: View {
    var body: some View {
        Text("HOME")
        Picker(<#T##titleKey: LocalizedStringKey##LocalizedStringKey#>, selection: Binding<<<error type>>>, content: <#T##() -> _#>)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
