# 🗓 README
#### ✨ iyeah & 🍏 Jenna <br>
##### 2023년 1월 16일 → 2023년 1월 27일

　
 
# Step 1️⃣
## 트러블 슈팅
### 트러블
> 큐 내부의 리스트 타입에 대한 고민
1. linked list
2. double stack
3. ring buffer

위 3가지 방법을 알아보던 중, 완전히 적합한 방식을 찾지 못하고 기본 배열로 구현했습니다.
```Swift
private var itemArray = [String]()
```

### 해결 방법
> 2에서 착안하여 아래와 같은 방법을 구상

'직전입력요소'(=삭제될 수 있는 임시입력값) 저장하는 속성을 따로 구현했습니다.
```Swift
struct TemporaryInput {
    private var partialOperator: Character    //연산자
    private var partailOperands: [String]     //피연산자
    private var isPositive: Bool              //부호
}
```

　
## 학습내용 요약
### 프로토콜 활용
> Protocol: blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality.

이번 프로젝트에서는 프로토콜의 내부는 구현하지 않았지만 '특정 타입이 어떤 프로토콜을 준수하는가'를 '기준'으로서 활용할 수 있었습니다.
특히 제네릭을 적용하면서, 아무 타입이나 들어갈 수 없도록 한정하기 위해 
해당 (제네릭)요소가 CalculateItem 프로토콜을 준수하는 타입이어야 한다는 제약조건을 설정했습니다. 
```Swift
struct CalculatorItemQueue<Item: CalculateItem>
```

### UML
> UML: Unified Modeling Language
- 클래스 다이어그램을 직접 그려보면서 헷갈리던 UML문법을 더 자세히 알 수 있었다.
- 누군가에게 우리 프로젝트를 설명하기 위해 타입 간 의존관계나 영향에 대해 의견을 많이 나누었고, 그 과정에서 우리가 작성한 코드의 이해도가 높아짐을 경험했다.
- 주어진 UML을 기반으로 추측하고 설계해보며 실제 코드구현에 앞서 타입설계와 충분한 논의가 이루어지는 게 얼마나 중요한지 실감할 수 있었다.

![이미지](https://camo.githubusercontent.com/4b538ace10506e4fd2a905995728175e05dc47e985fbff9104e137144c37ba85/68747470733a2f2f63646e2e646973636f72646170702e636f6d2f6174746163686d656e74732f313036343334363330363333373835333536312f313036343733313732383837363430383938332f323032332d30312d31375f31312e31322e34372e706e67)

　
# Step 2️⃣
## 트러블 슈팅
## 1. result()함수 로직
### 트러블
> **`reduce`함수**
```
(1...operators.count()).reduce(...) {...}
```

`operands`큐, `operators`큐 둘 중 하나에 `.reduce(_:_:)`를 쓸까 고민했지만, 
그러면 그 큐는 실질적으로 dequeue가 아니라 forEach스럽게 각 요소를 순회하게 됨
Queue스러움을 살리려다가 reduce가 부적절하게 구현된 것은 아닌지(사용하지 않을 값들에 적용해서) 의문
### 해결 방법
자료구조를 공부해서 적용하는 첫 프로젝트인 만큼 둘 모두 Queue로서의 정체성을 최대한 활용해보고 싶었기에 아래와 같이 작성함
- 다소 무의미한 임의의 콜렉션(범위연산자: `1...operators.count()`)에 `.reduce(_:_:)`를 적용
- `.reduce(_:_:)` 내부에서 
`operands.dequeue()`와 `operators.dequeue()`를 각각 실행

<details>
    <summary><strong>Jake의 피드백</strong></summary>
  말씀주셨던 것 처럼 두 분이 큐를 queue답게 사용하고 싶으셔서 위와 같이 구현을 하신 것 같고, 그러한 이유라면 괜찮아보이긴합니다.<br>
다만 지금 1부터 operators.count까지 인데, 사용자가 계산기에 입력을 <code>1 + 2 - 4 + =</code> 이런식으로 했다면 지금으로서는 문제가 발생할 것 같긴하네요. 이 부분은 추후에 개선이 필요해보이긴합니다.<br>
물론 해당 케이스는 예외 케이스이고 그러한 부분을 처리해주는 부분은 ExpressionParser쪽에 operand, operator의 짝이 맞는지 확인하는 부분이 있어야할 것 같아보입니다.
</details>

　
## 2. dequeue 방식
### 트러블
큐는 선입선출 자료형이므로 <br>dequeue한다 == removeFirst() == 시간복잡도 O(n)<br>
ㄴ removeFirst()의 대안이 있을까?
### 해결 방법
* Array의 reversed()는 시간복잡도 O(1)로, 
이것을 이용하여 dequeue를 할 때 배열을 뒤집어서 removeLast()로 시간복잡도를 낮추기 위해 고려함
* 뒤집어서 dequeue하기 위해 `reversedItems`라는 계산속성을 따로 구현
`items`를 자동으로 뒤집어서 가져오거나 세팅
* step1에서 공부했던 더블스택의 아이디어를 일부 차용
(dequeue시에만 적용되므로 동일하게는 x) 

　
## 3. Operator
### 트러블
Character원시값들 중, `뺄셈 기호`가 `음수를 뜻하는 부호`와 같아서 이 둘을 어떻게 구분해줘야 할까 고민
### 해결 방법
스토리보드에 기 구현된 버튼이름에서 아이디어를 얻어 음수 부호(일반 하이픈: `-`)와 연산자 부호(특수문자: `−`)를 구분해서 사용하기로 함

　
## 4. 유닛 테스트
### 트러블
step1에서와 마찬가지로, 이번에도 테스트를 진행하려면 본래 소스코드를 일부 수정(접근제어 등..)해야 되는 상황이 발생 ㄱ<br>
`ExpressionParserTests`에서는 XCTAssertEqual을 쓰기 위해 대상이 되는 타입들에 `Equatable`프로토콜을 적용해야만 했음 
### 해결 방법
<details>
    <summary><strong>방법 1) 기존 해결방법</strong></summary>
  의논 끝에 해당 파일 상단에 간단한 확장을 추가<br>
    <pre><code>
    extension Formula: Equatable {
            static func == (lhs: Formula, rhs: Formula) -> Bool {
                lhs.operands.items == rhs.operands.items && lhs.operators.items == rhs.operators.items
        }
    }
    </code></pre>
</details>
<details>
    <summary><strong>방법 2) Jake의 조언</strong></summary>
고민하신 부분처럼 이 테스트에서 필요하다면 상단에 extension을 통해서 구현할 수도 있을 것 같고,
해당 테스트에서 테스트하고 싶은 내용은 올바르게 분리되는지인 것 같습니다.<br>
따라서 메서드를 2개로 나눠서 연산자가 제대로 분리되고 값이 같은지 확인하고, 피연산자가 제대로 분리되어서 값이 같은지 확인하는 방법도 있을 것 같긴하네요.<br><br>
    [피드백 참고하여 수정 ⬇]<br>
  - <code>func test_완성된_계산식에서_연산자들이_올바르게_분리되는지_확인한다()</code><br>
  - <code>func test_완성된_계산식에서_피연산자들이_올바르게_분리되는지_확인한다()</code>
</details>

 　
## 학습내용 요약
- step1 때 학습한 프로토콜의 심화내용과 적용예시를 이어서 공부하고 적용
- Unit Test에서 테스트 범위나 단위에 대해 같이 고민하며 테스트의 중요성을 이해함


