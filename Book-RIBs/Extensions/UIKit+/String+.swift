//
//  String+.swift
//  Book-RIBs
//
//  Created by jhkim on 2023/04/17.
//

import Foundation

extension String {
    
    /// 멀티랭귀지를 사용하기 위한 optional 언어 번들 설정
    private static var LangBundle: Bundle?
    
    
    /// 멀티랭기지 사용을 위한 함수.
    /// ```
    /// "hi" = "Hi";
    /// "hi".localized() // "Hi"
    /// "hello" = "Hello%@%@";
    /// "hello".localized("?", "!") // "Hello?!"
    /// ```
    ///
    /// - parameter arguments: CVaArg이 들어감으로 %@에 들어가야할 항목이 앞에서부터 채워진다.
    /// - returns: String.LangBundle에 적용된 해당 언어로 현지화된 String
    /// - waring: 해당되는 키가 없을 경우, 넣은 키 자체가 return 됨
    func localized(_ arguments: CVarArg...) -> String {
        if let langBundle = String.LangBundle {
            let str = NSLocalizedString(self, tableName: "Localizable", bundle: langBundle ,comment: "")
            return String(format: str, arguments: arguments)
        } else {
            if let localeID = Locale.preferredLanguages.first,
               let deviceLocale = (Locale(identifier: localeID).languageCode) {
                
                var resourceName: String?
                
                switch deviceLocale { // 사용언어 설정
                case "ko":
                    resourceName = deviceLocale
                default: // 추가 언어가 적용되지 않아 default en 처리
                    resourceName = "en"
                }
                
                if let resourceName = resourceName,
                   let path = Bundle.main.path(forResource: resourceName, ofType: "lproj") {
                    String.LangBundle = Bundle(path: path)
                }
            }
        }
        
        let str = NSLocalizedString(self, tableName: "Localizable", bundle: String.LangBundle!, comment: "")
        return String(format: str, arguments: arguments)
    }
    
}
