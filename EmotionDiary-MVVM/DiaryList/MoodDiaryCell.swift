//
//  MoodDiaryCell.swift
//  EmotionDiary-MVVM
//
//  Created by JunHyuk Lim on 28/9/2022.
//

import SwiftUI

struct MoodDiaryCell: View {
    //MARK: - PROPERTEIS
    var diary : MoodDiary
    
    //MARK: - BODY
    var body: some View {
        Image(systemName: diary.mood.imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 0   )
    }
}

//MARK: - PREVIEW
struct MoodDiaryCell_Previews: PreviewProvider {
    static var previews: some View {
        MoodDiaryCell(diary: MoodDiary.list[0])
    }
}
