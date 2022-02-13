//
//  File.swift
//  
//
//  Created by Ethan on 2022/2/10.
//

import SwiftUI


struct Food: Identifiable, Decodable {
    var id: Int
    var uid: String
    var dish: String
    var description: String
    var ingredient: String
    var measurement: String
}

func getRandomFood() async throws {
    guard let url = URL(string: "https://random-data-api.com/api/food/random_food") else { fatalError("Missing URL") }
    let urlRequest = URLRequest(url: url)
    let (data, response) = try await URLSession.shared.data(for: urlRequest)

    guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
    let decodedFood = try JSONDecoder().decode(Food.self, from: data)
    print("Async decodedFood", decodedFood)
    
}
/*
 // ContentView.swift

 .task {
         do {
                 try await network.getRandomFood()
         } catch {
                 print("Error", error)
         }
 }
 */



//Mark ---
func giveTwo() async throws -> Int {
    try await Task.sleep(nanoseconds: 2_000_000_000)
    return 2
}
func giveThree() async throws -> Int {
    try await Task.sleep(nanoseconds: 3_000_000_000)
    return 3
}
public struct AsyncLetBindingView: View {
    @State var result: Int = 0

    @State var time: Date = Date.now
    
    public var body: some View {
        VStack {
            VStack {
                Text(time, style: .timer)
            }.background(.green)
            VStack {
                Text("result is \(result)")
            }.onTapGesture {
                time = Date.now
                result = 0
                
                Task {
                    let a = try await giveTwo()
                    let b = try await giveThree()
                    result = a + b
                }
                
                
                
                
//                Task {
//                    async let a = giveTwo()
//                    async let b = giveThree()
//
//                    do {
//                        result = try await (a + b)
//                    }
//                }
                
                
                
                
            }
        }
    }
}
struct AsyncLetBindingView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncLetBindingView()
    }
}


//---
