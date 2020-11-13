//
//  ContentView.swift
//  PurplePumpkinHalloween
//
//  Created by Raphael Cerqueira on 07/11/20.
//

import SwiftUI

struct ContentView: View {
    @State var showDetails = false
    
    var body: some View {
        ZStack {
            HomeView(showDetails: $showDetails)
            
            if showDetails {
                TicketView(showDetails: $showDetails)
                    .animation(.spring())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
