import UIKit
import RxSwift

let bag = DisposeBag()

let hello = Observable.from(["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"])

hello
    .map { string -> Int in
        Int(string) ?? 0
    }
    .filter { $0 % 2 == 0 }
    .subscribe(onNext: { value in
        print(value)
    }, onError: { error in
        print(error)
    }, onCompleted: {
        print("Completed")
    }) {
        print("Disposed")
    }
    .disposed(by: bag)

//let bag = DisposeBag()

Observable.of(2, 4, 6, 8, 0, 12, 1, 3, 4, 6, 2)
    .enumerated()
    .takeWhile { index, value in
        value%2 == 0 && index < 3
    }
    .subscribe(onNext: { (value) in
        print(value)
    })
    .disposed(by: bag)

//let button = PublishSubject<Void>()
//let textField = PublishSubject<String>()
//
//let observable = button.withLatestFrom(textField)
//  
//  _ = observable
//      .subscribe(onNext: { value in
//          print(value)
//      })
//
//  textField.onNext("Đa")
//  textField.onNext("Đà Na")
//  textField.onNext("Đà Nẵng")
//  
//  button.onNext(())
//  button.onNext(())

let source = Observable.of(1, 2, 3, 4, 5, 6, 7, 8, 9)

let observable = source.reduce(0, accumulator: +)

_ = observable
    .subscribe(onNext: { value in
        print(value)
    })
