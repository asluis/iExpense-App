//
//  ExpenseEntry.swift
//  iExpense App
//
//  Created by Luis Alvarez on 12/23/20.
//

import Foundation



class Expenses: ObservableObject{
    
    @Published var expenseList = [ExpenseEntry]() {
        didSet{
            saveData()
        }
    }
    
    
    init(){
        expenseList = extractData()
    }
    
    func extractData() -> [ExpenseEntry] {
        if let data = UserDefaults.standard.data(forKey: "expenseList"){
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ExpenseEntry].self, from: data){
                return decoded
            }
        }
        return []
    }
    
    func saveData(){
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(self.expenseList) {
            UserDefaults.standard.set(data, forKey: "expenseList")
        }
    }
    
}

struct ExpenseEntry: Codable, Identifiable{
    let name:String
    let type:String
    let price:Double
    let id = UUID()

    init(name:String, type:String, price: Double){
        self.name = name
        self.type = type
        self.price = price
    }
}
