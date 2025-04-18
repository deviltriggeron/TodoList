//
//  ListView.swift
//  ToDoList
//
//  Created by Starfighter Dollie on 4/18/25.
//

import SwiftUI
import CoreData

struct ListView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    var presenter: DetailPresenter?
    
    @ObservedObject var viewState: ListViewState
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \TaskItem.dueDate, ascending: true)],
        animation: .default)
    private var items: FetchedResults<TaskItem>

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(items) { item in
                        NavigationLink {
                            VStack {
                                Text("Item at \(item.name ?? " ")")
                                Text("\(item.desc ?? " ")")
                            }
                        } label: {
                            HStack {
                                Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(item.isCompleted ? .green : .gray)
                                VStack(alignment: .leading) {
                                    Text("Item at \(item.name ?? " ")")
                                    Text("\(item.desc ?? " ")")
                                }
                            }
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                
                HStack {
                    Text(" ")
                    Spacer()
                    Text("\(items.count) задач")
                        .padding()
                    Spacer()
                    Image(systemName: "square.and.pencil")
                        .font(.system(size: 25))
                        .padding()
                }
                .frame(height: 50, alignment: .bottomTrailing)
//                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Delete all") {
                        clearDatabase()
                    }
                }
            }
            .navigationTitle("Задачи")
        }
        
    }

    private func clearDatabase() {
            let context = viewContext
            let persistentStoreCoordinator = PersistenceController.shared.container.persistentStoreCoordinator

            for entityName in persistentStoreCoordinator.managedObjectModel.entities.map({ $0.name }).compactMap({ $0 }) {
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
                let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

                do {
                    try context.execute(batchDeleteRequest)
                    print("\(entityName) cleared successfully.")
                } catch {
                    print("Failed to clear \(entityName): \(error.localizedDescription)")
                }
            }

            do {
                try context.save()
            } catch {
                print("Failed to save context after clearing database: \(error.localizedDescription)")
            }
        }
    
    private func addItem() {
        withAnimation {
            let newItem = TaskItem(context: viewContext)
            newItem.dueDate = Date()

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()
