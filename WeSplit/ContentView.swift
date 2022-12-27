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
    
    let tipPercentages = [TipPercentages.TEN, TipPercentages.FIFTHEEN, TipPercentages.TWENTY, TipPercentages.TWENTY_FIVE, TipPercentages.ZERO]
    
    var totalPerPerson: Double {
        // totalAmountPayPerPerson = (Amount of order + tip percentage) / number of people
        let peopleCount = Double(numberOfPeople + 2) // numberOfPeople start from 0 ; convert to Double because it need to be used with checkAmount
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    var body: some View {
        NavigationView { // used to create a navigation-based app in which the user can traverse a collection of views
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD")).keyboardType(.decimalPad)
                    //It shows 4 people because $numberOfPeople is 2 which is index 2 of the selection
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self.rawValue) { //we need to use self.rawValue to get selection working because it's enum
                            Text($0.rawValue, format:.percent)
                        }
                    }
                    .pickerStyle(.segmented) // segmented control. This is a specialized kind of picker that shows a handful of options in a horizontal list, and it works great when you have only a small selection to choose from.
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
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
