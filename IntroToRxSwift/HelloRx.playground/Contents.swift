import UIKit
import RxSwift

//just: phat di 1 lan duy nhat
let helloRx = Observable.just("Hello RxSwift")
    helloRx.subscribe { (value) in
        print(value)
}

let iOS = 1
let android = 2
let flutter = 3
let observable1 = Observable<Int>.just(iOS)

let observable = Observable<Void>.empty()

observable.subscribe(
  onNext: { element in
    print(element)
},
  onCompleted: {
    print("Completed")
  }
)

enum FileError: Error {
     case pathError
 }
 
 let bag = DisposeBag()
 
// func readFile(path: String?) -> SingleTrait<String> {
//     return SingleTrait.create { single -> Disposable in
//         if let path = path  {
//             single(.success("Success!"))
//         } else {
//             single(.failure(FileError.pathError))
//         }
//
//         return Disposables.create()
//     }
// }
//
//readFile(path: nil)
//    .subscribe { event in
//        switch event {
//        case .success(let value):
//            print(value)
//        case .error(let error):
//            print(error)
//        }
//    }.disposed(by: bag)

let subject = PublishSubject<String>()

subject.onNext("1")

let subscription1 = subject
    .subscribe(onNext: { value in
        print("Sub 1: ", value)
    })

subject.onNext("2")

let subscription2 = subject
    .subscribe(onNext: { value in
        print("Sub 2: ", value)
    })

subject.onNext("3")
subject.onNext("4")
subject.onNext("5")
