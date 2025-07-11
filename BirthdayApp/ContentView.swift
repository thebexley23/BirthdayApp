//
//  ContentView.swift
//  BirthdayApp
//
//  Created by Scholar on 7/11/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var friends: [Friend] = [Friend(name: "John", birthday: .now),
                                            Friend(name: "Samantha", birthday:Date(timeIntervalSince1970: 0)) ]
    @State private var newName = ""
    @State private var newBirthday: Date = .now
    var body: some View {
        NavigationStack{
            List(friends, id: \.name) { friend in
                HStack{
                    Text(friend.name)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                    
                }
            }
            .navigationTitle("Awesome Birthday App")
            .safeAreaInset(edge: .bottom){
                
                VStack(alignment: .center, spacing: 20){
                    Text("New Birthday")
                        .font(.headline)
                    DatePicker(selection: $newBirthday,
                               in: Date.distantPast...Date.now,displayedComponents: .date){
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                        //textFiel
                    }
                    Button("pls save me") {
                        let newFriend = Friend(name: newName, birthday: newBirthday)
                        modelContext.insert(newFriend)
                    }
                    //we cannot have a birthday in the future
                }
            }
        }
    }
}
    
#Preview {
        ContentView()
        .modelContainer(for: Friend.self, inMemory: true)
    }

