//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by M1 on 10.06.2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var description: String = ""
    @State private var amount: String = ""
    @FetchRequest(entity: Expense.entity(), sortDescriptors: [])
    var expenses: FetchedResults<Expense>
    @Environment(\.managedObjectContext) var moc

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Description", text: $description)
                    TextField("Amount", text: $amount)
                        .keyboardType(.decimalPad)
                    Button(action: {
                        let expense = Expense(context: self.moc)
                        expense.descriptionText = self.description
                        expense.amount = Double(self.amount) ?? 0.0
                        try? self.moc.save()
                    }) {
                        Text("Add Expense")
                    }
                }
                List {
                    ForEach(expenses, id: \.self) { expense in
                        HStack {
                            Text(expense.descriptionText ?? "Unknown")
                            Spacer()
                            Text("$\(expense.amount, specifier: "%.2f")")
                        }
                    }
                    .onDelete(perform: deleteExpenses)
                }
            }
            .navigationBarTitle("Expenses")
        }
    }

    func deleteExpenses(at offsets: IndexSet) {
        for index in offsets {
            let expense = expenses[index]
            moc.delete(expense)
        }
        try? moc.save()
    }
}
