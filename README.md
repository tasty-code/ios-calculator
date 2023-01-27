# SeSAC 계산기 프로젝트

# 💙 Team MABLE 🌏
🏃🏻🏃🏻‍♂️💨 **프로젝트 기간:** `23.01.16` ~ `23.01.27`

|<img src="https://avatars.githubusercontent.com/u/71758542?v=4" width=200>|<img src="https://avatars.githubusercontent.com/u/59835351?v=4" width=200>|
|:---:|:---:|
|[💙 Blue 💙](https://github.com/bomyuniverse)|[🌏 Mason 🌏](https://github.com/qwerty3345)|

### ✅ 그라운드 Rule

- 코드 컨벤션
    - 기준: [https://github.com/kodecocodes/swift-style-guide](https://github.com/kodecocodes/swift-style-guide)
- 커밋 컨벤션, 깃 플로우
    - 커밋 단위는 최대한 작은 기능단위로!
    - 소문자로 (feat: 내용)
    - ✨ **Git Commit Convention**
        - Prefix 전체 소문자, **`prefix:`**
        - `feat` = 주로 사용자에게 새로운 기능이 추가되는 경우
        - `fix` = 사용자가 사용하는 부분에서 bug가 수정되는 경우
        - `docs` = 문서에 변경 사항이 있는 경우
        - `style` = 세미콜론을 까먹어서 추가하는 것 같이 형식적인 부분을 다루는 경우 (코드의 변화가 생산적인 것이 아닌 경우)
        - `refactor` = production code를 수정하는 경우 (변수의 네이밍을 수정하는 경우)
        - `test` = 테스트 코드를 수정하거나, 추가하는 경우 (코드의 변화가 생산적인 것이 아닌 경우)
        - `chore` = 별로 중요하지 않은 일을 수정하는 경우 (코드의 변화가 생산적인 것이 아닌 경우)
        - +) `design` = UI 디자인을 변경했을 때
    - step1, step2, step3
        - step1 작업 → main 머지 → PR → step1 리뷰 → step1-fix
            - 코드리뷰가 1일 내로 안올 시, 다음 스텝 미리 진행 (conflict 천국)
        - step2 작업 → main 머지 → PR → step2 리뷰 → step2-fix
        - step3 작업 → main 머지 → PR → step3 리뷰 → step3-fix
- 모닝 스크럼 방식
    - 아침 컨디션 체크
    - 전날 뭐했는지 간단히라도 공유 (자기의 wow 포인트가 있으면 공유…)
    - 프로젝트 진행상황, 진행방향
        - 그날 작업할 것, 설계… 등등
- 프로젝트 진행 방식
    - 설계 우선 → 구현 진행
    - 50분 프로젝트 / 10분 휴식


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
| CalculatorViewController | class | UI 와 연결되어, 사용자 입력을 체크하고 연산을 수행하는 뷰컨트롤러 |

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


# STEP 3

## 구현 내용

- 사용자의 터치 이벤트를 수신하여 실제로 연산을 수행할 수 있도록 구현
- 숫자를 입력하고 계산하는 기능을 구현
- 스택 뷰와 레이블을 활용하여 계산 내역을 표시
- 계산내역이 길어지면 위아래로 스크롤 가능
- 계산내역이 상단 공간을 넘어 이어지는 경우, 사용자에게 제대로 보일 수 있도록 새로 추가될 때 최하단으로 자동 스크롤 되도록 구현

# ⁉️ 고민과 해결

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

🌟 리뷰어 의견: 에러 네이밍이 명확한거 좋습니다~

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

🌟 리뷰어 의견: 저라면 명세서를 따랐을거 같습니다. 실제로 프로젝트를 진행하면서 명세서를 작성할때에는 다른 개발자들과 합의 하에 작성 혹은 유지되기 때문에 다른 방식으로 구현하고 싶다면 사전에 논의를 거쳐야할거 같습니다.


## ScrollView의 위치를 설정 해 줄 때의 문제 (Drawing Cycle)

계산내역이 상단 공간을 넘어 이어지는 경우, 사용자에게 제대로 보일 수 있도록 새로 추가될 때 최하단으로 자동 스크롤 되도록 구현해기 위해  stack이 추가된 후 스크롤 뷰의 bottomOffset를 재설정하였습니다.

- 리팩토링 전의 코드는 가장 최신에 추가된 stack이 아닌 이전 stack 을 하단으로 자동 스크롤 되었습니다. (이미지 참고)
    
    ```swift
    // CalculatorViewController.swift - 131~132
    let bottomOffset = CGPoint(x: 0, y: self.historyScrollView.contentSize.height - self.historyScrollView.frame.size.height)
    self.historyScrollView.setContentOffset(bottomOffset, animated: true)
    ```
    
    ```markdown
    ![](https://user-images.githubusercontent.com/71758542/215037969-0b1589f2-0446-4286-81e4-e523045c707b.gif)
    ```
    
- 뷰가 업데이트 되기 전 height로 offset이 설정되는 것으로 확인하였고, 해당 문제를 해결하기 위해 `layoutIfNeeded()`를 사용하였습니다.
    
    ```swift
    // CalculatorViewController.swift
    historyScrollView.layoutIfNeeded()
    
    let bottomOffset = CGPoint(x: 0, y: self.historyScrollView.contentSize.height - self.historyScrollView.frame.size.height)
    self.historyScrollView.setContentOffset(bottomOffset, animated: true)
    ```
    
- `layoutIfNeeded()`를 사용한 이유?
    - UI를 업데이트 하는 큐의  뒤에 삽입하는 것이 아니라, 맨 앞쪽으로 배치하여 곧바로 UI가 변하도록 하는 메서드이기 때문입니다.
    - 해당 메소드가 호출되면 1/60초에 한 번씩 실행되는 Update Cycle을 바로 실행하여 레이아웃이 즉각적으로 적용됩니다.
    - `layoutIfNeeded()`를 stack이 추가된 코드와 offset을 설정하는 코드 사이에 실행되도록 하여, stack이 추가된 scrollView의 height값을 사용할 수 있도록 하였습니다.

## NumberFormatter

- 입력한 숫자와, 계산완료 결과 숫자를 1,000 단위로 쉼표를 붙여주기 위해 사용하였습니다.
    
    > `.numberStyle` 을 `decimal` 로 설정하였습니다.
    > 
- 동작 로직 : 사용자가 숫자를 입력 → 연산자를 누름 → 입력된 숫자를 `formatter`로 변경 → 변경된 숫자를 StackView로 삽입
- 트러블 슈팅: “=” 을 눌러 계산을 할 때 사용자 입력창 부분에 결과값을 formatted 된 형태로 보여줍니다.
    - 원래 `format` 하는 로직은 double 값을 formatter 로 변경하는 로직이고,
    이미 formatted 된 계산된 값을 Double로 변환하려 하니 “,” 쉼표가 들어가 있기에 타입 캐스팅에 실패하였습니다.
    - 이에, “,” 쉼표를 제거하고 해당 연산을 수행하도록 처리였습니다. 
    (다만 쉼표를 붙여줬다 떼는 로직이기에 비효율적인 부분은 존재할 것이라 판단했습니다.)
    - 차후 필요 시, 계산된 값임을 알리는 flag 를 두고 해당 flag 로 체크 한 뒤 처리해도 될 듯 합니다.
- cf) 메모리 효율을 위해, 메서드 내부에서 `formatter` 를 매번 생성하는 것이 아닌, 뷰컨트롤러의 프로퍼티로 생성한 뒤 `format` 메서드에서 해당 프로퍼티를 호출해서 사용하도록 처리하였습니다.
    
    ```swift
    // ViewController
    private let formatter = NumberFormatter()
    
    private func format(number: Double) -> String? {
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 20
    
        return formatter.string(for: number)
    }
    ```

