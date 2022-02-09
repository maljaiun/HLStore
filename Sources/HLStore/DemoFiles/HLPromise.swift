//
//  File.swift
//
//
//  Created by Ethan on 2022/2/9.
//

import Foundation

func aBlockingFunction() -> String {
    sleep(.random(in: 1...3))
    return "Hello world github"
}

public func syncMethod() -> String {
    return aBlockingFunction()
}

public func asyncMethod(completion block: @escaping ((String) -> Void)) {
    DispatchQueue.global(qos: .background).async {
        block(aBlockingFunction())
    }
}
/*
print(syncMethod())
print("sync method returned")
asyncMethod { value in
    print(value)
}
print("async method returned")

// "Hello world!"
// "sync method returned"
// "async method returned"
// "Hello world!"
*/
