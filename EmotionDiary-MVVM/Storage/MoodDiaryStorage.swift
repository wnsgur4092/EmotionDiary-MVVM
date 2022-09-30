//
//  MoodDiaryStorage.swift
//  EmotionDiary-MVVM
//
//  Created by JunHyuk Lim on 30/9/2022.
//

import Foundation

final class MoodDiaryStorage {
    
    func persist(_ items : [MoodDiary]) {
        Storage.store(items, to: .documents, as: "diary_list.json")
    }
    
}
