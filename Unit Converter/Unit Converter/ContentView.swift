//
//  ContentView.swift
//  Unit Converter
//
//  Created by Millie Kembe on 2/20/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputNumber = 0.0
    @State private var inputUnit = "Liters"
    @State private var outputUnit = "Cups"
    @FocusState private var inputValueIsFocused: Bool
    
    let units = ["mL", "Liters", "Cups", "Pints", "Gallons"]
    
    var conversion: Double {
        
        var toMil = 0.0
        var convertedVal = 0.0
        
        if(inputUnit == "mL") {
            toMil = inputNumber
        }
        else if(inputUnit == "Liters"){
            toMil = inputNumber * 1000
        }
        else if(inputUnit == "Cups"){
            toMil = inputNumber * 236.588
        }
        else if(inputUnit == "Pints"){
            toMil = inputNumber * 473.176
        }
        else {
            toMil = inputNumber * 3785.41
        }
        
        if(outputUnit == "mL") {
            convertedVal = toMil
        }
        else if(outputUnit == "Liters"){
            convertedVal = toMil * 0.001
        }
        else if(outputUnit == "Cups"){
            convertedVal = toMil * 0.00422675
        }
        else if(outputUnit == "Pints"){
            convertedVal = toMil * 0.00211338
        }
        else {
            convertedVal = toMil * 0.000264172
        }
        
        return convertedVal
        
    }
    
    
    
    
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    TextField("Input Value", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputValueIsFocused)
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Input Value and Unit")
                }
                
                Section {
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Output Unit")
                }
                
                Section {
                    Text(conversion, format: .number)
                } header: {
                    Text("Output")
                }
                
                
            }
            .navigationTitle("Volume Conversion")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        inputValueIsFocused = false
                    }
                }
            }
            
            
            
            
            
            
            
            
            
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
