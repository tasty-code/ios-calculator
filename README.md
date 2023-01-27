# ios-calculator - Team JALO
----

<a href ="#1-Step1---수행 중 핵심경험">Step1 - 수행 중 핵심경험</a>   
<a href ="#2-Step2---계산 타입 및 주변 타입 구현">Step2 - 계산 타입 및 주변 타입 구현</a>   
<a href ="#3-Step3---계산기 UI연동">Step3 - 계산기 UI연동</a>   

----
### Structures
|Type|Name|responsibility|
|---|---|---|
|`slass`|`Node`|Linked List의 데이터를 담고 서로 연결될 객체를 정의|
|`struct`|`LinkedList`|`LinkedList` 정의|
|`enum`|`Operator`|연산자의 정의 및 연산자 선택분기에 대한 처리정의|
|`enum`|`ExpressionParser`|입력된 데이터를 재가공하는 역할|
|`struct`|`Formula`|`ExpressionParser`가 가공하여 나온 연산가능한 결과물|
|`struct`|`CalculatorItemQueue`|연산자와 입력된 피연산자를 `LinkedList`를 이용하여 보관하다 연산순서에 따라서 반출하는 역할|


### Calculator UML
![](https://i.imgur.com/AgEl2XE.jpg)


## Step1 - 수행 중 핵심경험
[PR #18 | [Calculator Step1] Jason, Logan](https://github.com/tasty-code/ios-calculator/pull/18)
- TDD 방식으로 프로젝트 진행을 위해 Test-Target을 추가하여 UnitTest 진행
- 자료구조 Queue와 List를 이해하고 LinkedList를 직접 구현해보기
    - 배열(Array)와 연결리스트(LinkedList)를 비교하여 시간복잡도를 생각하며 직접 구현
    - Node를 관리하는 LinkedList 형태 구현

Stack과 Queue의 자료구조 차이를 학습하고 Array와 List를 비교하여 이번 프로젝트의 핵심적인 Custom Type에 대해 고민하였다.
List형태를 구현하기 위해서는 서로 떨어져있는 연속되지 않은 메모리에 저장된 데이터들을 연결하기 위해 아래와 같은 Node 형태를 구성하였다.
|데이터 저장|내 다음 데이터의 주소값|
|:--:|:--:|
|data|next|

```Swift
final class Node<Element> {
    
    var next: Node?
    var data: Element
    
    init(next: Node? = nil, data: Element) {
        self.next = next
        self.data = data
    }
}
```
UML을 사용해서 진행하여야해서 Class Diagram에 대해 학습 후 직접 그려보면서 프로젝트 로직을 이해하려고하였다.
PR에는 Step2에서 제공된 UML이 아닌 Custom UML을 작성하였다.

<br/>

## Step2 - 계산 타입 및 주변 타입 구현
[PR #23 | [Calculator Step2] Jason, Logan](https://github.com/tasty-code/ios-calculator/pull/23)
- 활동학습을 통한 LinkedList의 확장된 기능 (map(), filter()) 구현
- Generic 타입으로의 구현
- 지속적인 TDD 개선

요구사항의 옵션 사항으로 TDD를 계속 진행할 지 선택하는 부분에서 TDD를 좀 더 경험해보고싶어서 기존과 동일하게 진행하였다.
Step1을 통해 Node 타입을 구현하였고 Node를 관리하기위해 아래와 같은 메서드를 구현하였다.
|메서드 명|기능|
|:--|:--|
|isHeadEmpty()|head의 존재를 파악한다|
|getHead()|haed를 가져온다|
|popHead()|head에 해당하는 Node의 데이터를 반환한다|
|append(data:)|새로운 Node를 맨 뒤에 추가한다|
|removeLast()|맨 뒤의 노드를 제거한다|

이후에는 정해져있는 UML에 맞춰 Operator, Extension-String, CalculateItem, ExpressionParser를 구현하였다.

### 🎯 트러블 슈팅
Test-Target을 추가하여 진행하는데 swift 파일만 추가하면 Simulator가 여러개 생성되는 불편함이 발생하였다.
해결방법으로 Bundle을 파일별로 추가하여 진행하면되었다!

<img src="https://user-images.githubusercontent.com/92699723/215030433-e922bb06-16fb-4259-8b28-8c057a89b422.png" width="906">

## Step3 - 계산기 UI연동
_
