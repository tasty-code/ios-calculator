# 🗓 README

　
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

　
## 다음 주 계획
* 연휴동안 지금까지 구현한 코드에 대해 예외처리, 에러처리 고민
* 1/25(수) Step 2 PR 보내기
* 1/26(목) ~ Step 3(UI 연동)

　
 　
