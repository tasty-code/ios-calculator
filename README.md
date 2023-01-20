> 계산기 프로젝트 Step ✌️
>
> 팀원 : Miro, Avery
>
> 기간 : 1월 16일 ~ 1월 20일

---

# 학습 내용 정리 🫧

## 1. 제네릭 타입 이름 정하기

- Swift API Design Guidelines의 [Promote Clear Usage](https://www.swift.org/documentation/api-design-guidelines/#promote-clear-usage)에서는 가능한 불필요한 단어의 사용을 지양하고, Type 이라는 말 대신 해당 프로퍼티의 용도를 설명할 수 있는 이름을 사용할 것을 권장하고 있어요.

> More words may be needed to clarify intent or disambiguate meaning, but those that are redundant with information the reader already possesses should be omitted. In particular, omit words that *merely repeat* type information.
> 
- 아래의 Element Type은 Type이라는 단어가 중복되어서 사용됐어요. (이미 Type인게 자명한데..)

```swift
struct CalculatorItemQueue<ElementType: CalculateItem> { }
```

- 따라서 아래와 같이 Type을 지워요.

```swift
struct CalculatorItemQueue<Element: CalculateItem> { }
```

### 또 다른 예시

- 아래와 같은 코드는 element가 중복되는 코드이다. **(BAD CODE)**

```swift
public mutating func removeElement(_ member: Element) -> Element?

allViews.removeElement(cancelButton)
```

- 아래와 같이 element를 없애주는 것이 좋다. **(GOOD CODE)**

```swift
public mutating func remove(_ member: Element) -> Element?

allViews.remove(cancelButton) // clearer
```

### 제네릭 타입 제한 주기

- 아래와 같이 제네릭 타입일 경우, 모든 타입을 허용하는 것이 아닌, 특정 타입(**Double**)만을 받도록 하고 싶다면?
- 아래와 같이 Element type은 `CalculateItem` protocol을 채택하게 해주자.

```swift
struct CalculatorItemQueue<Element: CalculateItem> {
    
    var elements = [Element]()
}
```

- 그리고, 원하는 타입이 해당 프로토콜을 채택하게 한다. 즉, **Double**은 `CalculateItem` protocol을 만족하므로, Element에 **Double** 타입이 들어가도 되는 것이다!

```swift
protocol CalculateItem { }

extension Double: CalculateItem { }
```

**추가적으로.**

또한, 제약을 거는 방법으로 **Double의 extension을 활용** 하는 것 또한 멋진 방법이라고 생각해요 😆👍

제가 생각한 방향은 [Numeric](https://developer.apple.com/documentation/swift/numeric) protocol 을 활용하는 방향이었는데 현재 구현 또한 괜찮다고 생각해요!

## Filter 함수

- filter 함수는 컨테이너 내부의 값을 걸러서 새로운 컨테이너로 추출한다.
- filter 의 매개변수로 전달되는 함수의 반환 타입은 Bool 이다.
- true면 값을 포함하고, false면 값을 배재한다.
- map과 마찬가지로 새로운 컨테이너를 생성하여 값을 반환한다.

이 또한, 예를 통하여 공부해보자. 아래와 같이 numbers array가 있다고 해보자.

```swift
let numbers: [Int] = [0, 1, 2, 3 ,4]
```

그리고, filter함수를 통하여 numbers 요소 중 짝수를 걸러내 새로운 배열로 변환해보자.

```swift
let evenNumbers: [Int] = numbers.filter { (num: Int) -> Bool in
    return num % 2 == 0
}
```

map 함수와 마찬가지로 아래와 같이 생략이 가능하다.

```swift
let oddNumbers: [Int] = numbers.filter { $0 % 2 == 0 }
```

## 2. forEach

그냥 간단한 예를 통해서 알아보자

```swift
let nums: [Int] = [1, 2, 3, 4]

nums.forEach {
    print($0)       // 1 2 3 4
}
```

Dictonary일 경우에도 아래와 같이 받을 수 있다. (Juice_Maker proeject에서 사용했음)

```swift
let dict: [String : Int] = ["Miro" : 24, "Alex" : 26]

dict.forEach {
	print(\($0.key), \($0.value))
}
```

> ⚠️ for - in 문과 forEach문의 차이점은?1. continue나 break는 for- in문에서는 사용이 가능하나, forEach문에서는 불가능하다.2. for - in 문의 경우 return을 만나면 함수 자체가 종료가 된다. 그러나 forEach문의 경우 반복횟수에는 영향을 주지 않는다.
> 
> 
> ```swift
> func printForIn() {
>     let nums = [1, 2, 3]
> 
>     for num in nums {
>         print(num)
>         return
>     }
> } // 1
> 
> func printForEach() {
>     let nums = [1, 2, 3]
> 
>     nums.forEach {
>         print($0)
>         return
>     }
> } // 1 2 3
> ```
> 

# 트러블 슈팅 ⚽️

## 1. Enum 속 메소드 활용하기

- 기존의 코드는 아래와 같이 접근제어만 설정한 메소드였다.
- Enum안에 있는 메서드에 접근하기 위해 기존 코드로 호출하려고 하니 접근이 되지 않았다.

```swift
// 수정 전 코드
enum ExpressionParser {
    
    func parse(from input: String) -> Formula {

    /// 중략

    }
    
    private func componentsByOperators(from input: String) -> [String] {
        return input.split(with: ",")
    }
}
```

- 그러나, 아래와 같이 `static` 키워드를 추가하여 해결을 해줬다.

```swift
// 수정 후 코드 -> static 키워드 추가
enum ExpressionParser {

    static func parse(from input: String) -> Formula {

    /// 중략

    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: ",")
    }
}
```

## 2. compactMap 활용하기

[Apple Developer Documentation](https://developer.apple.com/documentation/swift/array/map(_:)-87c4d)

[Apple Developer Documentation](https://developer.apple.com/documentation/swift/array/compactmap(_:))

[Apple Developer Documentation](https://developer.apple.com/documentation/swift/optional/map(_:)-7txtz)

- 기존의 코드는 아래와 같이 String으로 변환해준뒤 optional binding을 해야했다. 따라서 아래의 코드에서 optional binding을 해야됐다.

```swift
operandElements.map { Double($0) }.forEach { operandsQueue.enqueue($0) }
```

- 따라서, 아래와 같이 compactMap을 통하여 optional binding을 해주었다.

```swift
operandElements.compactMap { Double($0) }.forEach { operandsQueue.enqueue($0) }
```


# 다음주 공부할 내용 🌈

- [STEP 2] PR comment 확인 후, 코드 수정하기
- UI적인 측면에서 에러를 걸러내는 로직 짜기!
    - 0으로 나눌 때 NaN을 return하는 error handling 코드 짜기
    - 연산자를 연달아 눌렀을 때 error를 return하는 코드 짜기
- +/- 버튼, CE, AC 버튼을 눌렀을 때 어떻게 string을 받아올 지 고민해보기
- code를 활용하여 UI를 구성하는 방법
    - stackView
    - scrollView
