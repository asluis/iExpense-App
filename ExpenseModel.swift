//
//  ExpenseEntry.swift
//  iExpense App
//
//  Created by Luis Alvarez on 12/23/20.
//

import Foundation



class Expenses: ObservableObject{
    
    @Published var expenseList = [ExpenseEntry]()
    
    
}


struct ExpenseEntry: Hashable, Identifiable{
    let name:String
    let type:String
    let price:Double
    
    init(name:String, type:String, price: Double){
        self.name = name
        self.type = type
        self.price = price
    }
    
    let id = UUID()

}
