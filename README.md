# 📢📢📢 Flutter Best Architecture Challenge 📢📢📢
## 介紹
- 此為參加 Flutter Best Architecture Challenge 活動的專案

## 架構
### Clean Architecture
依據 Clean Architcture 架構設計分層
![image](https://github.com/easylive1989/BestArchitectureChallenge/blob/main/images/CleanArchitecture.jpeg)

**data**
- 分類與功能
   - external: 存取本地或者外部資料的類別
   - repository: 實作 Domain 層的 Repository
- 相關套件:
   - dio

**domain**
- 分類與功能
   - use_case: 存放使用情境的類別
   - entity: 存放值物件或實體
   - repository: 存放資料存取的抽象介面
- 相關套件: 
   - equatable
   - json_serializable

**bloc**
- 分類與功能
   - 依照功能分類 
   - 主要負責管理 app 狀態，並提供方法與 ui 互動。
- 相關套件:
   - flutter_bloc

**ui**: 依據功能或頁面存放 Widget
### Dependency Injection
在 main 中組合 PostCubit，透過建構子注入 MainApp，再放進 BlocProvider 讓 Widget 存取
- 相關套件:
   - get_it
   - injectable
   - injectable_generator
## 測試
### Unit Test
測試 domain 與 bloc 類別
- 相關套件:
   - test
   - mockito
   - bloc_test

### Widget Test
測試 ui 顯示邏輯或互動
- 相關套件:
   - flutter_test

### E2E Test
模擬 user 行為測試 app 功能
- 相關套件:
   - integration_test
   - flutter_test

## 分析
### 優點
依據 Clean Architecture 分層，引入接縫，提高可測試性
### 缺點
架構分層讓程式較為複雜

## 建置相關
執行 build_runner 自動代碼
```
flutter pub run build_runner build --delete-conflicting-outputs 
```

執行 Integration test
```
flutter drive --driver=test_driver/integration_test.dart --target=integration_test/app_test.dart
```

## 聯絡方式
- e-mail: easylive1989@gmail.com
