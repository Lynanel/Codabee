//
//  Extensions Type.swift
//  Codabee
//
//  Created by TRAORE Lionel on 8/15/19.
//  Copyright © 2019 TRAORE Lionel. All rights reserved.
//

import Foundation

extension String {
    
    func getDate() -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = DATE_FORMAT
        formatter.locale = Locale(identifier: LOCALE)
        
        return formatter.date(from: self) ?? Date()
    }
    
    func ilYA() -> String {
        let date = getDate()
        let calendar = Calendar.current
        let components = Calendar.dateComponents([.day, .month, .hour, .minute, .second], from: date, to: Date())
        let month = components.month ?? 0
        let day = components.day ?? 0
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        let seconde = components.second ?? 0
        
        var base = "Il y a "
        
        if month > 0 {
            base = base + String(month) + " jour"
            if month > 1 {
                return base += "s"
            }
            return base
        }
        
        if day > 0 {
            base = base + String(day) + " jour"
            if day > 1 {
                return base += "s"
            }
            return base
        }
        
        if hour > 0 {
            base = base + String(hour) + " heure"
            if hour > 1 {
                return base += "s"
            }
            return base
        }
        
        
        if minute > 0 {
            base = base + String(minute) + " minute"
            if minute > 1 {
                return base += "s"
            }
            return base
        }
        
        if seconde > 0 {
            i = 0
            repeat {
                i += 1
                return base += String(seconde) + " secondes"
            } while (i < 60)
        }
        return " à l'instant !!!"
    }
}
