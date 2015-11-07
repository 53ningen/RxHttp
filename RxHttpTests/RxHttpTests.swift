import Quick
import Nimble
import RxSwift
import RxBlocking

@testable import RxHttp

class RxHttpClientTest: QuickSpec {
    
    override func spec() {
        describe("RxHttpClient") {
            it("get") {
                let disposeBag = DisposeBag()
                let client = DefaultRxHttpClient(defaultTimeoutSec: 5)
                client.get(NSURL(string: "http://gochiusa.com")!, parameters: nil, headers: nil)
                    .observeOn(MainScheduler.sharedInstance)
                    .subscribeNext({ (data, response) -> Void in
                        //...do something
                    })
                    .addDisposableTo(disposeBag)
                do {
                    let array = try client.get(NSURL(string: "http://gochiusa.com")!, parameters: nil, headers: nil).toBlocking().first()
                    NSString(data: array!.0, encoding: NSUTF8StringEncoding)?.containsString("ご注文はうさぎですか")
                } catch {
                    fail()
                }
            }
        }
    }
    
}
