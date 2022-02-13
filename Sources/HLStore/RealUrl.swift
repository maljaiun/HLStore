//
//  File.swift
//  
//
//  Created by Ethan on 2022/2/10.
//

import Foundation
//import Alamofire
import Alamofire
// Douyin Sharelink remove Han Charactors Get only link  v.douyin.com/xxxx
//
/* link(v.douyin.com/xxxx) to {
        Mobile amedavCom ----> m3u8
        Desktop  livecom/xxx (Desktop livecomurl request with mobile agent will find m3u8 also
 */







func douyin(amemvcomUrl: String, fetcherStreamUrl completion: @escaping ((String) -> Void))
{
    completion("hellll")
    
    
}

func inspectHtmlStreamUrl(from amemvcomUrl: String) async throws -> String {
    sleep(UInt32(Int.random(in: 1...3)))
    print("hellolife")
    
//    let vDYlink = "https://v.douyin.com/LsQMH6o"
    let amemv = "https://webcast.amemv.com/douyin/webcast/reflow/7063493947407600419"
    
//    let headers = HTTPHeaders(["User-Agent" : "Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, ''like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1"])
    guard let url = URL(string: amemv) else {
        throw fatalError()
    }
    let config = URLSessionConfiguration.default
    config.httpAdditionalHeaders = ["User-Agent" : "Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, ''like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1"]
    let session = URLSession.init(configuration: config)
    print("session start")
    session.dataTask(with: url) { data, _, _ in
        print("session done....")
        if let str  = String(data: data!, encoding: .utf8) {
            print("html-\(str)")
            if let range = str.range(of: #"hls_pull_url":"(.*?m3u8)"#, options: .regularExpression) {
                let hls = str[range]
                print("hls------")
                print(hls)
                print("------")
//                return "found"
            }
            else {
                fatalError()
            }
        }
        else {
            fatalError()
        }
    }
//    session.dataTask(with: url) { d, r, e in
//        if let str  = String(data: data as Data, encoding: .utf8) {
//            print("html-\(str)")
//            if let range = str.range(of: #"hls_pull_url":"(.*?m3u8)"#, options: .regularExpression) {
//                let hls = str[range]
//                print("hls------")
//                print(hls)
//                print("------")
////                return "found"
//            }
//            else {
//                fatalError()
//            }
//        }
//        else {
//            fatalError()
//        }
//    }
//    let (data, _) = try await session.data(from: url)
//    if let str  = String(data: data as Data, encoding: .utf8) {
//        print("html-\(str)")
//        if let range = str.range(of: #"hls_pull_url":"(.*?m3u8)"#, options: .regularExpression) {
//            let hls = str[range]
//            print("hls------")
//            print(hls)
//            print("------")
//            return "found"
//        }
//        else {
//            fatalError()
//        }
//    }
//    else {
//        fatalError()
//    }
//
//
//
//
    return "hahaha"
}

func afclojure() {
    let amemv = "https://webcast.amemv.com/douyin/webcast/reflow/7063793612764564260"

    
        let headers = HTTPHeaders(["User-Agent" : "Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, ''like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1"])
    
        AF.request(amemv, headers: headers).response { response in
    
    
    //           print("Debug---------------")
    //            debugPrint(response)
    //            print("Debug---------------")
    //            print(response.description)
            if let str: String = String(data: response.data!, encoding: .utf8) {
                print(str)
                if let range = str.range(of: #"hls_pull_url":"(.*?m3u8)"#, options: .regularExpression) {
                    let hls = str[range]
                    print("hls------")
                    print(hls)
                    print("------")
                }
            }
        }
    
}
func asyncclojure() {
    let amemv = "https://webcast.amemv.com/douyin/webcast/reflow/7063793612764564260"
    
//    let headers = HTTPHeaders(["User-Agent" : "Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, ''like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1"])
  
    guard let url = URL(string: amemv) else {
        print("url error")
        return
    }
    let config = URLSessionConfiguration.default
    config.httpAdditionalHeaders = ["User-Agent" : "Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, ''like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1"]
    let session = URLSession.init(configuration: config)
    print("session start")
    let task = session.dataTask(with: url) { data, _, _ in
        print("session done....")
        if let str  = String(data: data!, encoding: .utf8) {
//            print("html-\(str)")
            if let range = str.range(of: #"hls_pull_url":"(.*?m3u8)"#, options: .regularExpression) {
                let hls = str[range]
                print("hls------")
                print(hls)
                print("------")
//                return "found"
            }
            else {
                fatalError()
            }
        }
        else {
            fatalError()
        }
    }
    task.resume()
}

public func douyinFetcher(shareLink: String, handleDY dyHandler: @escaping ((String) -> Void)) {
//    asyncclojure()
    afclojure()
    
//    douyin(amemvcomUrl: shareLink) { streamUrl in
//                dyHandler(streamUrl)
//
//
//        Task {
//            let msg: String = try await inspectHtmlStreamUrl(from: "test Async Await")
//            dyHandler(msg)
//        }
//    }
    /*
    promise {
        clearUnusedCharactersAndOnlyPassLinkVdouyincomlalala()
        thengetrequestmobiledirecturlamemvcom
        thenrequesgtamemvtogetm3u8url
    }*/
    
    
//    let headers = HTTPHeaders(["User-Agent" : "Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, ''like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1"])
//
//    AF.request(amemv, headers: headers).response { response in
//
//
////           print("Debug---------------")
////            debugPrint(response)
////            print("Debug---------------")
////            print(response.description)
//        if let str: String = String(data: response.data!, encoding: .utf8) {
//            print(str)
//            if let range = str.range(of: #"hls_pull_url":"(.*?m3u8)"#, options: .regularExpression) {
//                let hls = str[range]
//                print("hls------")
//                print(hls)
//                print("------")
//            }
//        }
//    }
}


//func aBlockingFunction() -> String {
//    sleep(.random(in: 1...3))
//    return "Hello world github"
//}
//
//public func syncMethod() -> String {
//    return aBlockingFunction()
//}
//
//public func asyncMethod(completion block: @escaping ((String) -> Void)) {
//    DispatchQueue.global(qos: .background).async {
//        block(aBlockingFunction())
//    }
//}

