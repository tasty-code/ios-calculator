# ios-calculator

계산기 프로젝트
참여자 : d.o && sunny
기간 : 2023.01.16 ~ 2023.01.27

## 발생한 문제
    
    💡 `“1+2+3”` 을 `[”1”, “+”, “2”, “+”, “3”]` 배열로 리턴하는 함수를 만들고자 했어요
    
   -   `split(separator: "+")` 을 사용하여 문자열을 나누면 `“+”` 가 사라지면서 String 배열을 생성한다.
        
    -   즉 `[”1”, “+”, “2”, “+”, “3”]` 이 아닌 `[”1”, “2”, “3”]` 이 출력되요
        
        ```swift
        var userInput: String = "1+2+3"
        
        userInput.split(separator: "+")
        // ["1", "2", "3"]
        
        ```
        
    
**해결방법**
    
   -   `replacingOccurrences` 를 사용해 `“+”` 에 공백을 넣어 `“ + “`로 만들어 주고, `“ “` 을 기준으로 `seperate` 하여 공백을 제거 및 분리하여 원하는 형태의 배열을 얻었어요
        
        ```swift
        var userInput: String = "1+2+3"
        
        userInput.replacingOccurrences(of: "+", with: " + ") 
        // "1 + 2 + 3"
        userInput.replacingOccurrences(of: "+", with: " + ").split(separator: " ")
        // ["1", "+", "2", "+", "3"]
        
        ```
        
    
**다시 발생한 문제**
    
   -   원하는 리턴값을 얻었으나 `.split()` 으로 얻은 리턴값의 타입은 `Array<Substring>.Type` 으로, 최초에 원했던 `Araay<String>` 형태가 아니에요
    
   **해결방법**
    
   -   `.split()` 대신 `.components()` 를 사용하여 리턴값으로 `Array<String>` 형태를 얻을 수 있었어요!
        
        ```swift
        var userInput: String = "1+2+3"
        
        userInput.replacingOccurrences(of: "+", with: " + ").components(separatedBy: " ")
        // ["1", "+", "2", "+", "3"]
        
        ```
        
## 이번주 학습내용 요점정리
    
    ❗ **Queue 내부 List 형식 자료구조 : ArrayList vs LinkedList**
    
CalculatorItemQueue 내부 List 형식 자료구조를 직접 구현해도 된다는 요구사항을 보고 저희는 고민을 많이 했어요. ArrayList를 사용할지, LinkedList를 사용할지 치열한 고민 끝에 아래와 같은 이유로 LinkedList를 사용하기로 결정했어요!
    
-   Array는 정적인 자료구조로, 생성하는 순간 특정 양의 메모리가 정해져있어요. 만약 정해진 메모리를 초과하여 elements를 저장하려 한다면 더 큰 양의 Array 메모리가 재생성되어 elements 복사가 일어나요. 반면 LinkedList는 동적인 자료구조로, 저장하려는 node의 크키가 늘어나도 List추가가 자유로워요.

-   Array는 데이터의 접근/탐색에 있어 시간복잡도가 낮고, Linked List는 데이터의 추가/삭제에 있어 시간복잡도가 낮아요. 이번 프로젝트에서는 Queue 자료구조를 사용하기 때문에 Queue의 tail에서는 데이터의 추가가 일어나고 head에서는 데이터의 삭제가 일어나요. Queue의 중간에서 데이터의 추가/삭제가 일어나지 않기 때문에 Linked List를 사용하는 것이 시간복잡도 측면에서 유리해요!
   -   이번 프로젝트에서는 사칙연산과 숫자만 List에 저장하는 방식이기 때문에 ArrayList를 사용한다해서 유의미한 동작 시간 차이가 날 것이라 생각하지 않았어요. 하지만 Array는 지금까지 많이 사용해보았기 때문에 공부 차원에서 LinkedList를 선택한 이유도 있어요

## 다음주 프로젝트 계획
    
   -   CalculateItem protocol을 고려하고 코드를 작성하려 하면 아직 개념적으로 정리되지 않았기 때문에 막히는 부분이 많아요. 때문에 CalculateItem을 생각하지 않고 먼저 코드를 구현한 다음, refactoring을 통해 protocol을 채택할 계획이에요.
  -   현재 LinkedList의 ItemNode 는 data와 next 속성으로 구성되어있어요. data 타입을 String으로 우선 구현할거에요.
  -   1차 코드를 끝낸 이후, CalculateItem protocol을 넣어 이번주에 배운 protocol과 delegate 개념을 사용할 계획이에요.
