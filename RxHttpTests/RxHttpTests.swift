import Quick
import Nimble
import RxSwift
import RxBlocking

@testable import RxHttp

class RxHttpClientTest: QuickSpec {
    
    override func spec() {
        describe("RxHttpClient") {
            it("get") {
                let client = DefaultRxHttpClient(defaultTimeoutSec: 5)
                do {
                    let array = try client.get(NSURL(string: "http://gochiusa.com")!, parameters: nil, headers: nil).toBlocking().first()
                    if let string = NSString(data: array!.0, encoding: NSUTF8StringEncoding) {
                        string.containsString("ご注文はうさぎですか")
                    } else {
                        fail()
                    }
                } catch {
                    fail()
                }
            }
        }
    }
    
}
