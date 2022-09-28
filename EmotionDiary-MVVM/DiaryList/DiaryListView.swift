//
//  DiaryListView.swift
//  EmotionDiary-MVVM
//
//  Created by JunHyuk Lim on 28/9/2022.
//

import SwiftUI

struct DiaryListView: View {
    //MARK: - PROPERTIES
    
    
    
    @StateObject var vm : DiaryListViewModel
    
    let layout : [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    //MARK: - BODY
    var body: some View {
        LazyVGrid(columns: layout) {

            ForEach(vm.keys, id: \.self) { key in
                Section {
                    let items = vm.dic[key] ?? []
                    let ordredItems = items.sorted(by: { $0.date < $1.date})
                    ForEach(ordredItems) { item in
                        MoodDiaryCell(diary: item)
                            .frame(height: 50)
                    }
                } header: {
                    Text(key)
                }

            } //: LOOP
        } //: VGRID
    }
}

struct DiaryListView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryListView(vm: DiaryListViewModel())
    }
}
