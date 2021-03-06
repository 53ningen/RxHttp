import RxSwift
import RxCocoa
import Foundation

public class DefaultRxHttpClient: RxHttpClient {
    
    private let defaultTimeoutSec: NSTimeInterval
    
    public init(defaultTimeoutSec: NSTimeInterval) {
        self.defaultTimeoutSec = defaultTimeoutSec
    }
    
    public func get(url: NSURL) -> Observable<(NSData, NSHTTPURLResponse)> {
        return get(url, parameters: nil, headers: nil, timeoutSec: nil)
    }
    
    public func get(url: NSURL, parameters: [RequestParameter]) -> Observable<(NSData, NSHTTPURLResponse)> {
        return get(url, parameters: parameters, headers: nil, timeoutSec: nil)
    }
    
    public func get(url: NSURL, parameters: [RequestParameter], headers: [RequestHeader]) -> Observable<(NSData, NSHTTPURLResponse)> {
        return get(url, parameters: parameters, headers: headers, timeoutSec: nil)
    }
    
    public func get(url: NSURL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: NSTimeInterval?) -> Observable<(NSData, NSHTTPURLResponse)> {
        return action(.GET, url: url, parameters: parameters, headers: headers, timeoutSec: timeoutSec)
    }
    
    public func post(url: NSURL) -> Observable<(NSData, NSHTTPURLResponse)> {
        return post(url, parameters: nil, headers: nil, timeoutSec: nil)
    }
    
    public func post(url: NSURL, parameters: [RequestParameter]) -> Observable<(NSData, NSHTTPURLResponse)> {
        return post(url, parameters: parameters, headers: nil, timeoutSec: nil)
    }
    
    public func post(url: NSURL, parameters: [RequestParameter], headers: [RequestHeader]) -> Observable<(NSData, NSHTTPURLResponse)> {
        return post(url, parameters: parameters, headers: headers, timeoutSec: nil)
    }
    
    public func post(url: NSURL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: NSTimeInterval?) -> Observable<(NSData, NSHTTPURLResponse)> {
        return action(.POST, url: url, parameters: parameters, headers: headers, timeoutSec: timeoutSec)
    }
    
    public func put(url: NSURL) -> Observable<(NSData, NSHTTPURLResponse)> {
        return put(url, parameters: nil, headers: nil, timeoutSec: nil)
    }
    
    public func put(url: NSURL, parameters: [RequestParameter]) -> Observable<(NSData, NSHTTPURLResponse)> {
        return put(url, parameters: parameters, headers: nil, timeoutSec: nil)
    }
    
    public func put(url: NSURL, parameters: [RequestParameter], headers: [RequestHeader]) -> Observable<(NSData, NSHTTPURLResponse)> {
        return put(url, parameters: parameters, headers: headers, timeoutSec: nil)
    }

    public func put(url: NSURL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: NSTimeInterval?) -> Observable<(NSData, NSHTTPURLResponse)> {
        return action(.PUT, url: url, parameters: parameters, headers: headers, timeoutSec: timeoutSec)
    }
    
    public func delete(url: NSURL) -> Observable<(NSData, NSHTTPURLResponse)> {
        return delete(url, parameters: nil, headers: nil, timeoutSec: nil)
    }
    
    public func delete(url: NSURL, parameters: [RequestParameter]) -> Observable<(NSData, NSHTTPURLResponse)> {
        return delete(url, parameters: parameters, headers: nil, timeoutSec: nil)
    }
    
    public func delete(url: NSURL, parameters: [RequestParameter], headers: [RequestHeader]) -> Observable<(NSData, NSHTTPURLResponse)> {
        return delete(url, parameters: parameters, headers: headers, timeoutSec: nil)
    }
    
    public func delete(url: NSURL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: NSTimeInterval? = nil) -> Observable<(NSData, NSHTTPURLResponse)> {
        return action(.DELETE, url: url, parameters: parameters, headers: headers, timeoutSec: timeoutSec)
    }
    
    public func execute(method: HttpMethod, url: NSURL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: NSTimeInterval?) -> Observable<(NSData, NSHTTPURLResponse)> {
        return action(method, url: url, parameters: parameters, headers: headers, timeoutSec: timeoutSec)
    }
    
    private func action(method: HttpMethod, url: NSURL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: NSTimeInterval?) -> Observable<(NSData, NSHTTPURLResponse)> {
        if let request = URLUtils.createRequest(method, url: url, params: parameters, headers: headers, timeoutSec: timeoutSec ?? defaultTimeoutSec) {
            return NSURLSession.sharedSession().rx_response(request)
        } else {
            return Observable.error(NSError(domain: "RxHttp", code: 1, userInfo: nil))
        }
    }
    
}
