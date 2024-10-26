//
//  SCIDUserHelper.swift
//  ScribbleLab
//
//  Copyright (c) 2024 ScribbleLabApp LLC. - All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//  1. Redistributions of source code must retain the above copyright notice, this
//     list of conditions and the following disclaimer.
//
//  2. Redistributions in binary form must reproduce the above copyright notice,
//     this list of conditions and the following disclaimer in the documentation
//     and/or other materials provided with the distribution.
//
//  3. Neither the name of the copyright holder nor the names of its
//     contributors may be used to endorse or promote products derived from
//     this software without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
//  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
//  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
//  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
//  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
//  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
//  OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
//  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

import Foundation
import ScribbleFoundation

internal class SCIDUserHelper {
    
    /// Calculates the age based on the birth date.
    ///
    /// - Parameter birthDate: The birth date of the user.
    /// - Returns: The age of the user in years, or `nil` if the birth date is not valid.
    static func calculateAge(birthDate: Date?) -> Int? {
        guard let birthDate = birthDate else { return nil }
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: birthDate, to: Date())
        
        return components.year
    }
    
    /// Calculates the remaining duration until the trial period ends.
    ///
    /// - Parameter trialEndDate: The end date of the trial period.
    /// - Returns: A string representing the remaining duration (e.g., "2 days", "1 month"), or
    ///            `nil` if the trial end date is not valid.
    static func trialDurationUntilEnd(trialEndDate: Date?) -> String? {
        guard let trialEndDate = trialEndDate else { return nil }
        
        let calendar = Calendar.current
        let currentDate = Date()
        
        if trialEndDate < currentDate {
            return "Trial period has ended"
        }
        
        let components = calendar.dateComponents(
            [.day, .hour, .minute],
            from: currentDate,
            to: trialEndDate
        )
        
        var durationStr = ""
        
        if let days = components.day, days > 0 {
            durationStr += "\(days) day\(days > 1 ? "s" : "")"
        }
        
        if let hours = components.hour, hours > 0 {
            durationStr += (durationStr.isEmpty ? "" : ", ") + "\(hours) hour\(hours > 1 ? "s" : "")"
        }
        
        if let minutes = components.minute, minutes > 0 {
            durationStr += (durationStr.isEmpty ? "" : ", ") + "\(minutes) minute\(minutes > 1 ? "s" : "")"
        }
        
        return durationStr.isEmpty ? "Trial Period ends soon" : durationStr
    }
}
