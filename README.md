# SeSAC 계산기 프로젝트

# 💙 Team MABLE 🌏
🏃🏻🏃🏻‍♂️💨 **프로젝트 기간:** `23.01.16` ~ `23.01.27`

|<img src="https://avatars.githubusercontent.com/u/71758542?v=4" width=200>|<img src="https://avatars.githubusercontent.com/u/59835351?v=4" width=200>|
|:---:|:---:|
|[💙 Blue 💙](https://github.com/bomyuniverse)|[🌏 Mason 🌏](https://github.com/qwerty3345)|

# 💬 UML
![](https://user-images.githubusercontent.com/70311145/188132535-8bc81913-7863-4877-88f9-0f8e811a52bd.jpeg)

# 📝 객체별 역할과 책임

| Name | Type | 역할과 책임 |
| --- | --- | --- |
| Operator | enum | 각 연산자 (+, -, ÷, ×) 케이스, 케이스별 연산 로직 |
| CalculateItem | protocol | 연산 가능 요소를 제한하기 위한 protocol |
| ExpressionParser | enum | 연산정보인 input 문자열을 받아 파싱 해 Formula 로 변환함 |
| Formula | enum | 연산자, 피연산자 Queue들을 갖고, 해당 요소들의 연산을 수행할 수 있는 객체 |
| CalculatorItemQueue | struct | 연산자, 피연산자를 저장하는 Queue 자료구조 (링크드 리스트 구조로 구현) |
| LinkedList | struct | 노드간의 연결로 구현한 링크드리스트 자료구조 |
| Node | class | 링크드리스트 내부의 노드 |
| CalculatorError | enum | 계산기에서 발생할 수 있는 오류 정의 및 Description 메세지 정의 |

# ✏️ 주간 학습 키워드 및 요점정리

- 고차함수
    - map
        
        ```swift
        func map<T>(_ transform: (Self.Element) throws -> T) rethrows -> [T]
        ```
        
        - 요소 하나하나를 매핑하여 새로운 배열을 return한다.
    - compactMap
        
        ```swift
        func compactMap<ElementOfResult>(_ transform: (Self.Element) throws -> ElementOfResult?) rethrows -> [ElementOfResult]
        ```
        
        - 요소를 하나씩 매핑하여 옵셔널 바인딩을 수행, nil의 경우 제거하고 배열로 return한다.
    - flatMap
        
        ```swift
        func flatMap<SegmentOfResult>(_ transform: (Self.Element) throws -> SegmentOfResult) rethrows -> [SegmentOfResult.Element] where SegmentOfResult : Sequence
        ```
        
        - 중첩된 배열을 새롭게 매핑하여 중첩을 제거하고 단일 배열로 return한다.
    - reduce
        
        ```swift
        func reduce<Result>(
            _ initialResult: Result,
            _ nextPartialResult: (Result, Self.Element) throws -> Result
        ) rethrows -> Result
        ```
        
        - 초기값을 지정할 수 있고, 요소를 하나씩 꺼내어 내부 로직을 수행한 후 부분 결과값에 저장한 후 해당 결과값과 함께 다음 로직을 수행한다.
        모두 수행한 최종 결과를 return한다.
    - 😋 in our project
        
        ```swift
        // ExpressionParser.swift
        
        // compactMap
        let operandElements = componentsByOperaters(from: input).compactMap { Double($0) }
        
        // reduce and flatMap
        return Operator.allCases.reduce([input]) { partialResult, calculatorOperator in
            partialResult.flatMap {
                $0.split(with: calculatorOperator.rawValue)
            }
        }
        ```
        
- 제네릭, Protocol
    - 포괄적으로 여러 타입을 받을 수 있게 함으로서 코드의 중복을 줄일 수 있음
    - Queue 내부에 받을 수 있는 요소의 타입을 프로토콜로만 제약을 주는 경우
        - 해당 프로토콜을 채택한 여러 다른 타입의 요소들을 모두 받을 수 있기에 꺼내와서 사용 시 타입 캐스팅이 필요함
    - Queue 내부에 받을 수 있는 요소의 타입을 제네릭으로 구현하고 해당 제네릭의 제약 조건으로 프로토콜을 주는 경우
        - 해당 프로토콜을 채택한 “특정 타입” 의 요소만 받을 수 있기에, 내부에 공통된 하나의 타입만 받을 수 있게 제약이 생김 → 타입 캐스팅이 불필요
- UML
    - 각 화살표의 의미: 실체화 - 프로토콜 채택, 직접연관 - 내부 프로퍼티
    - +, - 의 의미: +는 외부에서 접근가능, -는 private 으로 외부에서 접근 불가능
    - 밑줄의 의미: static 키워드에 해당 _ UML에서는 static func 만 존재하기에 enum의 네임스페이스로 묶었다고 판단
- TDD, Unit Test
    - TDD의 핵심 개념은 모든 테스트를 설계하고 프로젝트를 진행하는 것이 아니라,
    하나의 “실패하는” 테스트를 작성하고, 해당 테스트를 통과하도록 리팩터링 하는 과정을 반복하는 것
    - Unit Test 는 Code Coverage 개념이 존재하고, 각 테스트 케이스가 얼마나 많은 부분의 테스트를 다루는지를 체크해볼 수 있음
        - 높을 수록 테스트를 잘 짠 것

# STEP 1

## 구현 내용

- 큐(Queue) 타입과 큐타입 구현을 위한 List 타입의 UML 작성

![계산기_프로그램_클래스_다이어그램](https://user-images.githubusercontent.com/59835351/212817217-4bcf6fa2-1907-436e-ac4e-a429951b4985.jpg)

- `CalculateItem`을 준수하는 요소를 다루는  `CalculatorItemQueue` 구현
- 비어있는 `CalculateItem` 프로토콜 생성
- **(선택)** `CalculatorItemQueue`의 내부에서 사용하는 List 형식의 자료구조를 `LinkedList`로 구현
    - `LinkedList` 구현을 위한 `Node` 클래스 생성

# STEP 2

## 구현 내용

- 제시된 UML대로 연산과 관련된 타입 구현
- 고차함수 compactMap, flatMap, reduce 활용
- 0으로 나누기를 시도하는 경우 적절한 오류처리
- 피연산자와 연산자의 개수가 잘못된 경우
- 연산할 요소가 큐에 존재하지 않는 경우

# 고민과 해결

## Queue 구현 시 Array vs Linked List

먼저 Queue 내부의 요소를 `**Array**`로 구현하는 것을 고려하였습니다.
하지만, **dequeue**를 구현하는 경우 `array.removeFirst`를 활용하면
배열 특성상 삭제된 요소로 인해 남아있는 **모든 요소들의 index를 변경**해줘야 하기에 **시간복잡도**가 ****$O(n)$이 되는 것으로 보입니다.
어떻게 하면 시간복잡도를 $O(1)$으로 만들 수 있을지에 대해 고민하였습니다.

### ⏳ Queue 기능 구현 시 시간 복잡도

`dequeue` _ 가장 앞의 요소를 삭제

- Array 로 구현:  $O(n)$
- Linked List 구현: $O(1)$
    
    > head 만 삭제하고, 해당 다음 노드를 head 로 지정해주면 됩니다.
    > 

`enqueue` _ 가장 뒤로 요소를 삽입

- Array 로 구현: $O(1)$, 최악의 경우 $O(n)$
    - Array 의 append 메서드를 호출하는데, 
    배열은 저장공간의 사이즈가 고정되어 있기에, 해당 배열의 최대 사이즈를 넘어서 `append()` 를 실행하면 저장 공간을 realocate하는 작업이 발생하여 최악의 경우 시간복잡도가 O(n)이 됩니다.
- Linked List 구현: $O(1)$
    - reallocate 가 발생하지 않습니다.

### **🤔 그렇다면 Linked List 방식의 단점은??**

- LinkedList 로 구현할 경우, 각 Node가 다음 Node의 주소값을 참조해야 하므로 각 노드를 class 로 Heap 영역에 저장해야 합니다.
    - Heap 에 저장될 필요가 없는 데이터들도 Node class 로 Wrapping 해야 합니다.
- Linked List 방식의 전체적인 시간복잡도는 줄어들 수 있겠지만… 공간 복잡도는 훨씬 커지지 않을까 라는 생각이 들었습니다?
- 이에, 어느 부분을 최적화 하는 것을 우선시할 것인가에 대한 **”선택의 문제”** 라고 판단을 내렸습니다.
    
    > 이번 계산기 프로그램 같은 경우는 Array 로 구현해도 큰 차이가 발생하지 않을 것이라 판단되지만, 
    학습의 목적으로 Linked List 로 구현 해 보았습니다.
    > 

🌟 리뷰어 의견: 저라면 Array, LinkedList 구현에 대해 명세로 정해진게 없다면 Array로 구현했을거 같습니다.

## TDD

이번 STEP1 에서 Queue, Linked List 타입을 구현할 때 TDD 방식으로 진행하였습니다.
실패 케이스를 한 개 해결한 후 다음 케이스를 작성하였는데, 
앞선 실패케이스를 해결하면서 [새로 작성한 테스트 케이스도 success가 되는 경우](https://github.com/qwerty3345/ios-calculator/commit/226d732a502e8cd2ffffde01bd1f435a922e88c2)가 발생하였습니다.

```swift
// LinkedList.swift
func test_여러요소를_append했을때_마지막으로_넣은_요소가_tail이다() {
    // given
    let inputs = [1, 2, 3, 4, 5]

    // when
    inputs.forEach {
        sut.append($0)
    }
    guard let tailValue = sut.tail?.value as? Int else {
        return XCTFail()
    }

    // then
    XCTAssertEqual(inputs.last, tailValue)
}
```

🌟 리뷰어 의견: 정석적인 TDD 방식이라면 한가지에 대한 테스트 코드를 작성하고 테스트를 진행하고 수정하는 방식입니다!

# **⁉️ 고민과 해결**

## 에러 케이스의 네이밍

0으로 나누는 경우의 오류 처리를 위해 Error 타입을 정의한 후 필요하다고 생각되는 에러 케이스들을 추가하였습니다.
에러케이스 중 피 연산자와 연산자의 개수가 일치하지 않는 경우 오류를 반환하는 케이스를 추가하려고 네이밍을 하는 과정에 많은 시간을 할애하게 되었습니다.

```swift
//CalculatorError.swift
enum CalculatorError: LocalizedError {
    case divideByZero
    case notMatchingCountOfOperatorsAndOperands
    case invalidDequeue

    var errorDescription: String? {
        switch self {
        case .divideByZero:
            return "NaN"
        case .notMatchingCountOfOperatorsAndOperands:
            return "피연산자와 연산자의 개수가 잘못되었습니다."
        case .invalidDequeue:
            return "연산할 요소가 존재하지 않습니다."
        }
    }
}
```

- 다른 에러 케이스처럼 짧고 명확하게 적고 싶었으나 적절한 네이밍이 떠오르지 않아, 명확성을 지키는 방법을 선택하였습니다.
- `notMatchingCountOfOperatorsAndOperands` 라는 네이밍이 마음에 들진 않았지만, 다른 네이밍이 떠오르지 않았습니다.

> **Formula.swift**의 `result()` 메서드 수행 로직
> 
> 1. result() 함수 실행
> 2. 피연산자에 요소가
>     - 있는 경우: 첫 피연산자를 dequeue
>     - 없는 경우: `invalidDequeue` error return
> 3. 피연산자 큐의 요소 개수와 연산자 큐의 요소 개수가
>     - 같으면: 다음 단계 진행
>     - ⭐ 다르면: `notMatchingCountOfOperatorsAndOperands` error return
> 4. 연산자와 피연산자를 dequeue한 값이
>     - `nil`이라면: invalidDequeue error return
>     - `nil`이 아니라면: 다음 단계 진행
> 5. 0으로 나누는 연산이
>     - 있는 경우: `divideByZero` error return
>     - 없는 경우: 연산 수행

🤔❓ 저희의 에러 케이스 네이밍에 대한 라자냐의 의견은 어떠신가요? 다른 테스트 케이스와 동일하게 간단하게 작성하는 것이 좋을까요?

## split 로직

저희가 UML 을 분석 한 결과는 아래와 같습니다.

1. input이 하나의 String 값으로 들어온다. (”1+2÷9”…)
2. 해당 연산 String 을 연산자, 피연산자(숫자)들로 파싱하고 각각 큐에 담아 Formula 를 반환한다.
3. 해당 Formula 의 result 를 호출하여 각각의 큐에 담긴 연산자, 피연산자를 dequeue 하여 계산하고 결과값을 반환함.

이 때 2번의 파싱 로직에 있어서, 저희가 생각한 로직은 

- 연산자는 enum 의 rawValue 로 생성하여 compactMap 으로 배열화 해주고,
- 피연산자(숫자)는 각각의 연산자를 기준으로 잘라서 배열화 한다.

이 때 처음 구상한 피연산자(숫자) 파싱 로직은 각각의 연산자 Character 를 Set으로 담고, 문자열을 한 번에 해당 연산자들을 기준으로 components 로 잘라주는 로직이었습니다.

> 처음에 구상한 숫자 파싱 로직
> 

```swift
private static func componentsByOperaters(from input: String) -> [String] {
    let operatorCharacters = Operator.allCases.map { $0.rawValue }
    let operatorCharacterSet = CharacterSet()
    return input.components(separatedBy: operatorCharacterSet)
}
```

그런데, UML 기능명세서의 String extension 의 split 메서드를 사용하여 하려니, 
아래처럼 각각의 요소마다 split을 하고 flatMap을 해주는 방식으로 구현해야 했습니다.

처음 구상한 로직보다 비효율적인 로직처럼 보였지만… 명세서 UML의 구조를 최대한 지키려 이렇게 구현하였습니다. 

> 최종 구현한 숫자 파싱 로직
> 

```swift
extension String {
		// UML 기능 명세에 있는 함수
    func split(with target: Character) -> [String] {
        return components(separatedBy: String(target))
    }
}

// enum ExpressionParser 로직
private static func componentsByOperaters(from input: String) -> [String] {
    return Operator.allCases.reduce([input]) { partialResult, calculatorOperator in
        partialResult.flatMap { $0.split(with: calculatorOperator.rawValue) }
    }
}
```

❓🤔 이런 문제에 대한 라자냐의 의견은 어떠신지 궁금합니다. 

# 🔎 다음주 프로젝트 계획

- STEP 3 확인
- 스토리보드와 모델 코드 연결
- 뷰컨트롤러에서 사용자 이상 입력에 대한 로직 처리
    - ex) 연산자 버튼을 계속 입력한다…
- 버튼이 작동하도록 수정
    - +/- 버튼의 경우 양수/음수가 전환되도록 처리
        - 현재 입력된 숫자에 -1을 곱하도록
    - (학습 후 구현 예정) 여러 버튼 구현 시, 프로토콜을 채택한 커스텀 버튼 클래스를 구현하여 타입캐스팅 후 처리하도록 구현 예정
- STEP 3에 맞게 에러 케이스 추가
- 유닛 테스트 높은 커버리지를 목표로 테스트 케이스 작성
