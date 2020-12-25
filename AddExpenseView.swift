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
    
    @State var showingAlert = false
    @State var alertMsg = ""
    @State var alertTitle = ""
    
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
                        ForEach(0..<transOptions.count, id: \.self){ i in
                            Text(transOptions[i])
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
            }
            .navigationTitle("Add New Expense")
            .navigationBarItems(leading:
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }){
                    Image(systemName: "arrowshape.turn.up.backward.fill")
                }
            ,trailing:
                Button(action: {
                    if let actualPrice = Double(self.price) {
                        expenses.expenseList.append(ExpenseEntry(name: transactionName, type: transOptions[transSelection], price: actualPrice))
                        print("\(actualPrice) actual final price")
                        //Save data. Is it saved automatically because of didSet?
                        presentationMode.wrappedValue.dismiss()
                    } else{
                        showAlert(msg: "Please make sure you enter the price correctly.", title: "Error Reading Price")
                    }
                }){
                    Image(systemName: "plus")
                }
            )
            .alert(isPresented: $showingAlert){
                Alert(title: Text(alertTitle), message: Text(alertMsg), dismissButton: .default(Text("Dismiss")))
            }
        }
    }
    
    func showAlert(msg:String, title:String){
        self.alertMsg = msg
        alertTitle = title
        showingAlert = true
    }
    

    

}

struct AddExpense_UI_Previews: PreviewProvider {
    static var previews: some View {
        AddExpense_UI(expenses: Expenses())
    }
}
