# iOS_calculator README 작성 (Joo & Lust3r)
----

## 🗂️ 프로젝트 파일 구조
![188132535-8bc81913-7863-4877-88f9-0f8e811a52bd](https://user-images.githubusercontent.com/45708630/213386825-29d5bd14-4f73-49e0-9862-4d5939af10cb.jpeg)
---
## 🕵🏻 역할 분배
|enum|역할|
|:---|:---|
|Operator|`Character`, `CalculateItem`, `CaseIterable`을 채택하였고, 각 연산자 case 및 각 연산자가 들어왔을 때 그에 맞는 연산을 할 수 있도록 calculate 메서드를 정의|
|ExpressionParser|String 형태의 숫자 배열을 반환하는 `componentsByOperators`와 연산자 배열을 반환하는 `extractOperators`메서드를 사용하여 input 값을 파싱하고, 그 값을 통해 `Formula`를 구성하여 반환하는 기능|

|struct|역할|
|:---|:---|
|Formula|`Double` 타입의 `CalculateItemQueue`를 갖는 operands와 `Operator` 타입의 `CalculateItemQueue`를 갖는 operators를 프로퍼티로 삼은 구조체. result 메서드를 통해 각 ItemQueue에서 값을 dequeue하여 결과값을 Double로 반환|
|CalculatorItemQueue|제네릭 타입의 배열을 queue로 가지며, 인자로 받은 어떠한 타입의 배열도 init에서 enqueue 과정을 통해 해당 타입의 queue를 생성. queue의 기본적인 기능인 enqueue와 dequeue, 그리고 큐를 비우는 allClear 메서드를 포함|

|protocol|역할|
|:---|:---|
|CalculateItem|`Operator`, `Double`에서 `CalculateItem`를 채택하여 CalculateItemQueue의 요소로 사용될 수 있도록 생성|

|extension|역할|
|:---|:---|
|Operator|연산자를 열거형으로 정의. calculate 메서드에서 private 타입의 add, substract, divide, multiply 메서드를 사용할 수 있도록 구현. 은닉화된 연산 메서드들은 이름과 동일한 계산해서 Double값으로 반환|
|Double|`CalculateItemQueue`의 요소로 사용되도록 `CalculateItem`을 채택|

---

## Step1 - Queue 타입 구현
[PR #13 | Step1 - Queue 타입 구현](https://github.com/tasty-code/ios-calculator/pull/13)

### 구현 내용
- Queue타입으로 구현을 하기 위해서 enqueue, dequeue를 필수 구현
- Queue의 요소에서 사용될 타입을 CalculateItem으로 채택

---

## Step2 - 계산 타입 및 주변 타입 구현
[PR #21 | Step2 - 계산 타입 및 주변 타입 구현](https://github.com/tasty-code/ios-calculator/pull/21)

### 구현 내용
- UML에 맞게 각 구성요소 구현
    - CalculateItem 프로토콜을 채택하는 `extension Double`, `Enum Operator` 구현
    - input값을 파싱하는 역할의 `parse`와, 숫자와 연산자 배열을 반환할 `componentsByOperators`, `extractOperators`구현
    - 두 개의 `CalculateItemQueue`를 갖는 `struct Formula` 구현

---
   
## 🧨 트러블 슈팅
1. **[Step 1]** 유닛테스트 시 `XCTAssertEqual`을 사용할 때 오류가 발생하여 queue에 들어가는 Item에 `Equatable` 프로토콜을 채택하여 해결하였습니다
2. **[Step 1]** Unit Test를 진행하면서 dequeue를 사용하면 `isEmpty`가 false인 상황에서는 문제가 되지 않지만 true일 때는 warning이 발생하여 @discardableResult를 사용하여 해결하였습니다.
3. **[Step 2]** UML에서 요구한 split에서는 Character를 target으로 하기에는 원하는 결과가 나오지 않아 `components(separatedBy: CharacterSet)`를 사용하여 구분자에 맞춰 문자열로 반환하였습니다.
   
---
   
## 📓 학습내용 요점
### 1. generic function
    

제네릭 형식의 함수는 함수 이름 뒤에 꺽쇠 괄호안의 자리 표시자 형식(the placeholder type name) `<T>`가 들어옵니다.
    
```swift
func makeQueue<T>(from elements: Array<T>) -> CalculateItemQueue<T> {
```

함수의 제네릭 버전에서는 *실제* 형식 이름(예: `Int`, `String` 또는 `Double`) 대신 *자리 표시자* 형식 이름(이 경우 `T`라고 함)을 사용합니다. 자리 표시자 유형 이름은 T가 무엇이어야 하는지에 대해 아무 말도 하지 않지만 `T`가 나타내는 것이 무엇이든 `a`와 `b` 모두 동일한 유형 `T`여야 한다고 말합니다
> 참고 : [공식 문서](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)

### 2. enum method
`Type Methods` 실제 Object를 생성할 필요 없이 내부의 (프로퍼티), 메소드에 접근하기 위해서 사용
```swift
enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        // ...
        let operatorQueue: CalculateItemQueue<Operator> = makeQueue(from: operators)
    }
    static func makeQueue<T>(from elements: Array<T>) -> CalculateItemQueue<T> {
        // ...
    }
}
ExpressionParser.parse(from: "+13-7+12*5+9")
````
형식 메서드의 본문 내에서 사용하는 정규화되지 않은 메서드 및 속성 이름은 다른 형식 수준 메서드 및 속성을 참조합니다. 형식 메서드는 형식 이름을 접두사로 추가할 필요 없이 다른 형식 메서드의 이름으로 다른 형식 메서드를 호출할 수 있습니다. 마찬가지로 구조 및 열거형의 형식 메서드는 형식 이름 접두사 없이 형식 속성의 이름을 사용하여 형식 속성에 액세스할 수 있습니다.
> 참고 : [공식 문서](https://docs.swift.org/swift-book/LanguageGuide/Methods.html)

### 3. compactMap
시퀀스의 각 요소로 지정된 변환에서 `nil`이 아닌 결과의 배열을 반환하는 compactMap을 이용해서 간략해진 코드로 Double 타입의 값들을 얻을 수 있었습니다.
```swift
let splittedStringArray = "+13-7+12*5+9".components(separatedBy: "+-*/")
let doubleArray= splittedStringArray.compactMap { Double($0) }
```
> 참고 : [공식 문서](https://developer.apple.com/documentation/swift/sequence/compactmap(_:))

### 4. CharacterSet
검색 작업에 사용할 유니코드 문자 값 세트. 본 프로젝트에서는 String 내에서 Operator Character를 CharacterSet으로 만들어 검색작업을 진행했습니다.
```swift
static func componentsByOperators(from input: String) -> [String] {
        let operators: String = String(Operator.allCases.map { $0.rawValue })
        let operatorSet: CharacterSet = CharacterSet(charactersIn: operators)
        return input.components(separatedBy: operatorSet)
    }
```
> 참고 : [공식 문서](https://developer.apple.com/documentation/foundation/characterset)

---

## 🔖 프로젝트 계획
### STEP3 에서 적용해야 하는 부분

- 계산의 처음 숫자의 연산자는 default는 `.add` 이다
(macOS 기본 계산기에서도 숫자 버튼 누르기 전에 연산자를 변경 가능)
- 계산기의 순서는 아래와 같다
    1. 연사자를 입력 (첫 숫자 입력의 연산자는 `.add`)
    2. 숫자를 입력
    3. 1 ~ 2번의 행동을 반복하게 된다
- `+ / -`는 String으로 입력받는 형태(`sign`)에서 기호로 받는다
    
    ```swift
    // ➕, ➖: 이모지로 positive와 negative를 판단하도록 분리
    "+15➕*10➕-17➖"
    ```
- parse 부분에서 `sign`을 구분짓고 새로운 Queue를 만들어야 한다
- `.`의 입력을 받았다면 1번만 받도록 enum으로?? 관리한다
- `sign`과 `.` 을 계산기의 순서에서 새로운 연산자를 받을 때마다 초기화를 한다
(`.`은 unused, used로 구분 / `sign`은  positive, negative로 구분)
- 그 외에 예외 사항은 STEP3에서 입력받을 때 처리를 해야한다 판단한다

---
