#  iOS13のSceneDelegateについて

## AppDelegate.swift
```
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
```
省略


```
func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
// Called when a new scene session is being created.
// Use this method to select a configuration to create the new scene with.
return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
}
```
アプリのInfo.plistファイルにシーン構成データを含めない場合、またはシーン構成データを動的に変更する場合は、このメソッドを実装します。 UIKitは、新しいシーンを作成する直前にこのメソッドを呼び出します。実装では、作成するシーンのタイプ、シーンの管理に使用するデリゲートオブジェクト、表示する初期ビューコントローラーを含むストーリーボードなど、シーンの詳細を含むUISceneConfigurationオブジェクトを返します。
このメソッドを実装しない場合は、アプリのInfo.plistファイルでシーン構成データを提供する必要があります。

```
func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
// Called when the user discards a scene session.
// If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
// Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}
```
アプリケーションが実行されていない間にセッションが破棄された場合、application：didFinishLaunchingWithOptionsの直後に呼び出されます。


## SceneDelegate.swift
### UIResponder
T.B.D.

### UIWindowSceneDelegate 
```
UIWindowSceneDelegateオブジェクトを使用して、アプリのユーザーインターフェイスの1つのインスタンスのライフサイクルを管理します。ウィンドウシーンデリゲートはUISceneDelegateプロパティに準拠しており、そのシーンをアプリに接続したとき、フォアグラウンドに入ったときなどに通知を受信するために使用します。また、シーンの基礎となる環境の変化に対応するためにも使用します。たとえば、ユーザーがシーンのサイズを変更する場合、デリゲートを使用してコンテンツに必要な変更を加え、新しいサイズに対応します。
UIWindowSceneDelegateオブジェクトを直接作成しないでください。代わりに、シーンの構成データの一部としてデリゲートクラスの名前を指定します。この情報は、アプリのInfo.plistファイル、またはアプリのデリゲートのapplication（_：configurationForConnecting：options :)メソッドから返すUISceneConfigurationオブジェクトで指定できます。シーンの構成方法の詳細については、アプリがサポートするシーンの指定を参照してください。
```

### メソッド
```
func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
// Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
// If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
// This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
guard let windowScene = (scene as? UIWindowScene) else { return }
}
```

```
func sceneDidDisconnect(_ scene: UIScene) {
// Called as the scene is being released by the system.
// This occurs shortly after the scene enters the background, or when its session is discarded.
// Release any resources associated with this scene that can be re-created the next time the scene connects.
// The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
}
```

```
func sceneDidBecomeActive(_ scene: UIScene) {
// Called when the scene has moved from an inactive state to an active state.
// Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}
```

```
func sceneWillResignActive(_ scene: UIScene) {
// Called when the scene will move from an active state to an inactive state.
// This may occur due to temporary interruptions (ex. an incoming phone call).
}
```

```
func sceneWillEnterForeground(_ scene: UIScene) {
// Called as the scene transitions from the background to the foreground.
// Use this method to undo the changes made on entering the background.
}
```

```
func sceneDidEnterBackground(_ scene: UIScene) {
// Called as the scene transitions from the foreground to the background.
// Use this method to save data, release shared resources, and store enough scene-specific state information
// to restore the scene back to its current state.
}
```

## わかったこと
### 起動ログ
2019-10-17 23:16:26.239460+0900 EnjoyTask[5600:135136]  - <AppMeasurement>[I-ACS036002] Analytics screen reporting is enabled. Call +[FIRAnalytics setScreenName:setScreenClass:] to set the screen name or override the default screen class name. To disable screen reporting, set the flag FirebaseScreenReportingEnabled to NO (boolean) in the Info.plist
AppDelegate:didFinishLaunchingWithOptions
SceneDelegate:willConnectTo
SceneDelegate:sceneWillEnterForeground
SceneDelegate:sceneDidBecomeActive
2019-10-17 23:16:28.074117+0900 EnjoyTask[5600:135137] 6.8.1 - [Firebase/Analytics][I-ACS023007] Analytics v.60101000 started
2019-10-17 23:16:28.093105+0900 EnjoyTask[5600:135137] 6.8.1 - [Firebase/Analytics][I-ACS023008] To enable debug logging set the following application argument: -FIRAnalyticsDebugEnabled (see http://goo.gl/RfcP7r)
2019-10-17 23:16:44.986384+0900 EnjoyTask[5600:135330] 6.8.1 - [Firebase/Analytics][I-ACS023130] Configuration not found. Using default configuration
SceneDelegate:sceneWillResignActive
-- backgroundへ --
SceneDelegate:sceneDidEnterBackground
2019-10-17 23:17:03.189044+0900 EnjoyTask[5600:134966] Can't end BackgroundTask: no background task exists with identifier 9 (0x9), or it may have already been ended. Break in UIApplicationEndBackgroundTaskError() to debug.
-- foregroundへ --
SceneDelegate:sceneWillEnterForeground
SceneDelegate:sceneDidBecomeActive

## クラスの説明
### UIScene
- 概要 
アプリのユーザーインターフェイスの1つのインスタンスを表すオブジェクト。

- 詳細
UIKitは、ユーザーまたはアプリが要求するアプリのUIのインスタンスごとにシーンオブジェクトを作成します。通常、UIKitはUISceneオブジェクトではなくUIWindowSceneオブジェクトを作成しますが、このクラスのメソッドとプロパティを使用してシーンに関する情報にアクセスします。
すべてのシーンオブジェクトには、UISceneDelegateプロトコルを採用するオブジェクトであるデリゲートオブジェクトが関連付けられています。シーンの状態が変化すると、シーンオブジェクトはデリゲートオブジェクトに通知し、登録されたオブザーバーオブジェクトに適切な通知を送信します。デリゲートオブジェクトと通知を使用して、シーンの状態の変化に対応します。たとえば、シーンを背景に移動するタイミングを決定するために使用します。
シーンオブジェクトを直接作成しないでください。 UIApplicationのrequestSceneSessionActivation（_：userActivity：options：errorHandler :)メソッドを呼び出すことにより、プログラムでUIKitにアプリのシーンオブジェクトを作成するように依頼できます。 UIKitは、ユーザーの操作に応じてシーンも作成します。アプリのシーンサポートを構成するときは、UISceneオブジェクトの代わりにUIWindowSceneオブジェクトを指定します。

### UIWindowScene
- 概要
アプリの1つ以上のウィンドウを管理する特定の種類のシーン

- 詳細
UIWindowSceneオブジェクトは、そのシーンから表示する1つまたは複数のウィンドウを含む、アプリのUIの1つのインスタンスを管理します。シーンオブジェクトは、ユーザーのデバイスでのウィンドウの表示と、ユーザーが操作するシーンのライフサイクルを管理します。シーンの状態が変化すると、シーンオブジェクトはデリゲートオブジェクトに通知します。これは、UIWindowSceneDelegateプロトコルを採用するオブジェクトです。シーンはまた、登録されたオブザーバーに適切な通知を投稿します。これらのオブジェクトを使用して、変更に対応します。
ウィンドウシーンオブジェクトを直接作成しないでください。代わりに、アプリのInfo.plistファイルのシーン構成の詳細にシーンのクラス名を含めることにより、構成時にUIWindowSceneオブジェクトが必要であることを指定します。アプリデリゲートのapplication（_：configurationForConnecting：options :)メソッドでUISceneConfigurationオブジェクトを作成するときに、そのクラス名を指定することもできます。ユーザーがアプリを操作すると、システムは提供された構成データに基づいて適切なシーンオブジェクトを作成します。プログラムでシーンを作成するには、UIApplicationのrequestSceneSessionActivation（_：userActivity：options：errorHandler :)メソッドを呼び出します。

## わかったけどいまいち分類できてないもの
- UIApplicationのrequestSceneSessionActivation（_：userActivity：options：errorHandler :)
    - あたらしいWindow（シーン？）を作るもよう。こちらを参照。iPadのみか？
    - https://engineering.q42.nl/ipados-multi-window/
    
## わからないから調べること    
### UIWindow
- 概要
アプリのユーザーインターフェースの背景と、イベントをビューにディスパッチするオブジェクト。

- 詳細

Windowsは、View Controllerと連携してイベントを処理し、アプリの操作に不可欠な他の多くのタスクを実行します。 UIKitはほとんどのウィンドウ関連の対話を処理し、必要に応じて他のオブジェクトと連携して多くのアプリの動作を実装します。
次の操作を行う必要がある場合にのみ、ウィンドウを使用します。
アプリのコンテンツを表示するメインウィンドウを提供します。
（必要に応じて）追加のウィンドウを作成して、追加のコンテンツを表示します。
通常、Xcodeはアプリのメインウィンドウを提供します。新しいiOSプロジェクトでは、ストーリーボードを使用してアプリのビューを定義します。ストーリーボードでは、アプリのデリゲートオブジェクトにXcodeテンプレートが自動的に提供するウィンドウプロパティが必要です。アプリでストーリーボードを使用しない場合は、このウィンドウを自分で作成する必要があります。
ほとんどのアプリに必要なウィンドウは1つだけで、デバイスのメイン画面にアプリのコンテンツが表示されます。デバイスのメイン画面に追加のウィンドウを作成できますが、接続画面でのコンテンツの表示で説明されているように、外部ウィンドウにコンテンツを表示するために一般に追加のウィンドウが使用されます。
UIWindowオブジェクトは、他のいくつかのタスクにも使用します。
ウィンドウのz軸レベルを設定します。これは、他のウィンドウに対するウィンドウの可視性に影響します。
ウィンドウを表示し、それらをキーボードイベントのターゲットにします。
ウィンドウの座標系との間で座標値を変換します。
ウィンドウのルートビューコントローラーの変更。
ウィンドウが表示される画面の変更。
Windowsには、独自の外観はありません。代わりに、ウィンドウは1つ以上のビューをホストします。これらのビューは、ウィンドウのルートビューコントローラーによって管理されます。ストーリーボードでルートView Controllerを構成し、インターフェイスに適切なビューを追加します。
UIWindowをサブクラス化する必要はほとんどありません。ウィンドウに実装する動作の種類は、通常、より簡単に上位レベルのView Controllerに実装できます。サブクラス化が必要な場合の1つは、becomeKey（）またはresignKey（）メソッドをオーバーライドして、ウィンドウのキーステータスが変更されたときにカスタム動作を実装することです。特定の画面にウィンドウを表示する方法については、UIScreenを参照してください。
