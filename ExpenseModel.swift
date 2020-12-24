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
    let name = ""
    let type = ""
    let price = 0
    
    let id = UUID()

}
