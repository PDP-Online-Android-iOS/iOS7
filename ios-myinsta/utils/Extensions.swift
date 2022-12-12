//
//  Extensions.swift
//  ios-myinsta
//
//  Created by Ogabek Matyakubov on 08/12/22.
//

import Foundation
import SwiftUI

struct NavigationBackButton: ViewModifier {

    @Environment(\.presentationMode) var presentationMode
    var color: UIColor
    var text: String?

    func body(content: Content) -> some View {
        return content
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading: Button(action: {  presentationMode.wrappedValue.dismiss() }, label: {
                    HStack(spacing: 2) {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(Color(color))

                        if let text = text {
                            Text(text)
                                .foregroundColor(Color(color))
                        }
                    }
                })
            )
    }
}

extension View {
    func navigationBackButton(color: UIColor, text: String? = nil) -> some View {
        modifier(NavigationBackButton(color: color, text: text))
    }
}

extension UIScreen {
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    static let size = UIScreen.main.bounds.size
}

extension String {
    
    func isValidPassword() -> Bool {
        var hasNumber = false
        var hasUpperCase = false
        var hasLowerCase = false
        var hasCharacter = false
        
        for i in self {
            if i.isNumber && !hasNumber {
                hasNumber = true
                continue
            }
            if i.isUppercase && !hasUpperCase {
                hasUpperCase = true
                continue
            }
            if i.isLowercase && !hasLowerCase {
                hasLowerCase = true
                continue
            }
            
            let first: ClosedRange<UInt8> = (33...47)
            let second: ClosedRange<UInt8> = (58...64)
            let third: ClosedRange<UInt8> = (91...96)
            let forth: ClosedRange<UInt8> = (123...127)
            
            let isChar = first.contains(i.asciiValue!) || second.contains(i.asciiValue!) || third.contains(i.asciiValue!) || forth.contains(i.asciiValue!)
            
            if isChar && !hasCharacter {
                hasCharacter = true
                continue
            }
        }
        
        return hasNumber && hasUpperCase && hasLowerCase && hasCharacter
    }
    
    func isValidEmail() -> Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
            let range = NSRange(location: 0, length: self.count)
            let matches = detector.matches(in: self, options: .anchored, range: range)
            guard matches.count == 1 else { return false }
            return matches[0].url?.scheme == "mailto"
        } catch {
            return false
        }
    }
}
