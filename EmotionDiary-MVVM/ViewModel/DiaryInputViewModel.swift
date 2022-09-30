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
    
    @Published var date : Date = Date()
    @Published var isPresented : Binding<Bool>
    
    var subscriptions = Set<AnyCancellable>()
    
    init(isPresented: Binding<Bool>) {
        self.isPresented = isPresented
        
        $date.sink { date in
            print(">>> Selected : \(date)")
        }.store(in: &subscriptions)
        
    }
}
