# Demo
## Home
![image](https://hackmd.io/_uploads/rkVkHnLS0.png)
### 多個類型電影列表
![image](https://hackmd.io/_uploads/B1CrHnIrC.png)
## Upcoming
![image](https://hackmd.io/_uploads/r1aFrhLrA.png)
### Youtube 預告片
![image](https://hackmd.io/_uploads/SksyU2ISA.png)
## Search
![image](https://hackmd.io/_uploads/S1A-Lh8rC.png)

# Creating new Xcode Project

## 創建新專案

- 打開 Xcode 並選擇創建一個新的應用程式專案
- 專案命名為 Netflix
- 選擇使用 Storyboard 和 Swift
- 點擊下一步並選擇安裝位置

## 移除 Storyboards

- 不使用 Storyboards，需先將其移除
  - 點擊 `Main.storyboard` 並移至垃圾桶
  - 在 `Info.plist` 中刪除 Scene Configuration 的 Storyboard 名稱
  - 使用 `Shift + Command + F` 搜索 `main`，刪除所有 `UI Kit Main Storyboard` 的參考

## 配置 Scene Delegate

- 開啟 `SceneDelegate` 文件，進行配置以不使用 Storyboards
- 重命名變數為 `windowScene`
- 使用以下代碼配置窗口：

```swift
// 初始化窗口
window = UIWindow(windowScene: windowScene)

// 設置窗口框架
window?.frame = windowScene.coordinateSpace.bounds

// 設置窗口場景
window?.windowScene = windowScene

// 設置根視圖控制器
window?.rootViewController = ViewController()

// 使窗口可見並成為主窗口
window?.makeKeyAndVisible()
```

## 建立初始結構

- 構建應用程式的基本結構
  - 確認應用程式的窗口正確設置
  - 設定初始的根視圖控制器

## 構建應用介面

- 開啟 Netflix 應用程式進行參考
- 準備開始構建主頁面
  - 主頁面包含一個底部 Tab Bar，可以在不同頁籤之間導航

## 準備工作總結

- 完成 Xcode 專案創建並移除不必要的 Storyboards
- 配置 Scene Delegate 以使用程式碼設置窗口和視圖控制器
- 準備開始構建應用的 UI 和導航結構


# Creating MainTabBarViewController
## 更改主視圖控制器名稱

- 將名稱更改為 `MainTabBarViewController`
- 將其類型改為 `UITabBarController`
- 設定應用程式的起始點

## 設定背景顏色與模擬器

- 更改主視圖的背景顏色為 `systemYellow`
- 選擇最新的 iPhone 13 Pro Max 模擬器
- 使用 `Command+R` 來建構並執行應用程式

## 創建 Controllers 資料夾與檔案

- 創建一個名為 `Controllers` 的資料夾
- 創建新的 Cocoa Touch Class 檔案
  - HomeViewController
    - 刪除預設代碼
    - 設定背景顏色為紅色
  - UpcomingViewController
    - 刪除預設代碼
    - 設定背景顏色為綠色
  - SearchViewController
    - 刪除預設代碼
    - 設定背景顏色為粉紅色
  - DownloadsViewController
    - 刪除預設代碼
    - 設定背景顏色為藍色

## 初始化視圖控制器

- 初始化 `MainTabBarViewController` 的四個子視圖控制器
  - 使用 `UINavigationController` 包裹每個視圖控制器
  - 原因是每個控制器都可能需要進行頁面導航

```swift
let vc1 = UINavigationController(rootViewController: HomeViewController())
let vc2 = UINavigationController(rootViewController: UpcomingViewController())
let vc3 = UINavigationController(rootViewController: SearchViewController())
let vc4 = UINavigationController(rootViewController: DownloadsViewController())

tabBarController.viewControllers = [vc1, vc2, vc3, vc4]
```

## 設定 Tab Bar 圖示與標題

- 使用 SF Symbols 設定每個視圖控制器的圖示
  - `HomeViewController` 使用 `house` 圖示
  - `UpcomingViewController` 使用 `play.circle` 圖示
  - `SearchViewController` 使用 `magnifyingglass` 圖示
  - `DownloadsViewController` 使用 `arrow.down.to.line` 圖示

```swift
vc1.tabBarItem.image = UIImage(systemName: "house")
vc2.tabBarItem.image = UIImage(systemName: "play.circle")
vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
vc4.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
```

- 設定每個視圖控制器的標題
  - `HomeViewController` 標題為 "Home"
  - `UpcomingViewController` 標題為 "Coming Soon"
  - `SearchViewController` 標題為 "Top Searches"
  - `DownloadsViewController` 標題為 "Downloads"

```swift
vc1.title = "Home"
vc2.title = "Coming Soon"
vc3.title = "Top Searches"
vc4.title = "Downloads"
```

## 設定背景顏色與 Tint 顏色

- 將所有控制器的背景顏色設為 `systemBackground` 以避免過於鮮艷的顏色
- 設定 `MainTabBarViewController` 的 `tintColor` 為 `label`，以便在深色模式和淺色模式下都顯示正確顏色

```swift
view.backgroundColor = .systemBackground
tabBar.tintColor = .label
```

## 測試與調整

- 在深色模式和淺色模式下測試應用程式，以確保顯示效果正確

## 後續計畫

- 在下一個視頻中，將開始設置 `HomeViewController`
  - 將設置一個 `tableView`
  - 每個 `tableView` 單元格將包含一個橫向滾動的 `collectionView`
  - 確保高效載入資料，以避免一次加載過多内容


# Setting HomeViewController TableView

## 初始化 TableView
- 在 HomeViewController 中使用匿名閉包模式初始化 TableView。
- 使用 `UITableView` 類型來初始化 TableView，並設置其為整個螢幕的大小。

## 設置 TableView 的代理和數據源
- 將 TableView 的代理和數據源設置為 HomeViewController。
- 通過擴展 `UITableViewDelegate` 和 `UITableViewDataSource` 協議來實現相應的代理方法。

## 加載 TableView 的內容
- 實現 `UITableViewDataSource` 協議中的方法，包括 `numberOfRowsInSection` 和 `cellForRow`。
- 在 `cellForRow` 方法中，使用 `dequeueReusableCell(withIdentifier:for:)` 方法來取得可重用的單元格，並返回相應的單元格。

## 自定義 TableViewCell
- 創建自定義的 `UITableViewCell` 類，命名為 `CollectionViewTableViewCell`。
- 在 `CollectionViewTableViewCell` 中設置 `static let identifier` 作為重用標識符。
- 在 `CollectionViewTableViewCell` 中設置背景顏色，以便區分每個單元格。

## 設置 TableView 的區段和頭部
- 實現 `UITableViewDelegate` 協議中的方法 `heightForHeaderInSection` 和 `numberOfSections`。
- 通過設置 `UITableView` 的樣式為 `grouped` 來顯示區段的標題。
- 在 `numberOfSections` 方法中返回區段數量。

## 添加區段中的單元格
- 實現 `UITableViewDataSource` 協議中的方法 `numberOfRowsInSection`，在每個區段中返回單元格的數量。
- 通過設置每個區段只有一行，確保每個區段僅包含一個單元格。

## 補充說明
- 使用匿名閉包模式初始化 TableView 可以保持代碼的簡潔性。
- 正確設置 TableView 的代理和數據源是確保 TableView 正常運作的關鍵。
- 自定義 TableViewCell 可以實現更加個性化的單元格設計和布局。
- 通過設置區段的頭部，可以在 TableView 中添加額外的分類信息或標題。
- 確保每個區段只包含一個單元格可以簡化 TableView 的布局和管理。

# Setting home TableViewCell and it’s CollectionView

## 定義 CollectionViewCell
- 在 HomeViewController 中定義一個新的 CollectionViewCell，使用匿名閉包模式初始化。
- 創建私有屬性 `collectionView` 作為 `UICollectionView` 實例，並設置其框架為零。
- 定義 `UICollectionViewFlowLayout` 作為 CollectionView 的佈局，並設置水平滾動。

## 設置 CollectionView 的代理和數據源
- 將 CollectionView 的代理和數據源設置為 HomeViewController。
- 實現 `UICollectionViewDelegate` 和 `UICollectionViewDataSource` 協議中的方法，包括 `cellForItemAt` 和 `numberOfItemsInSection`。

## 添加 CollectionViewCell 的內容
- 實現 `UICollectionViewDataSource` 協議中的方法 `cellForItemAt` 和 `numberOfItemsInSection`，為 CollectionView 添加單元格內容。
- 設置每個單元格的背景顏色和大小，並確保它們填滿整個 CollectionViewCell。

## 設置 TableView 的區段頭部
- 在 `viewDidLoad` 方法中設置 TableView 的表頭視圖，以顯示一個額外的區段作為標題。
- 設置一個具有指定大小的 UIView 作為表頭視圖，並將其添加到 TableView 中。

## 補充說明
- 使用匿名閉包模式可以快速初始化 CollectionViewCell。
- 正確設置 CollectionView 的代理和數據源是確保其正常運作的重要步驟。
- 通過實現協議中的方法，可以為 CollectionView 添加動態內容和適當的數量的單元格。
- 設置 TableView 的表頭視圖可以添加額外的區段，以顯示額外的信息或標題。


# Creating Table’s HeaderView

## 創建 HeroHeaderView

- 在 `view` 文件夾中創建新文件 `HeroHeaderView.swift`。
- 初始化 `HeroHeaderView` 並設置 frame。
- 添加 `UIImageView` 作為標頭圖片。

## 添加漸變效果

- 創建 `addGradient` 函數，添加漸變效果。
- 使用 `clear` 和系統背景色作為漸變的顏色。
- 將漸變圖層添加到視圖上。

## 添加播放按鈕

- 創建播放按鈕 `playButton`。
- 設置按鈕樣式、邊框顏色、寬度等。
- 使用約束將按鈕放置在視圖上。

## 添加下載按鈕

- 創建下載按鈕 `downloadButton`，並設置樣式、邊框顏色等。
- 使用約束將按鈕放置在視圖上。

## 調整按鈕樣式和位置

- 調整按鈕之間的間距和寬度。
- 使用 `cornerRadius` 設置按鈕的圓角。

## 實際效果展示

- 通過不斷調整按鈕的屬性和約束，最終實現所需的效果。
- 優化視覺效果，確保按鈕和圖片之間的間距和尺寸看起來舒適自然。

# Customizing the navigation bar

## 配置導航欄

- 創建 `configureNavbar` 函數以配置導航欄。
- 將 Netflix 圖標添加到導航欄左側。
- 使用 `renderMode` 設置圖標的渲染模式。
- 調整導航欄的顏色為白色。

## 添加按鈕到導航欄

- 使用 `navigationItem.rightBarButtonItems` 添加多個按鈕。
- 使用系統提供的圖標作為按鈕的圖示。
- 配置按鈕的樣式和行為。

## 實現導航欄隱藏效果

- 使用 `scrollViewDidScroll` 方法監聽滾動事件。
- 計算導航欄應該偏移的量，以實現隱藏效果。
- 使用 `transform` 調整導航欄的位置和大小。

## 預期效果展示

- 測試導航欄的行為，包括向下拉出時的顯示和向上滑動時的隱藏。
- 確保導航欄的顏色、按鈕和行為與預期相符。


# Setting Tableview sections titles

## 定義分區標題數組

- 創建 `sectionTitles` 數組，用於存儲表格視圖的分區標題。
- 添加各個分區的標題，包括趨勢電影、熱門電視節目等。

## 設置分區數量

- 將表格視圖的分區數量設置為 `sectionTitles.count`，以動態匹配標題數量。

## 設置分區標題

- 通過 `titleForHeaderInSection` 方法設置各個分區的標題。
- 根據分區索引返回相應的標題字符串。

## 自定義分區標題顯示效果

- 實現 `tableView(_:willDisplayHeaderView:forSection:)` 方法以自定義分區標題的顯示效果。
- 設置標題的字體、顏色和位置。

## 預期效果展示

- 測試分區標題的顯示效果，包括字體、顏色和位置是否符合預期。
- 確保分區標題的內容與提供的分區標題數組一致。

# Sending URL Requests and Parsing JSON response

## 準備發送 URL 請求

- 通過訪問 TMDB 網站，獲取 API 金鑰，用於訪問 TMDB 的數據庫。
- 在 Xcode 中創建 `APICaller` 類，用於管理所有的 API 請求。
- 在 `Constants` 中設置基本的 URL，以便於之後的請求中使用。

## 建立 API 請求函數

- 在 `APICaller` 類中，創建 `getTrendingMovies` 函數，用於獲取熱門電影的數據。
- 使用 URL 構建器構建請求的 URL。
- 創建 URL 會話和數據任務以發送請求。

## 解析 JSON 響應

- 使用 JSONDecoder 將 JSON 數據解析為 Swift 對象。
- 創建 `TrendingMoviesResponse` 結構來映射 API 響應中的數據結構。
- 創建 `Movie` 結構來表示每部電影的屬性。

## 處理成功和失敗情況

- 使用結果對象來處理成功和失敗情況。
- 在成功時將數據傳遞給回調函數，並在失敗時傳遞錯誤信息。

## 在視圖控制器中調用 API 函數

- 在視圖控制器中調用 `getTrendingMovies` 函數，以獲取熱門電影的數據。
- 根據 API 響應的結果，執行相應的操作，例如顯示數據或處理錯誤。

## 重點補充

- 確保 API 請求中包含所需的 API 金鑰，以獲取數據。
- 使用結果對象來處理 API 請求的成功和失敗情況。
- 使用 JSONDecoder 將 API 響應解析為 Swift 對象，以方便後續處理和顯示數據。

# Using Extensions

## 創建擴展文件

- 在資源文件夾中創建一個新的檔案，命名為 extensions.swift。
- 在這個檔案中，擴展了字符串（String）數據類型。

## 定義擴展方法

- 在字符串（String）數據類型的擴展中，定義了一個名為 capitalizeFirstLetter 的方法。
- 這個方法將字符串的第一個字母轉換為大寫，並將其餘部分轉換為小寫。

## 重點補充

- 擴展是一種強大的工具，用於向現有類型添加新功能，而無需修改原始類型的代碼。
- 通過擴展，可以使代碼更加模組化和易於維護，並且可以將相關的功能分組在一起。
- 在這個例子中，使用擴展來將字符串的首字母大寫化，這樣可以在代碼中重用這個功能，而不需要在每個地方都單獨處理。
- 這種做法使得代碼更加乾淨和可讀，並且提高了代碼的可維護性。

# Consuming API To Fetch Data for each Section

## 修復 API 請求

- 在之前的部分，我們注意到從 API 中獲取的數據不僅包含電影，還包括電視節目等其他類型的數據。
- 通過將請求限制為僅獲取電影數據，我們可以確保每個請求都只返回我們感興趣的類型。

## 實現電視節目的 API 請求

- 我們創建了一個新的 API 請求函數 `getTrendingTVs()`，用於從服務器獲取正在流行的電視節目數據。
- 通過將結果轉換為 `TrendingTVResponse` 對象，我們可以將 JSON 數據解析為可用於應用程序的模型。

## 使用同一模型處理不同類型的數據

- 雖然我們在 `TrendingTVResponse` 中定義了專門用於電視節目的模型，但由於服務器返回的數據結構相似，我們可以重複使用與電影相同的模型。
- 這樣可以減少代碼中的重複，提高代碼的重用性和可維護性。

## 擴展 API 請求

- 通過添加額外的 API 請求函數，我們能夠從服務器獲取更多類型的數據，如即將上映的電影、熱門電影等。
- 每個 API 請求函數都遵循相同的模式，這使得代碼更加結構化和易於理解。

## 下一步計劃

- 現在我們已經設置了所有必要的 API 請求，下一步是從返回的數據中提取我們需要的信息，並將其用於應用程序的不同部分。
- 我們將繼續開發應用程序，將圖片和海報添加到 UI 中，從而創建一個真正可用的應用程序。

# Refactoring Models 

## 合併電視節目和電影模型

- 我們注意到電視節目和電影的模型是完全相同的，因此不需要分開定義兩個模型。
- 通過刪除 `TV` 模型並將 `Movie` 模型更名為 `Title` 模型，我們可以減少重複並使代碼更加精簡。

## 更新模型文件

- 將 `Movie.swift` 文件重命名為 `Title.swift`，以反映其現在包含的數據不僅限於電影。
- 在 `Title.swift` 中，將類型 `Movie` 更名為 `Title`，以反映其用途更廣泛的特性。

## 更新相關代碼

- 在 `APICaller.swift` 中，將所有與電影相關的命名更改為 `Title`，以反映新的模型名稱。
- 通過這種方式，我們可以保持代碼的一致性並避免錯誤。

## 使用自定義錯誤類型

- 通過使用自定義的 API 錯誤類型，我們可以更好地管理錯誤和異常情況。
- 確保在處理 API 請求時，將適當的錯誤類型返回給調用者，以便更好地處理錯誤情況。

## 測試和驗證

- 最後，通過構建和運行應用程序來驗證我們的更改是否正確。
- 確保所有 API 請求仍然正常工作並返回所需的數據，以確保重構不會導致任何錯誤或問題。

# Creating Custom CollectionViewCell

## 創建 TitleCollectionViewCell

- 在 "Views" 文件夾中創建一個新的 Cocoa Touch 類文件，命名為 "TitleCollectionViewCell"。
- 這個自定義的 CollectionViewCell 將負責顯示 CollectionView 中的內容，並包含一個圖片視圖用於顯示海報。

## 設置 Cell 的標識符

- 在 "TitleCollectionViewCell" 類中添加靜態方法 "static selectIdentifier()"，用於設置 CollectionViewCell 的標識符。

## 添加圖片視圖

- 在 "TitleCollectionViewCell" 類中添加一個私有屬性 "posterImageView"，並將其設置為 UIImageView 類型。
- 初始化圖片視圖並設置其內容模式為 "scaleAspectFill"，以填充整個 CollectionViewCell。

## 配置 Cell

- 添加一個公共方法 "configure(with model: String)"，用於配置 CollectionViewCell 的內容。
- 此方法接受一個字符串參數，該字符串表示海報的 URL。
- 使用第三方庫 "SDWebImage" 中的方法來加載並設置海報圖片。

## 集成 SDWebImage

- 使用 Swift Package Manager 將 "SDWebImage" 整合到項目中，以便在 CollectionViewCell 中加載圖片。
- 確保導入 "SDWebImage"，並使用其提供的方法來設置圖片。

## 測試和驗證

- 確保在配置 CollectionViewCell 後，可以正確顯示海報圖片。
- 通過將模型數據（海報 URL）傳遞給 CollectionViewCell，驗證圖片是否正確顯示。

# Passing data to the CollectionView 

## 首先處理 API 調用

- 在 `HomeViewController` 中，刪除了 `fetchAPIData()` 方法，並且移除了相應的方法調用。
- 確保在 `APICaller` 中的每個 API 調用都會將結果通過完成處理程序回傳。

## 創建 Section 枚舉

- 在 `HomeViewController` 的類定義中創建一個枚舉 `sections`，用於標識不同的集合視圖區段。
- 定義與每個區段相對應的索引值，例如趨勢電影、趨勢電視節目等。

## 設置 CollectionViewCell

- 使用自定義的 `TitleCollectionViewCell` 來配置集合視圖中的每個單元格。
- 在 `collectionView(_:cellForItemAt:)` 方法中，使用 `TitleCollectionViewCell` 來 deque 並配置單元格。

## 處理 API 响應

- 在 `HomeViewController` 中，使用 switch 來根據不同的區段處理每個 API 的響應。
- 為每個成功的 API 響應配置相應的單元格數據，並在失敗時處理錯誤。

## 更新集合視圖

- 當從 API 獲取到新數據時，使用 `collectionView.reloadData()` 來更新集合視圖。
- 確保在主線程中更新集合視圖，以避免 UI 更新問題。

## 配置單元格

- 在 `TitleCollectionViewCell` 中，使用 `configure(with model: String)` 方法來設置單元格的內容。
- 在此方法中，使用 `SDWebImage` 加載和設置海報圖片。

## 測試和驗證

- 通過運行應用程序來測試所有更改，確保集合視圖顯示了來自 API 的數據。
- 檢查單元格是否正確配置，圖片是否顯示正常，並且沒有出現任何錯誤。

# Viewing poster images inside CollectionViewCell

## 從影片數據庫 API 獲取圖片

- 在開發者網頁中，使用圖片搜尋功能找到了圖片的 URL。
- 從 API 獲取的數據將替換之前硬編碼的圖片 URL。

## 創建圖片 URL

- 在 `TitleCollectionViewCell` 中，使用 API 返回的數據來動態創建圖片 URL。
- 使用影片的海報路徑來組合 URL，並將其用作圖片的 URL。

## 設置圖片

- 在 `configure(with model: String)` 方法中，使用 SDWebImage 將圖片設置到 `UIImageView` 中。
- 使用創建的圖片 URL 來加載和顯示海報圖片。

## 測試和驗證

- 通過運行應用程序來測試所有更改，並確保集合視圖中的圖片正常顯示。
- 確認每個單元格都顯示了正確的海報圖片，並且沒有任何錯誤發生。

# Creating Upcoming TableView inside Upcoming Tab

## 設置標題和大標題

- 在 `UpcomingViewController` 中，設置了標題為 "Upcoming"，並啟用了導航欄的大標題。
- 大標題顯示模式設置為 `always`，以確保標題始終可見。

## 創建表格視圖

- 創建了一個 `UITableView` 實例，命名為 `upcomingTable`，並設置了其代理和數據源。
- 使用匿名閉包設置表格視圖，並註冊了一個普通的表格視圖單元格。

## 實現數據源和代理方法

- 通過擴展 `UpcomingViewController` 來實現 `UITableViewDelegate` 和 `UITableViewDataSource`。
- 在 `tableView(_:numberOfRowsInSection:)` 中返回項目的數量，並在 `tableView(_:cellForRowAt:)` 中配置單元格。

## 獲取即將上映的電影

- 創建了一個私有方法 `fetchUpcoming()`，其中調用了 API 調用器以獲取即將上映的電影數據。
- 通過 `switch` 語句處理 API 調用結果的成功和失敗情況。
- 在成功時，將獲取的標題賦值給 `titles` 數組，並重新加載表格視圖的數據。
- 在失敗時，打印錯誤信息以便進行故障排除。

## 調用 `fetchUpcoming()` 方法

- 在 `viewDidLoad()` 中調用 `fetchUpcoming()` 方法，以確保在視圖加載時獲取即將上映的電影數據。

## 測試和驗證

- 通過運行應用程序來測試所有更改，確保即將上映的電影顯示在表格視圖中。
- 確認每個單元格都顯示了正確的電影標題，並且在發生錯誤時進行了適當的錯誤處理。

# Creating custom TableViewCell from the upcoming table

## 創建 TitleTableViewCell 類別

- 在 Views 文件夾中創建了一個新的 Cocoa Touch 類別，命名為 TitleTableViewCell。
- 這個類別繼承自 UITableViewCell，將用於自定義表格視圖單元格。

## 定義屬性和初始化方法

- 定義了三個私有屬性：titlePosterImageView、titleLabel 和 playTitleButton，分別用於顯示海報圖片、標題和播放按鈕。
- 在初始化方法中，設置了單元格的樣式和重用標識符，並初始化了這些屬性。

## 添加視圖元素

- 初始化了海報圖片視圖、標題標籤和播放按鈕，並設置了它們的屬性。
- 將這些視圖添加到單元格的 contentView 中。

## 創建配置方法

- 創建了一個公共方法 `configure(with model: TitleViewModel)`，用於配置單元格並顯示相關數據。
- 在這個方法中，根據傳入的視圖模型，設置了海報圖片、標題文本。

## 實現自動布局和約束

- 創建了一個私有方法 `createConstraints()`，用於創建單元格中視圖元素的自動布局約束。
- 在這個方法中，設置了海報圖片視圖、標題標籤和播放按鈕的約束，以確保它們在單元格中正確佈局。

## 使用第三方庫設置海報圖片

- 在 `configure(with model: TitleViewModel)` 方法中，使用了第三方庫（可能是 SDWebImage）來設置海報圖片，從而實現從網絡加載圖片並設置到海報圖片視圖中。

## 測試和驗證

- 通過創建和配置單元格來測試 `TitleTableViewCell` 類別。
- 確保海報圖片、標題和播放按鈕正確顯示在單元格中，並且自動布局和約束正確工作。

# Creating TitleViewModel

## 創建 TitleViewModel 結構

- 創建了一個名為 TitleViewModel 的 Swift 檔案，並在其中定義了一個結構 TitleViewModel。
- 這個結構包含兩個屬性：titleName 和 posterURL，分別用於存儲標題名稱和海報圖片的 URL。

## 定義屬性

- titleName：標題名稱的字符串屬性。
- posterURL：海報圖片的 URL 的字符串屬性。

## 補充

- 在 TitleViewModel 結構中，titleName 和 posterURL 屬性的類型均為字符串。
- 這個結構的目的是為了封裝標題相關的數據，以便於在應用程序中進行傳遞和使用。
- TitleViewModel 可以根據應用程序的需要進行擴展，例如添加更多屬性來表示其他相關數據，或者定義初始化方法來方便創建實例。

## 使用

- 在 UpcomingViewController 中，將從 API 獲取的標題數據轉換為 TitleViewModel 的實例，以便將其傳遞給 TableViewCell 進行顯示。
- TitleViewModel 提供了一種統一的方式來組織和管理標題數據，使代碼更加清晰和易於維護。

# Creating Top Search TableView inside TopSearch tab

## 複製功能

- 將與 Upcoming Tab 相同的功能複製到 Top Search Tab。
- 該功能包括設置標題、喜好的大標題以及配置 TableView。

## 創建 TableView

- 在 Top Search Tab 中創建一個 TableView 用於顯示發現的內容。
- 複製了與 Upcoming Tab 中相同的 TableView 樣式，因為兩者的功能類似，可以重複使用同一個 TableView。

## 添加 Subview

- 添加 TableView 到 Top Search Tab 的畫面中。
- 設置 TableView 的佈局，使其填滿父視圖。

## 實現 TableView 相關功能

- 實現 TableView 的數據源和委託方法。
- 返回固定的行數和配置 TableViewCell。

## 補充

- 在 Top Search Tab 中，使用了與 Upcoming Tab 相同的 TableViewCell，這樣可以保持樣式的一致性。
- 使用了與 Upcoming Tab 中相同的標題數據來填充 TableView。
- 通過從電影數據庫獲取數據，實現了類似於 Upcoming Tab 的功能，使用戶可以在搜索之前發現和探索感興趣的內容。

## 使用 API Caller

- 創建了一個名為 `getDiscoverMovies` 的 API Caller 函數，用於獲取發現的電影數據。
- 通過在 API Caller 中定義該函數，可以將數據獲取的邏輯與視圖控制器分離，使代碼更加模塊化和易於維護。

## 使用 TitleViewModel

- 使用 TitleViewModel 封裝標題相關的數據。
- 將從 API 獲取的標題數據轉換為 TitleViewModel 的實例，以便將其傳遞給 TableViewCell 進行顯示。
- TitleViewModel 提供了一種統一的方式來組織和管理標題數據，使代碼更加清晰和易於維護。

# Creating SearchResultsViewController to display search results

## 建立新文件

- 創建了一個新的 View Controller 類型的檔案，名為 SearchResultsViewController，用於顯示從數據庫服務器檢索的數據。

## 設置背景顏色

- 將 SearchResultsViewController 的背景顏色設置為系統綠色，以驗證其正常運作。

## 組織文件層次結構

- 將不同的檔案組織到 core 和 general 兩個文件夾中，以便更好地組織代碼。
- 將與主要業務邏輯相關的檔案放入 core 文件夾中，如 HomeViewController、UpcomingViewController、SearchView 等。
- 在 general 文件夾中放置 SearchResultsViewController，這樣可以更清晰地區分不同功能或組件。

## 添加 SearchBar

- 在 SearchViewController 中初始化了一個 UISearchController。
- 設置了搜索框的提示文字和樣式，使其在 UI 上符合預期。
- 將 SearchController 添加到 NavigationController 的搜索欄項目中，以便在畫面上顯示搜索框。

## 創建 CollectionView

- 在 SearchResultsViewController 中創建了一個 UICollectionView 來顯示搜索結果。
- 設置了 CollectionView 的佈局，並註冊了與 Upcoming Tab 中相同的 CollectionViewCell。
- 將 CollectionView 添加到 SearchResultsViewController 的畫面中，並進行佈局配置。

## 實現 CollectionView 數據源方法

- 實現了 CollectionView 的數據源方法，包括設置分組數量和單元格數量。
- 實現了從數據庫獲取的標題數據顯示在 CollectionViewCell 中。

## 補充

- 通過將不同功能的代碼放入不同的文件夾中，可以使代碼更有組織性和可讀性。
- 使用 UISearchController 可以快速實現搜索框功能，並與 NavigationController 配合使用。
- 使用 UICollectionView 來顯示搜索結果，具有彈性且可以自由配置，以滿足不同屏幕尺寸的需求。

# Querying database for individual movie

## 新增 API 調用功能

- 在 API 調用器中新增了一個名為 `searchWithQuery` 的函數，用於根據用戶輸入的查詢字符串搜索電影資料庫。

## 組織 URL

- 根據電影數據庫服務器的要求，構建了用於搜索的 URL，包括基本 URL、API 金鑰和查詢字符串。

## 格式化查詢字符串

- 在發送查詢之前，對查詢字符串進行了格式化，以確保 URL 的正確性和完整性。

## 配置搜尋結果控制器

- 在搜尋視圖控制器中，配置了 `UISearchController` 的 `searchResultsUpdater`，使其更新搜索結果。

## 實現搜尋功能

- 實現了搜尋視圖控制器的 `updateSearchResults` 方法，以根據搜索框中的文本進行搜索。
- 在搜尋功能中添加了字符數檢查，以確保至少有三個字符才會觸發搜索。
- 調用 API 調用器的搜索功能，獲取電影標題的搜索結果。

## 處理搜索結果

- 根據 API 調用的結果，處理成功和失敗的情況。
- 將搜索結果更新到搜尋結果控制器中的 CollectionView 中，以顯示搜索到的電影標題。

## 補充

- 通過 API 調用器，可以輕鬆地與外部服務器進行通信，並獲取所需的數據。
- 使用 `UISearchController` 可以實現搜索框的功能，並方便地集成到應用程序的界面中。
- 在處理搜尋結果時，需要注意處理成功和失敗的情況，以確保應用程序的穩定性和可靠性。

# Using YouTube API

## 前往 Google 開發者控制台

- 點擊「Credentials」並建立一個新專案，例如命名為「Netflix Clone」。
- 獲得 API 金鑰，這將用於訪問 YouTube API 服務器。

## 啟用 YouTube API 服務

- 點擊「Enable APIs and Services」，然後選擇「YouTube Data API」並啟用它。

## 取得 API 金鑰

- 在「Credentials」部分找到 API 金鑰，並將其複製以供應用程序使用。

## 在應用程序中使用 API 金鑰

- 在 Xcode 中，將 API 金鑰添加到 API 調用器中的 `youtubeApiKey` 靜態變量中。

## 構建 YouTube API URL

- 根據 YouTube API 的文檔，構建用於發送搜索請求的 URL。

## 調用 YouTube API

- 創建一個名為 `getMovieWithQuery` 的函數，以搜索電影或視頻。
- 使用剛剛建立的 URL 和 API 金鑰，發送 HTTP 請求到 YouTube API 服務器。
- 處理成功和失敗的情況，並在成功時解析 API 響應。

## 補充

- 通過 Google 開發者控制台可以管理 API 金鑰和服務的啟用情況。
- 使用 YouTube API 可以輕鬆獲取和搜尋 YouTube 上的視頻內容。
- 在應用程序中使用 API 金鑰時，確保安全存儲並避免將其硬編碼在代碼中。

# Parsing YouTube API Response

## 查看 YouTube 服務器響應

- 從 YouTube 服務器獲取的響應是一個包含對象數組的數據結構。
- 每個對象具有 ID 屬性，其中包含視頻的 ID，可用於在 YouTube 上搜索實際視頻。

## 創建 YouTube 搜索響應模型

- 創建名為 `YouTubeSearchResponse` 的新結構，並遵循 `Codable` 協議。
- 定義了包含視頻元素的數組，並創建了 `VideoElement` 結構來表示這些元素。

## 獲取 YouTube 搜索結果

- 在 API 調用器中的 `getMovieWithQuery` 函數中，使用 JSON 解碼器將數據解碼為 `YouTubeSearchResponse`。
- 從搜索結果中獲取第一個視頻元素作為最佳匹配。

## 完成 API 調用器功能

- 在 `getMovieWithQuery` 函數中，通過完成處理程序返回搜索結果或錯誤。
- 將搜索結果返回到調用方以供使用。

## 補充

- 使用結構化的模型來表示 API 響應，使數據解析更加清晰和有效。
- 通過處理搜索結果，應用程序可以有效地提取所需的信息並進行相應的操作。
- 在 API 調用器中添加錯誤處理，以確保應用程序能夠處理潛在的錯誤情況。

# Handling selections of cells (Tapping on cells)

## 實現選擇功能

- 在 CollectionTableViewCell 中實現 `didSelectItem` 函數，用於處理當用戶點擊單元格時的操作。
- 在函數中，首先取消選擇當前單元格，然後獲取單元格對應的標題名稱進行後續處理。

## 獲取標題名稱並調用 API

- 獲取被選中單元格對應的標題名稱，並通過 API 調用器的 `getMovieWithQuery` 函數搜索相應的影片。
- 在搜索時，可以附加 "trailer" 關鍵詞以提高搜索準確性，使結果更加精準。

## 處理 API 響應

- 根據 API 調用的結果，如果成功獲取到影片元素，則打印其 ID。
- 如果出現錯誤，則打印錯誤信息以便進一步排查。

## 補充

- 通過處理單元格選擇事件，應用程序可以實現與用戶互動的功能，例如點擊後觀看相關視頻。
- 使用 API 調用器將單元格點擊事件與後端服務進行交互，從而實現數據的動態加載和處理。
- 調用 YouTube API 以搜索相關影片，並在應用程序中顯示相應內容，提供了更豐富的用戶體驗。

# Creating TitlePreviewViewController

## 建立新控制器

- 創建了一個名為 TitlePreviewViewController 的新控制器，用於展示影片預覽信息。

## 初始化視圖元素

- 初始化了 WebView、TitleLabel、OverviewLabel 和 DownloadButton，並設置其屬性。

## 創建 configureConstraints 函數

- 定義了一個函數 configureConstraints，用於設置視圖元素的布局約束。

## 實現 configure 函數

- 定義了 configure 函數，用於配置控制器的各個視圖元素，並設置相應的數據。

## 創建 TitlePreviewViewModel

- 創建了一個名為 TitlePreviewViewModel 的新文件，其中包含了一個用於構建 ViewModel 的結構。

## 實現 configureWithModel 函數

- 定義了一個函數 configureWithModel，用於根據傳入的 ViewModel 設置控制器的視圖元素和數據。

## 創建 CollectionViewTableViewCellDelegate 協議

- 定義了一個名為 CollectionViewTableViewCellDelegate 的協議，用於處理單元格點擊事件。

## 實現 didSelectItem 函數

- 在 CollectionViewTableViewCell 中實現了 didSelectItem 函數，用於處理當用戶點擊單元格時的操作。

## 實現 CollectionViewTableViewCellDelegate 協議

- 在 HomeViewController 中實現了 CollectionViewTableViewCellDelegate 協議，用於處理單元格點擊事件，並導航到 TitlePreviewViewController。

## 補充

- 通過創建 TitlePreviewViewController，實現了展示影片預覽信息的功能，提高了應用的交互性和可用性。
- 通過使用 ViewModel 和 Delegate，實現了組件化的設計，提高了代碼的可讀性和可維護性。
- 透過合適的佈局約束和視圖配置，使得應用的界面呈現更加美觀和統一。

# Refactoring TableViewHeader Hero 

## 定義隨機選擇的電影變量

- 創建了一個名為 randomSelectedMovie 的變量，用於存儲隨機選擇的電影信息。

## 調整 Header View 的作用域

- 將 Header View 的作用域從局部變量更改為類成員變量，以便在整個類中訪問。

## 實現 configureHeroHeaderView 函數

- 定義了一個函數 configureHeroHeaderView，用於從服務器獲取隨機電影信息並配置 Header View。

## 實現 configureWithModel 函數

- 在 HeroHeaderView 中實現了 configureWithModel 函數，用於根據傳入的 ViewModel 設置 Header View 的圖片。

## 添加隨機電影信息到 Header View

- 在 HomeViewController 中調用 configureHeroHeaderView 函數，將隨機選擇的電影信息配置到 Header View 中。

## 實現點擊事件處理

- 準備開始實現點擊事件處理，使得每個電影標題都可以被點擊。

## 補充

- 通過將隨機選擇的電影信息顯示在 Header View 中，增加了應用的動態性和吸引力。
- 下一步將實現點擊事件處理，以便用戶可以點擊任何電影標題。

# Handling Tapping across all 

## 實現在 UpcomingViewController 的點擊事件

- 在 UpcomingViewController 中實現了 tableView(_:didSelectRowAt:) 方法，以處理表格行的選擇事件。
- 獲取選擇的標題並調用 API 從服務器獲取相關信息。
- 選擇成功時，創建並配置 TitlePreviewViewController 並將其推送到導航堆疊中。

## 實現在 TopSearchViewController 的點擊事件

- 在 TopSearchViewController 中實現了 tableView(_:didSelectRowAt:) 方法，以處理表格行的選擇事件。
- 同樣地，獲取選擇的標題並調用 API 從服務器獲取相關信息。
- 選擇成功時，創建並配置 TitlePreviewViewController 並將其推送到導航堆疊中。

## 實現在 SearchResultsViewController 的點擊事件

- 在 SearchResultsViewController 中使用協議和委託設計來處理點擊事件。
- 定義了一個協議 SearchResultsViewControllerDelegate，並在其中定義了一個方法用於處理標題選擇事件。
- 實現了 collectionView(_:didSelectItemAt:) 方法，通過委託將點擊事件傳遞給委託對象。
- 委託對象處理事件並調用 API 從服務器獲取相關信息。
- 選擇成功時，創建並配置 TitlePreviewViewController 並將其推送到導航堆疊中。

## 下載標題

- 在 CollectionViewCell 中實現了 collectionContextMenuConfigurationForItemAt: 方法，以配置上下文菜單並處理下載事件。
- 定義了下載動作（Download Action），並在點擊時執行相應的操作。
- 點擊下載動作後，顯示下載中的消息。

## 補充

- 透過不同類型的 ViewControllers，實現了一致的點擊事件處理，提高了代碼的可維護性和可擴展性。
- 使用協議和委託設計，將點擊事件的處理邏輯解耦，使得代碼更清晰易懂。
- 在 CollectionViewCell 中添加了下載功能，為應用的功能增加了新的維度。

# Core Data (Best Practices)

## 使用 Core Data 加入現有專案
- 在已存在的專案中加入 Core Data，可以通過選擇「Use Core Data」來初始化 Core Data，並在 App Delegate 中配置相關的 Core Data Stack。
- 加入 Core Data 後，需要確保將 `import CoreData` 寫入文件頂部，並在 App Delegate 中導入相關的 Core Data 代碼。
- Core Data Stack 中的 `persistentContainer` 和 `saveContext` 函數負責管理持久容器和保存上下文，是 Core Data 操作的關鍵。

## 實作 Core Data 模型
- 在 Core Data 中，可以透過「New File」選擇 Core Data Data Model，並設定模型的屬性和數據類型。
- 在 Swift 中，可以使用 `NSManagedObject` 表示 Core Data 模型，並在模型中定義屬性和對應的數據類型。

## 使用 Data Persistence Manager
- 為了保持代碼整潔和結構清晰，可以創建 `DataPersistenceManager` 類，將與 Core Data 相關的操作封裝在其中。
- 使用單例模式管理 `DataPersistenceManager`，並定義相應的方法來進行數據操作，如下載數據、保存數據、從數據庫中刪除數據等。

## 下載和保存數據
- 在下載數據時，可以使用 `DataPersistenceManager` 中的 `downloadTitleWithModel` 方法，將從 API 獲取的數據保存到 Core Data 中。
- 使用 `NSManagedObjectContext` 來創建並保存 `NSManagedObject` 對象，並在保存時處理可能的錯誤。

## 從數據庫中讀取數據
- 使用 `DataPersistenceManager` 中的 `fetchLocalStorageForDownloads` 方法來從數據庫中讀取數據。
- 使用 `NSFetchRequest` 來創建查詢，並使用 `NSManagedObjectContext` 的 `fetch` 方法來執行查詢，獲取所需的數據。

## 刪除數據
- 使用 `DataPersistenceManager` 中的 `deleteTitleWithModel` 方法來從數據庫中刪除數據。
- 在刪除數據時，首先從數據模型中刪除相應的對象，然後保存上下文以提交更改，並處理可能的錯誤。

## 更新 UI
- 在數據操作完成後，需要更新 UI 來反映數據的變化，例如重新加載表格視圖或更新相應的 UI 元素。

# Using Notification Center to update ViewControllers

## 通知中心概述
- 通知中心是一個 Swift 內建的機制，用於在應用程序中的不同部分之間傳遞消息。
- 通知中心的概念類似於發送廣播，使得應用程序中的不同組件可以即時通信。

## 發送通知
- 在下載完成後，在 `CollectionTableViewCell` 中使用 `NotificationCenter` 發送一個名為 "downloaded" 的通知。
- 使用 `post` 方法將通知發送出去，通知中心將通知所有監聽了 "downloaded" 事件的對象。

## 接收通知
- 在下載視圖控制器 `DownloadViewController` 中使用 `NotificationCenter` 的 `addObserver` 方法來監聽 "downloaded" 事件。
- 當收到 "downloaded" 通知時，調用 `fetchLocalStorage` 方法來更新下載列表。

## 更新 UI
- 在 `fetchLocalStorage` 方法中，更新下載列表的內容以反映最新的下載狀態。
- 使用通知中心可以實現數據下載後即時更新 UI，提高了應用程序的響應性和用戶體驗。

## 總結
- 使用通知中心可以實現不同部分之間的消息傳遞，使應用程序更加靈活和交互性。
- 通知中心在處理數據更新時特別有用，可以幫助我們實現即時更新 UI 的功能。

## 重點補充
- 通知中心是一個重要的設計模式，在處理應用程序中不同部分之間的通信時非常有用。
- 使用通知中心可以減少組件之間的耦合度，提高代碼的可維護性和可擴展性。
- 在使用通知中心時，需要注意避免過多的通知，避免影響應用程序的性能和效率。

# 關鍵字

- **Swift 5**：蘋果公司開發的編程語言，主要用於iOS、macOS、watchOS和tvOS應用的開發。
- **Netflix克隆應用**：模仿Netflix應用功能和界面的項目，目的是學習和練習iOS開發技能。
- **列表（List）**：應用中展示項目集合的控件，例如電影列表或電視節目列表。
- **Tab Bar**：應用底部的導航欄，用於在不同的視圖控制器之間切換。
- **Navigation Bar**：應用頂部的導航欄，用於顯示當前視圖的標題和導航控制。
- **Table View**：用於顯示可滾動的列表視圖，每一行可以顯示自定義內容。
- **Collection View**：用於顯示可滾動的網格或自定義佈局的視圖集合。
- **播放（Play）和下載（Download）**：應用中的功能，允許用戶播放視頻或將其下載到本地。
- **長按（Long Press）**：用戶交互的一種手勢，通常觸發特定的功能或菜單。
- **動畫（Animation）**：應用中的動態效果，用於提升用戶體驗。
- **搜索功能（Search）**：允許用戶搜索特定內容的功能。
- **下載列表（Downloads List）**：顯示已下載內容的列表。
- **控制器視圖（Controller View）**：用於顯示特定內容或功能的視圖控制器，例如電影預告片的播放控制器。
- **簡介（Brief）**：顯示內容簡介或描述的部分。
- **Xcode項目（Xcode project）**：在Xcode開發環境中創建的應用程式專案，包含所有源代碼、資源和配置文件。
- **Storyboard**：在iOS開發中，一種圖形界面設計工具，用於創建應用程式的視圖層次結構和導航流。
- **Swift**：一種由蘋果開發的編程語言，用於iOS、macOS、watchOS和tvOS應用的開發。
- **Scene Delegate**：一種代表應用程序場景的類，通常用於配置應用程序的視窗和根視圖控制器。
- **UIWindow**：一個窗口對象，代表了應用程序的主視窗，用於顯示和管理視圖層次結構。
- **UIViewController**：一種控制器類型，負責管理應用程式的視圖。
- **Root View Controller**：應用程序的主要視圖控制器，通常是應用程序的第一個顯示的視圖。
- **Coordinate Space**：一種座標空間，用於定位和渲染視圖的相對位置。
- **Bounds**：視圖的邊界框，表示視圖的大小和位置相對於其父視圖的坐標系統。
- **UIStoryboard**：iOS開發中的一種文件類型，包含了應用程序的圖形界面設計信息和視圖控制器之間的連接。
- **Tab Bar**：應用程序底部的導航欄，用於在不同的視圖控制器之間切換。
- **UIViewController**：一種控制器類型，負責管理應用程式的視圖。
- **UITabBarController**：一種控制器，負責管理多個視圖控制器之間的切換，通常用於底部的選項卡導航。
- **UINavigationController**：一種控制器，用於在應用程式中管理視圖控制器堆疊，實現視圖的推入和彈出。
- **Cocoa Touch Class**：用於創建iOS應用的Objective-C或Swift類，通常繼承自UIKit中的類。
- **SF Symbols**：蘋果提供的一套圖標，開發者可以在應用中使用，並且可以根據需要進行自定義。
- **UIColor**：一種表示顏色的類，提供方法來生成常用顏色或自定義顏色。
- **systemYellow**：系統預定義的黃色顏色。
- **systemBackground**：系統預定義的背景顏色，根據系統外觀（例如，淺色模式或深色模式）自動調整。
- **UITableView**：一種視圖，用於顯示可滾動的列表，分為多行，每行可以包含自定義的內容。
- **UICollectionView**：一種視圖，用於顯示可滾動的網格或其他佈局的項目集合，支持橫向和縱向滾動。
- **Simulator**：iOS開發過程中用來測試應用的模擬器，可以模擬各種設備和系統版本。
- **Command + R**：Xcode中的快捷鍵，用於編譯並運行應用程式。
- **Build and Run**：編譯並運行應用的過程，檢查代碼是否正確並在模擬器或實際設備上運行應用。
- **Tab Bar Item**：選項卡欄中的單個項目，代表每個視圖控制器，可以設置圖標和標題。
- **Root View Controller**：導航控制器的根控制器，第一個顯示的視圖控制器。
- **Image System Name**：使用SF Symbols中的圖標名稱來生成UIImage。
- **UITableView**：一種視圖，用於顯示可滾動的列表，通常包含多個單元格（cells），每個單元格可以包含自定義的內容。
- **Closure Pattern**：在Swift中，閉包是一種代表功能或操作的對象，可以在需要時傳遞和調用。匿名閉包模式是一種常見的實現方式，通常用於設置UI元素或處理異步操作。
- **UITableViewCell**：一種表示UITableView中單個行的視圖，用於顯示自定義內容，例如文本、圖像等。
- **Identifier**：一個唯一標識符，用於識別可重用的UITableViewCell，通常用於註冊和從重用池中獲取單元格。
- **UITableViewDataSource**：一個協議，定義了提供UITableView所需數據的方法，包括行數、單元格設置等。
- **UITableViewDelegate**：一個協議，定義了處理UITableView事件的方法，包括選擇行、獲取單元格高度等。
- **HeaderView**：UITableView中的一個特殊部分，通常用於顯示每個部分的標題或其他信息。
- **CollectionView**：一種視圖，用於顯示可滾動的網格或自定義佈局的項目集合，通常用於顯示多個項目或圖像。
- **Frame**：視圖的大小和位置，通常用CGRect表示。
- **UIWindow**：應用程序的主窗口，用於顯示視圖層次結構和處理用戶交互。
- **Section**：UITableView中的一個部分，通常包含多個行，可以用來區分不同類型的數據或內容。
- **UICollectionView**：一種視圖，用於顯示可滾動的網格或自定義佈局的項目集合，類似於UITableView，但具有更靈活的佈局和呈現選項。
- **FlowLayout**：UICollectionView中的佈局類型，用於定義項目的排列方式，包括水平或垂直滾動等。
- **Delegate與DataSource**：UICollectionViewDelegate和UICollectionViewDataSource是協議，用於配置和管理UICollectionView的行為和數據。
- **Item Size**：UICollectionView中單個項目的大小，可以通過設置FlowLayout的itemSize屬性進行自定義。
- **Header View**：UICollectionView中的一個特殊部分，通常用於顯示每個部分的標題或其他信息，可以通過實現相應的方法來定義。
- **System Background Color**：UIView的默認背景顏色，可以通過將視圖的backgroundColor屬性設置為systemBackgroundColor來設置。
- **Frame**：視圖的大小和位置，通常用CGRect表示，包括原點和尺寸信息。
- **Content View**：UITableViewCell或UICollectionViewCell中的一個特殊視圖，用於包含其他子視圖，並確保它們在父視圖中合適地布局。
- **Hero View Controller**：一種在應用程序中用於顯示主要內容或概要信息的視圖控制器，通常用於突出顯示重要信息或功能。
- **UIView**：在iOS中的基本視圖類型，用於構建應用程序的用戶界面元素，它是所有視圖的基礎。
- **UIImageView**：用於顯示圖像的視圖類型，可以在界面上顯示圖片或圖形。
- **UIButton**：用戶可以點擊的可交互視圖元素，用於觸發操作或事件。
- **Clear Color**：透明顏色，可以通過將alpha值設置為0來使視圖或圖層變為完全透明。
- **Gradient Layer**：一種特殊的圖層類型，用於創建漸變效果，可以在視圖上疊加不同顏色的漸變，從而實現淡入淡出或平滑過渡的效果。
- **Layout Constraints**：用於定義視圖之間位置和大小關係的約束，可以通過自動布局系統來確保視圖在不同設備上保持一致的外觀和行為。
- **Leading Anchor / Trailing Anchor**：用於定義視圖相對於父視圖的左邊緣（對於LTR語言）或右邊緣（對於RTL語言）的錨點。
- **Corner Radius**：視圖或圖層的圓角半徑，用於使視圖的邊角變得圓滑。
- **System Background Color**：系統界面元素的背景顏色，可以通過使用系統提供的顏色來確保視圖與設備的外觀風格保持一致。
- **UIImage**：iOS中用於表示圖像的類型，可用於在應用程序中顯示圖片或圖形。
- **UIButton**：用戶可以點擊的可交互視圖元素，用於觸發操作或事件。
- **Navigation Bar**：位於應用程序頂部的UI元素，通常包含應用程序標題、返回按鈕和其他導航元素。
- **UIBarButtonItem**：用於將按鈕添加到導航條的類型，可以設置圖像或文字來表示按鈕。
- **Scroll View**：一種可滾動的視圖容器，用於顯示大量內容，通常用於實現可滾動的列表或內容視圖。
- **Content Offset**：UIScrollView中內容的偏移量，用於指定內容在視圖中的位置。
- **Transform**：視圖的變換屬性，用於對視圖進行縮放、旋轉或平移等變換。
- **Safe Area Insets**：指定安全區域內容的邊距，用於確保內容在不同設備和屏幕尺寸上的可見性和可操作性。
- **UIEdgeInsets**：表示矩形周圍的邊距，用於定義視圖或內容的邊界。
- **SF Symbols**：由蘋果提供的一套符號圖標庫，用於在應用程序中使用預設的符號圖標，可以通過名稱搜索和使用。
- **Minimum**：在指定一系列數值中取最小值的函數，用於確保導航條的最小變換狀態。
- **deprecate**：指的是在未來版本中可能被取消的一個特性或方法，意味著該特性或方法已被標記為不推薦使用。
- **UIFont**：表示字型的類型，用於指定文字的外觀，包括字型、大小和樣式等。
- **UITableViewHeaderFooterView**：用於顯示表格視圖（UITableView）中頭部或尾部的自定義視圖，可以包含標題、內容等。
- **guard let**：用於條件性地綁定一個可選值，如果可選值為nil，則退出當前作用域，避免後續代碼中使用nil值而引起錯誤。
- **CGRect**：表示矩形框架的類型，包括原點（origin）和尺寸（size）等信息，用於定位和渲染視圖的位置和大小。
- **UIColor**：表示顏色的類型，用於設置視圖元素的前景色、背景色等，可以使用預定義的顏色或自定義的RGBA值來表示顏色。
- **extension**：擴展類型的功能，可以向現有的類型添加新的方法、屬性或下標腳，用於使代碼結構更清晰、模組化和可重用。
- **network fetching**：網絡數據獲取，指的是從互聯網上獲取數據，通常用於從遠程服務器或API中獲取信息、圖片等。
- **API (應用程式介面)**：一組定義的規則和工具，用於不同應用程式之間的通信和數據交換。在這裡，指的是從 The Movie Database (TMDB) 網站獲取電影數據的接口。
- **URL**：統一資源定位符，用於標識互聯網上的資源位置。在這裡，指的是用於向 TMDB 網站發送請求的網址。
- **JSON (JavaScript Object Notation)**：一種輕量級的數據交換格式，易於人閱讀和編寫，也易於機器解析和生成。在這裡，指的是從 TMDB 獲取的數據以 JSON 格式返回。
- **模型 (Model)**：在軟體開發中，用於表示數據結構和相關邏輯的類或結構。在這裡，指的是用於解析和表示從 TMDB 獲取的電影數據的結構。
- **反序列化 (Deserialization)**：將序列化後的數據轉換為內存中的對象或結構的過程。在這裡，指的是將從 TMDB 獲取的 JSON 數據轉換為應用程序中的電影模型的過程。
- **異步回調函數 (Asynchronous Callback Function)**：一種用於處理異步操作完成後的回調函數，通常作為參數傳遞給異步函數，當操作完成時，函數將被調用。在這裡，指的是在從 TMDB 獲取數據時，使用的異步回調函數，以處理數據的返回。
- **枚舉 (Enum)**：一種用於定義具名常量集合的類型，可以用於表示一組相關的值。在這裡，指的是定義了可能的 API 請求失敗原因的枚舉類型，如無法獲取數據等。
- **擴展 (Extensions)**：在 Swift 中，擴展是一種機制，可以向現有的類、結構、枚舉或協議添加新功能，而無需修改其原始實現。在這裡，指的是對字符串類型進行擴展，以添加一個名為 `capitalizeFirstLetter` 的方法。
- **字串 (String)**：在程式設計中，字串是一系列字符的序列，通常用於表示文本數據。在這裡，指的是 Swift 中的字符串類型。
- **方法 (Method)**：在面向對象的程式設計中，方法是與對象關聯的函數，可以在對象上調用以執行特定的操作或任務。在這裡，指的是對字符串類型添加的一個方法，用於將字串的第一個字母轉換為大寫。
- **首字母大寫 (Capitalize First Letter)**：一個操作，用於將字串中的第一個字符轉換為大寫，並保持其他字符不變。在這裡，指的是將字串的首字母轉換為大寫的操作。
- **前綴 (Prefix)**：在字串操作中，前綴是指字串的開頭部分，可以通過指定其長度來提取前綴。在這裡，指的是使用 `prefix` 方法從字串中提取指定長度的前綴。
- **小寫 (Lowercase)**：一個操作，用於將字串中的所有字符轉換為小寫形式。在這裡，指的是將字串中的所有字符轉換為小寫。
- **丟棄 (Drop)**：在字串操作中，丟棄是指從字串中移除指定數量的字符或元素。在這裡，指的是使用 `drop` 方法從字串中移除第一個字符。
- **控制器 (Controller)**：在軟體開發中，控制器通常是指 MVC (Model-View-Controller) 架構中的一部分，負責處理用戶界面邏輯和協調應用程序的其他部分之間的交互。在這裡，指的是應用程序的主控制器，用於處理主界面的顯示和邏輯。
- **API (Application Programming Interface)**：應用程式介面，是一組定義了軟體之間如何互動的規範。在這裡，指的是從TMDB（The Movie Database）獲取電影和電視節目資料的API。
- **JSON (JavaScript Object Notation)**：JavaScript物件表示法，是一種輕量級的資料交換格式，常用於網路傳輸和資料存儲。在這裡，用於從API獲取的資料以JSON格式返回。
- **序列化 (Serialization)**：將物件轉換為可在網路上傳輸或存儲的格式，例如JSON或XML。在這裡，用於將從API獲取的JSON資料轉換為Swift中的物件。
- **非同步 (Asynchronous)**：在程式設計中，非同步操作是指程式可以在某個操作進行的同時執行其他操作，而不需等待該操作完成。在這裡，指的是從API獲取資料時，應用程式可以繼續執行其他操作而不受阻塞。
- **模型 (Model)**：在軟體開發中，模型是代表應用程式中的資料的結構，通常用於將資料從一個部分傳遞到另一個部分。在這裡，指的是用於表示從API獲取的資料的結構，如電影模型和電視節目模型。
- **擴展 (Extensions)**：在Swift中，擴展是一種機制，允許開發人員向現有的類型添加新的功能，而不需要修改其原始實現。在這裡，用於將字串類型擴展以添加自定義方法。
- **URL (Uniform Resource Locator)**：統一資源定位符，是一個指定了資源在網際網路上位置的字串。在這裡，用於構建用於從API發送請求的URL。
- **程式邏輯 (Application Logic)**：指應用程式中的代碼，用於控制應用程式的行為和操作。在這裡，指的是處理API回應並決定應用程式中下一步操作的代碼。
- **Top Rated**：在電影和電視節目中，Top Rated通常指評分最高的作品。在這裡，用於從API獲取評分最高的電影和電視節目資料。
- **Popular**：在電影和電視節目中，Popular通常指最受歡迎或觀眾喜愛的作品。在這裡，用於從API獲取最受歡迎的電影和電視節目資料。
- **錯誤處理 (Error Handling)**：在程式開發中，錯誤處理是一個重要的概念，用於處理可能出現的錯誤情況，以確保程式的穩定運行。在這裡，指的是將API呼叫中可能出現的錯誤通過自訂的API錯誤型別來捕獲和處理。
- **列舉 (Enumeration)**：在程式語言中，列舉是一種用於定義具有一組可能值的型別的方法。在這裡，用於定義API呼叫可能失敗的各種情況，如無法獲取資料。
- **完成處理器 (Completion Handler)**：在異步程式設計中，完成處理器是一個回調函數，用於在異步操作完成後執行相應的程式碼。在這裡，用於當API呼叫完成時通知調用者，並將結果傳遞給調用者處理。
- **集合視圖儲存格 (Collection View Cell)**：在iOS開發中，集合視圖儲存格是一種用於在集合視圖中顯示內容的可重複使用的視圖元件。在這裡，指的是用於顯示電影標題或海報等內容的自定義儲存格。
- **靜態選擇標識符 (Static Select Identifier)**：在iOS開發中，靜態選擇標識符是用於識別可重複使用的表格視圖或集合視圖儲存格的一種標識符。在這裡，用於確保每個集合視圖儲存格都有唯一的標識符。
- **圖像視圖 (Image View)**：在iOS開發中，圖像視圖是用於顯示圖像或圖片的視圖元件。在這裡，用於在集合視圖儲存格中顯示海報或圖片。
- **內容模式 (Content Mode)**：在iOS開發中，內容模式是用於指定視圖中的內容如何顯示或調整大小的屬性。在這裡，用於確保圖像在圖像視圖中填滿整個儲存格。
- **緩存 (Caching)**：在軟體開發中，緩存是一種技術，用於暫存先前檢索或處理過的資料，以便在稍後的時間快速存取。在這裡，指的是使用第三方庫來緩存從互聯網檢索的海報或圖片，以提高應用程式的性能和效率。
- **第三方庫 (Third-party Library)**：在軟體開發中，第三方庫是由外部開發人員或組織創建並提供的軟體元件，通常用於擴展或增強現有平台或框架的功能。在這裡，指的是使用Swift SDWebImage第三方庫來加載和顯示圖片。
- **完成處理器 (Completion Handler)**：在程式開發中，完成處理器是一個用於異步操作完成後執行相應程式碼的回調函式。在這裡，用於在從網路獲取圖片後通知視圖儲存格以更新其內容。
- **URL (Uniform Resource Locator)**：在網際網路中，URL是用於定位和標識資源的統一資源定位符。在這裡，用於指定從網路獲取圖片的位置。
- **對象存取模型 (Object-Relational Mapping, ORM)**：在軟體工程中，ORM是一種編程技術，用於將物件模型與關聯式資料庫之間的資料轉換。在這裡，指的是使用第三方庫來簡化從網路獲取圖片並將其設置到圖像視圖中的過程。
- **動態顯示器 (ActivityIndicator)**：在iOS開發中，動態顯示器是一個用於指示應用程式正在執行工作的視覺元件，通常用於在資料加載期間向用戶顯示進度。在這裡，用於在從API獲取數據時顯示進度指示。
- **協作處理器 (Completion Handler)**：在程式開發中，協作處理器是一個用於處理異步操作完成後執行的程式碼塊。在這裡，用於在從API獲取數據後更新UI元素。
- **網路請求 (Network Request)**：在軟體開發中，網路請求是應用程式向服務器或API發送的一種訊息，用於檢索或提交資料。在這裡，指的是應用程式向API發送請求以獲取電影數據。
- **錯誤處理 (Error Handling)**：在軟體開發中，錯誤處理是一個用於檢測、報告和處理應用程式中可能發生的錯誤的機制。在這裡，用於處理從API請求返回的錯誤，並向用戶顯示相應的錯誤信息。
- **主執行緒 (Main Thread)**：在iOS開發中，主執行緒是應用程式的主要執行緒，用於處理UI更新和事件處理。在這裡，用於確保在更新UI元素時處於正確的執行緒上下文中。
- **後台執行緒 (Background Thread)**：在iOS開發中，後台執行緒是應用程式中用於處理耗時任務或非UI相關工作的執行緒。在這裡，用於在後台執行緒中執行API請求，以防止阻塞主執行緒。
- **圖片路徑 (Image URL)**：用於在網絡中標識和訪問圖片的路徑或地址。在這裡，指的是從電影數據API獲取的圖片URL，用於顯示每個電影或電視節目的海報圖片。
- **數據API (Data API)**：一種提供數據訪問和檢索功能的應用程序編程接口（API），通常用於從遠程服務器或數據庫中檢索數據。在這裡，指的是電影數據API，用於獲取有關電影和電視節目的信息。
- **圖片加載 (Image Loading)**：將圖片從網絡或本地存儲加載到應用程序中以顯示給用戶的過程。在這裡，指的是從API獲取圖片URL並加載圖片以顯示每個電影或電視節目的海報。
- **完成處理器 (Completion Handler)**：一個程式碼塊，用於處理異步操作完成後執行的操作，例如從網絡請求中獲取數據後的處理。在這裡，用於在圖片加載完成後更新UI或執行其他相關操作。
- **大標題 (Large Title)**：在iOS中，大標題是一種在導航欄中顯示的標題風格，它比普通標題更大且更突出。在這裡，指的是將導航欄的標題設置為較大的標題風格。
- **表格視圖 (Table View)**：一種在iOS應用中用於顯示數據列表的視圖組件。在這裡，指的是用於顯示即將上映電影列表的表格視圖。
- **匿名閉包 (Anonymous Closure)**：在Swift中，匿名閉包是一種沒有名稱的閉包，通常用於定義簡單的、一次性的操作。在這裡，指的是使用匿名閉包來初始化表格視圖。
- **註冊細胞 (Register Cell)**：在使用表格視圖時，通過註冊細胞類型，告訴表格視圖如何創建和重用特定類型的表格細胞。在這裡，指的是將一個標準的UITableViewCell類型註冊到表格視圖中。
- **表格視圖數據源 (Table View Data Source)**：一個用於提供表格視圖所需數據的對象，實現了相應的方法，如指定表格中有多少行、每一行的內容等。在這裡，指的是用於提供即將上映電影列表數據的數據源對象。
- **表格視圖委託 (Table View Delegate)**：一個用於處理表格視圖事件的對象，實現了相應的方法，如處理用戶點擊行操作等。在這裡，指的是用於處理表格視圖的交互事件和行狀態的委託對象。
- **瀏覽器導航欄 (Navigation Bar)**：在iOS應用中，瀏覽器導航欄是一個位於應用頂部的條形視圖，通常包含應用標題、返回按鈕和其他導航控件。在這裡，指的是設置瀏覽器導航欄的樣式和顯示選項。
- **完成處理器 (Completion Handler)**：一個用於處理異步操作完成後執行的操作的程式碼塊，例如從網絡請求中獲取數據後的處理。在這裡，用於在獲取即將上映電影數據後更新UI或處理其他相關操作的完成處理器。
- **自定義單元格 (Custom Cell)**：在iOS應用中，自定義單元格是一種自定義設計的表格視圖單元格，通常用於以特定風格和布局顯示數據。在這裡，指的是為即將上映電影列表創建一個自定義單元格，以顯示電影海報、標題和播放按鈕。
- **海報 (Poster)**：在電影或影視作品中，海報是一種用於宣傳的圖像，通常包含了該作品的主要內容、角色和主題，用於吸引觀眾的注意。在這裡，指的是即將上映電影的海報圖像。
- **標題標籤 (Title Label)**：在iOS應用中，標題標籤是一種用於顯示文字標題的UI元素，通常用於顯示應用中各種內容的標題或標題。在這裡，指的是顯示即將上映電影標題的UI元素。
- **播放按鈕 (Play Button)**：在iOS應用中，播放按鈕是一種用於啟動音頻或視頻播放的控件，通常具有播放圖標或文本標籤，用於提示用戶點擊以開始播放媒體。在這裡，指的是用於啟動即將上映電影播放的按鈕。
- **約束 (Constraints)**：在iOS應用中，約束是用於定義UI元素位置和大小的規則，以確保它們在屏幕上正確布局和呈現。在這裡，指的是用於將海報、標題和播放按鈕放置在自定義單元格中的規則和條件。
- **自動佈局 (Auto Layout)**：在iOS開發中，自動佈局是一種機制，用於通過定義規則和約束來自動調整UI元素的位置和大小，以適應不同尺寸的螢幕和設備。在這裡，指的是使用自動佈局來確保自定義單元格中的元素在不同設備上都能正確顯示和排列。
- **視圖模型 (View Model)**：在軟體開發中，視圖模型是一種模式，用於將業務邏輯和數據操作與UI界面分離，以便更容易管理和測試應用程序的不同部分。在這裡，指的是將即將上映電影的相關數據封裝在一個視圖模型中，以便於在自定義單元格中使用。
- **自定義單元格 (Custom Cell)**：一個在iOS應用中自定義設計的表格視圖單元格，用於以特定風格和布局顯示數據。
- **海報 (Poster)**：在電影或影視作品中，用於宣傳的圖像，通常包含了該作品的主要內容、角色和主題，用於吸引觀眾的注意。
- **標題標籤 (Title Label)**：一種用於顯示文字標題的UI元素，通常用於顯示應用中各種內容的標題或標題。
- **播放按鈕 (Play Button)**：一種用於啟動音頻或視頻播放的控件，通常具有播放圖標或文本標籤，用於提示用戶點擊以開始播放媒體。
- **約束 (Constraints)**：用於定義UI元素位置和大小的規則，以確保它們在屏幕上正確布局和呈現。
- **自動佈局 (Auto Layout)**：一種機制，用於自動調整UI元素的位置和大小，以適應不同尺寸的螢幕和設備。
- **視圖模型 (View Model)**：一種模式，用於將業務邏輯和數據操作與UI界面分離，以便更容易管理和測試應用程序的不同部分。
- **搜索功能 (Search Functionality)**：允許用戶在應用程序中進行搜索的功能，通常用於查找特定內容或數據。
- **表格視圖 (Table View)**：一種iOS應用程序中常用的UI元素，用於以列表形式顯示數據，每個項目通常由一個單元格表示。
- **發現功能 (Discovery Functionality)**：允許用戶在應用程序中探索新的內容或資源的功能，通常用於向用戶展示他們可能感興趣的內容，而無需具體搜索。
- **API調用器 (API Caller)**：用於發送網絡請求並處理從服務器獲取的數據的組件或模塊，通常用於與外部API進行通信。
- **搜索結果視圖控制器(Search Results View Controller)**：負責顯示從數據庫服務器檢索的數據的視圖控制器，通常用於顯示用戶查詢後的搜索結果。
- **搜索欄(Search Bar)**：iOS應用程序中的UI元素，用於允許用戶輸入搜索內容的區域，通常位於屏幕頂部或導航欄中。
- **UI搜索控制器(UI Search Controller)**：用於管理搜索交互的UI元素，通常包括搜索欄以及顯示搜索結果的視圖控制器。
- **集合視圖(Collection View)**：一種iOS應用程序中的UI元素，用於以靈活的網格或列表形式顯示數據，每個項目可以是自定義的單元格。
- **搜索功能(Search)**：在應用程序中允許用戶通過輸入關鍵詞或條件來查找和檢索數據的功能，通常用於快速定位所需信息。
- **搜索欄(Search Bar)**：一種用於接受用戶輸入搜索關鍵詞或條件的UI元素，通常用於搜索功能的實現中。
- **URL編碼(URL Encoding)**：一種將URL中的特殊字符轉換為可安全傳輸的格式的過程，通常用於確保URL中的特殊字符不會干擾HTTP請求的傳輸。
- **API鍵(API Key)**：一種用於識別和授權應用程序訪問特定API的密鑰。在這個情境中，它是用於訪問YouTube API的密鑰。
- **啟用API服務(Enable API Service)**：在應用程序中開啟某項API服務，以便應用程序可以使用該服務的功能。在這個情境中，它是用於開啟YouTube API服務，以便應用程序可以使用YouTube數據API進行搜索。
- **YouTube API**: YouTube API是YouTube提供的一套應用程序編程接口，允許開發人員從YouTube平台上檢索、上傳和管理視頻、查詢用戶數據等。通過YouTube API，開發人員可以將YouTube的功能集成到自己的應用程序中，從而創建各種與YouTube相關的應用。
- **完成處理程序（Completion Handler）**：一種用於處理異步操作結果的機制。在這個情境中，完成處理程序被用於當從YouTube API獲取搜索結果後處理這些結果，例如解析、顯示或儲存數據。
- **JSON解碼器（JSON Decoder）**：一種用於解析JSON數據的工具，將JSON數據轉換為Swift對象的能力。在這個情境中，JSON解碼器被用於將從YouTube API獲取的JSON數據解析為Swift對象，以便應用程序可以使用和處理這些數據。
- **應用程序編程接口（API）**：一組定義了如何通信的規範，允許軟件應用程序之間進行交互。在這個情境中，YouTube API定義了一套規則，允許應用程序與YouTube平台進行通信，從而實現各種功能，如搜索、上傳、播放視頻等。
- **解選項（Deselect Item）**：在使用者選擇了一個項目後，將其解選以取消選擇的操作。在這個情境中，當使用者點擊某個影片標題後，將該項目從集合視圖中解選，以提供視覺上的反饋。
- **API調用（API Caller）**：在軟體開發中，對於應用程式編程接口（API）的呼叫通常由特定的模組或類別處理，這個模組或類別通常稱為API調用器。在這個情境中，API Caller負責從YouTube API獲取搜索結果或影片信息。
- **YouTube視頻ID（YouTube Video ID）**：YouTube視頻的唯一識別符號，用於標識和定位YouTube上的特定影片。透過YouTube API獲取的搜索結果中包含了YouTube視頻ID，可以通過這個ID查找和播放對應的YouTube影片。
- **錯誤處理（Error Handling）**：在軟體開發中，處理可能發生的錯誤或異常情況的機制，以確保應用程序能夠適當地處理錯誤並提供適當的反饋或恢復機制。在這個情境中，進行API調用時可能發生錯誤，因此進行了錯誤處理來處理這些情況並提供相應的錯誤訊息。
- **WebKit**: 是一個用於在應用程式中嵌入瀏覽器功能的框架，可以讓開發者輕鬆地在應用程式中顯示網頁內容或嵌入網頁視圖。
- **Auto Layout**: 是iOS開發中用於處理介面元素佈局的機制，通過定義視圖之間的相對關係以及佈局約束，使得介面可以在不同大小的螢幕上自動調整並呈現適當的版面。
- **UIWebView**: 是iOS開發中用於顯示網頁內容的視圖類別，它允許開發者在應用程式中嵌入網頁內容，但已被WKWebView所取代。
- **UILabel**: 是iOS開發中用於顯示文本內容的視圖類別，可以在應用程式中以各種樣式和格式顯示文字。
- **URL Request**: 是一個用於發送URL請求的物件，可以用於從網路上加載資源，如網頁、圖片或其他媒體內容。
- **自動尺寸調整（Autoresizing）**: 是iOS開發中用於處理視圖自動調整大小和位置的功能，可以根據父視圖的尺寸和佈局約束自動調整子視圖的尺寸和位置。
- **Clip to Bounds**: 是一個視圖屬性，用於控制視圖的子視圖是否應該被裁剪到其邊界內，通常用於處理子視圖超出父視圖範圍的情況。
- **WKWebView**: 是iOS開發中用於顯示網頁內容的視圖類別，是UIWebView的替代品，提供更好的性能和更多的功能選項，並支援最新的Web標準和技術。
- **SDWebImage**: 是一個流行的iOS庫，用於非同步加載圖像，可以從網路上加載圖像並將其顯示在UIImageView中，同時支援圖像緩存和處理。
- **weak self**: 在iOS開發中用於避免循環引用的一種慣用法，通常在使用閉包時，使用weak self來避免強引用，以免造成內存泄漏。
- **Core Data**: 一個Apple提供的框架，用於在iOS應用程式中管理應用程式的數據模型、持久化數據並進行數據存取操作的技術。
- **UIContextMenuConfiguration**: 用於定義上下文菜單的配置，包括菜單的標題、圖像、子菜單等相關屬性。
- **UIMenu**: 表示iOS應用程式中的一個菜單，用於顯示上下文菜單，可以包含多個UIAction作為菜單項目。
- **UIAction**: 定義菜單項目的類型，包括標題、圖像、子標題等屬性，以及與該菜單項目關聯的操作（handler）。
- **DispatchQueue**: 用於管理和調度任務執行的佇列，可以控制任務的執行順序、並發執行等相關操作。
- **Index path**: 在UITableView和UICollectionView中用於識別特定單元格或項目位置的類型，通常包含節(section)和行(row)等信息。
- **Optional**: 在Swift中表示一個值可以是有值也可以是nil的類型，用於處理可能為空的情況，通常用於安全地處理可能為空的數據。
- **Core Data**: 是一個由蘋果公司提供的框架，用於在iOS和macOS應用程序中管理對象圖和持久化數據存儲。它提供了一個對象關係映射（ORM）層，可以將應用程序中的數據模型映射到數據庫表格，並提供了強大的查詢和編輯功能。
- **NSFetchRequest**: 是Core Data中用於定義數據庫查詢的類別。它允許開發人員指定條件和排序規則，從Core Data數據庫中檢索所需的對象。
- **NSManagedObjectContext**: 是Core Data中用於管理對象圖的類別。它代表了應用程序的上下文環境，負責將對象從應用程序代碼映射到底層的數據庫，並處理對象的生命週期管理，包括創建、修改和刪除。
- **NSManagedObject**: 是Core Data中的基類，用於表示數據庫中的實體對象。開發人員可以通過子類化NSManagedObject來定義應用程序的數據模型，並通過NSManagedObjectContext將其映射到底層的數據庫表格中。
- **NSFetchedResultsController**: 是Core Data中的一個類別，用於在表格視圖或集合視圖中顯示數據庫查詢的結果。它與NSFetchedResultsControllerDelegate一起工作，以便在數據庫中的對象更改時更新視圖。
- **Notification Center（通知中心）**：在Swift中用於管理應用程序內的通知和監聽通知的機制。它允許應用程序的不同部分相互通信，例如當一個事件發生時，發送一個通知，並由其他部分聆聽這個事件，並作出反應。
- **Notification（通知）**：在Swift中是一種消息，它可以由`NotificationCenter`發送並被接收。通常用於在應用程序的不同部分之間傳遞信息，例如在數據下載完成後通知其他部分更新界面。
- **Observer（觀察者）**：在通知模式中，觀察者是指註冊了對特定通知感興趣的對象。當該通知被發送時，這些觀察者會收到通知並執行相應的操作。

