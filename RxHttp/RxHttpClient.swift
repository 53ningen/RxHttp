import RxSwift
import Foundation

public typealias RequestParameter = (key: String, value: String)
public typealias RequestHeader = (key: String, value: String)

public protocol RxHttpClient {
    
    func get(url: NSURL) -> Observable<(NSData, NSHTTPURLResponse)>
    
    func get(url: NSURL, parameters: [RequestParameter]) -> Observable<(NSData, NSHTTPURLResponse)>
    
    func get(url: NSURL, parameters: [RequestParameter], headers: [RequestHeader]) -> Observable<(NSData, NSHTTPURLResponse)>

    func get(url: NSURL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: NSTimeInterval?) -> Observable<(NSData, NSHTTPURLResponse)>
    
    func post(url: NSURL) -> Observable<(NSData, NSHTTPURLResponse)>
    
    func post(url: NSURL, parameters: [RequestParameter]) -> Observable<(NSData, NSHTTPURLResponse)>

    func post(url: NSURL, parameters: [RequestParameter], headers: [RequestHeader]) -> Observable<(NSData, NSHTTPURLResponse)>

    func post(url: NSURL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: NSTimeInterval?) -> Observable<(NSData, NSHTTPURLResponse)>
    
    func put(url: NSURL) -> Observable<(NSData, NSHTTPURLResponse)>
    
    func put(url: NSURL, parameters: [RequestParameter]) -> Observable<(NSData, NSHTTPURLResponse)>

    func put(url: NSURL, parameters: [RequestParameter], headers: [RequestHeader]) -> Observable<(NSData, NSHTTPURLResponse)>

    func put(url: NSURL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: NSTimeInterval?) -> Observable<(NSData, NSHTTPURLResponse)>
    
    func delete(url: NSURL) -> Observable<(NSData, NSHTTPURLResponse)>
    
    func delete(url: NSURL, parameters: [RequestParameter]) -> Observable<(NSData, NSHTTPURLResponse)>

    func delete(url: NSURL, parameters: [RequestParameter], headers: [RequestHeader]) -> Observable<(NSData, NSHTTPURLResponse)>

    func delete(url: NSURL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: NSTimeInterval?) -> Observable<(NSData, NSHTTPURLResponse)>
    
    func execute(method: HttpMethod, url: NSURL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: NSTimeInterval?) -> Observable<(NSData, NSHTTPURLResponse)>
    
}
