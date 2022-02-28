# Goal of this project  
- 코드로 화면 전환(push/present)
- storyboard(즉 segue)로 화면 전환(push/present) 

## 정리
### 0. 공통  
- storyboard(self.storyboard 혹은 UIStoryboardSegue) 에서 다음 VC를 받아온다.  

### 1. Segue  
- 스토리보드에서 화면간 연결하면 끝이기 때문에 조금 더 편하다.
- 화면 전환시 delegate 연결 등의 선작업을 위한 prepare 함수를 구현해야 한다.  
```swift
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segue 전에 자동으로 호출
        if let VC = segue.destination as? SeguePushViewController {
            VC.nameLabel.text = "prepare"
        }
    }
```

### 2. Code
- 화면 전환시 UIViewController에 내제된 present 함수로 화면 전환한다.
- 선작업은 present 호출전 이뤄지기 때문에 따로 함수를 구분하지 않아도 된다.  
```swift
    @IBAction func pressPresentByCode(_ sender: UIButton) {
        guard let codePresentVC = self.storyboard?.instantiateViewController(withIdentifier: "CodePresentViewController") as? CodePresentViewController else {
            return
        }
        codePresentVC.modalPresentationStyle = .fullScreen
        codePresentVC.delegate = self
        self.present(codePresentVC, animated: true)
    }
```
