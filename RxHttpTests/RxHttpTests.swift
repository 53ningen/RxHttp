import Quick
import Nimble
import RxSwift
import RxBlocking

@testable import RxHttp

class RxHttpClientTest: QuickSpec {
    
    override func spec() {
        describe("RxHttpClient") {
            it("get") {
                let client = DefaultRxHttpClient(defaultTimeoutSec: 0)
                do {
                    let array = try client.get(NSURL(string: "http://gochiusa.com")!).toBlocking().first()
                    if (NSString(data: array!.0, encoding: NSUTF8StringEncoding).map { !$0.containsString("ご注文はうさぎですか") } ?? true) {
                        fail()
                    }
                } catch {
                    fail()
                }
            }
        }
    }
    
}
