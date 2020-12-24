//
//  AddExpense_UI.swift
//  iExpense App
//
//  Created by Luis Alvarez on 12/23/20.
//

import SwiftUI

struct AddExpense_UI: View {
    
    @ObservedObject var expenses:Expenses
    
    @State var price = ""
    @State var transactionName = ""
    @State var transSelection = 0
    
    @Environment(\.presentationMode) var presentationMode
    
    let transOptions = ["Personal", "Business"]
    
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Add transaction details")){
                    TextField("Transaction Price", text: $price)
                    TextField("Transaction Name", text: $transactionName)
                }
                
                Section(header: Text("Select transaction type")){
                    Picker("", selection: $transSelection){
                        ForEach(transOptions, id: \.self) { type in
                            Text(type)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
            }
            .navigationTitle("Add New Expense")
            .navigationBarItems(leading:
                Button(action: {
                    //TODO: Reset state
                    
                    presentationMode.wrappedValue.dismiss()
                }){
                    Image(systemName: "arrowshape.turn.up.backward.fill")
                }
            ,trailing:
                Button(action: {
                    // TODO: Perform action of adding expense to list
                    presentationMode.wrappedValue.dismiss()
                }){
                    Image(systemName: "plus")
                }
            )
        }
    }
}

struct AddExpense_UI_Previews: PreviewProvider {
    static var previews: some View {
        AddExpense_UI(expenses: Expenses())
    }
}
