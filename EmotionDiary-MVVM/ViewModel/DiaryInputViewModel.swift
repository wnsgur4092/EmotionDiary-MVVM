//
//  DiaryInputViewModel.swift
//  EmotionDiary-MVVM
//
//  Created by JunHyuk Lim on 30/9/2022.
//

import Foundation
import SwiftUI
import Combine

final class DiaryInputViewModel : ObservableObject {
    
    @Published var diaries : Binding<[MoodDiary]>
    @Published var diary : MoodDiary = MoodDiary(date: "", text: "", mood: .great)
    
    @Published var date : Date = Date()
    @Published var text : String = ""
    @Published var mood : Mood = .great
    @Published var isPresented : Binding<Bool>
    
    
    var subscriptions = Set<AnyCancellable>()
    
    init(isPresented: Binding<Bool>, diaries : Binding<[MoodDiary]>) {
        self.isPresented = isPresented
        self.diaries = diaries
        
        $date.sink { date in
            print(">>> Selected date : \(date)")
            self.update(date: date)
        }.store(in: &subscriptions)
        
        $mood.sink { mood in
            print(">>> Selected mood : \(mood)")
            self.update(mood: mood)
        }.store(in: &subscriptions)
        
        $text.sink { text in
            self.update(text : text)
        }.store(in: &subscriptions)
    }
    
    private func update(date: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        
        self.diary.date = formatter.string(from: date)
    }
    
    private func update(mood : Mood) {
        self.diary.mood = mood
    }
    
    private func update(text: String) {
        self.diary.text = text
    }
    
    func completed() {
        guard diary.date.isEmpty == false else { return }
        diaries.wrappedValue.append(diary)
        isPresented.wrappedValue = false
    }
}
