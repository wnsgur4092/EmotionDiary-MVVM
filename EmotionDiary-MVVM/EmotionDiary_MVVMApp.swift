//
//  EmotionDiary_MVVMApp.swift
//  EmotionDiary-MVVM
//
//  Created by JunHyuk Lim on 27/9/2022.
//

import SwiftUI

@main
struct EmotionDiary_MVVMApp: App {
    var body: some Scene {
        WindowGroup {
            let vm = DiaryListViewModel(storage: MoodDiaryStorage())
            DiaryListView(vm: vm )
        }
    }
}
