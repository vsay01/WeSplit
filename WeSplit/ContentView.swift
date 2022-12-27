//
//  ContentView.swift
//  WeSplit
//
//  Created by vsay on 12/26/22.
//  contains the initial user interface (UI) for your program, and is where we’ll be doing all the work in this project.

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    enum TipPercentages: Int {
        case TEN = 10
        case FIFTHEEN = 15
        case TWENTY = 20
        case TWENTY_FIVE = 25
        case ZERO = 0
    }
    
    var body: some View {
        NavigationView { // used to create a navigation-based app in which the user can traverse a collection of views
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.identifier)).keyboardType(.decimalPad)
                    //It shows 4 people because $numberOfPeople is 2 which is index 2 of the selection
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
            }.navigationTitle("WeSplit") //This is placed after Form and NOT navigationView - It allow iOS to change title freely
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
