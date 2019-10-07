//
//  DialogWireframe.swift
//  EnjoyTask
//
//  Created by yamada.ryo on 2019/10/07.
//  Copyright © 2019 yamadaryo. All rights reserved.
//

import UIKit

class DialogWireframe {
    /// ネットワークエラーダイアログを生成する
    static func createNetworkErrorDialog() -> UIAlertController {
        let alert = UIAlertController(title: "エラー", message: "通信環境の良いところでもう一度お試しください。", preferredStyle: UIAlertController.Style.alert)
        let defaultAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(defaultAction)
        return alert
    }

    /// 認証情報（メールアドレス、パスワード）が空であるエラーダイアログを生成する
    static func createEmptyAuthInfoErrorDialog() -> UIAlertController {
        let alert = UIAlertController(title: "エラー", message: "メールアドレスとパスワードを正しく入力してください。", preferredStyle: UIAlertController.Style.alert)
        let defaultAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(defaultAction)
        return alert
    }

    /// ログインに失敗したエラーダイアログを生成する
    static func createLoginErrorDialog() -> UIAlertController {
        let alert = UIAlertController(title: "エラー", message: "ログインに失敗しました。メールアドレスとパスワードを見直して、もう一度お試しください。", preferredStyle: UIAlertController.Style.alert)
        let defaultAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(defaultAction)
        return alert
    }
}
