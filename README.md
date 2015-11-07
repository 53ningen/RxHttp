RxHttp
===============

http client implementation using RxSwift and RxCocoa

This software is released under the MIT License, see LICENSE


## Usage

```swift
let disposeBag = DisposeBag()
let client = DefaultRxHttpClient(defaultTimeoutSec: 5)
client.get(NSURL(string: "http://gochiusa.com")!, parameters: nil, headers: nil)
    .observeOn(MainScheduler.sharedInstance)
    .subscribeNext({ (data, response) -> Void in
        //...do something
    })
	.addDisposableTo(disposeBag)
```

