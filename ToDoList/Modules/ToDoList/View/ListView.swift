//
//  ListView.swift
//  ToDoList
//
//  Created by Starfighter Dollie on 4/18/25.
//

import SwiftUI

struct ListView: View, ListViewProtocol {
    
    @StateObject var viewState: ListViewState = ListViewState()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewState.items, id: \.id) { item in
                        NavigationLink {
//                            VStack {
//                                Text("Item at \(item.name)")
//                                Text("\(item.desc)")
//                            }
                        } label: {
                            HStack {
                                Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(item.isCompleted ? .green : .gray)
                                VStack(alignment: .leading) {
                                    Text("Item at \(item.name)")
                                    Text("\(item.desc)")
                                }
                            }
                        }
                    }
                    .onDelete(perform: viewState.deleteItems)
                }
                HStack {
                    Text(" ")
                    Spacer()
                    Text("\(viewState.items.count) задач")
                        .padding()
                    Spacer()
                    Image(systemName: "square.and.pencil")
                        .font(.system(size: 25))
                        .padding()
                }
                .frame(height: 50, alignment: .bottomTrailing)
            }
            .toolbar { // delete
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Delete all") {
                        viewState.clearDatabase()
                    }
                }
            } // delete
            .navigationTitle("Задачи")
            .onAppear {
                viewState.retrieveTasks()
            }
        }
        
    }


}


