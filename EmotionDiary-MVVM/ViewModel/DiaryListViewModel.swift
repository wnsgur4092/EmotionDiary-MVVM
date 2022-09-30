//
//  DiaryListViewModel.swift
//  EmotionDiary-MVVM
//
//  Created by JunHyuk Lim on 28/9/2022.
//

import Foundation

final class DiaryListViewModel : ObservableObject {
    
//    let storage : 
    
    @Published var list : [MoodDiary] = MoodDiary.list
    @Published var dic : [String : [MoodDiary]] = [:]
    
    init() {
        self.dic = Dictionary(grouping: self.list, by: { $0.monthlyIdentifier})
    }
    
    var keys : [String] {
        return dic.keys.sorted{ $0 < $1}
    }
}
