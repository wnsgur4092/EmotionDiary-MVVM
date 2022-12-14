//
//  DiaryDetailsView.swift
//  EmotionDiary-MVVM
//
//  Created by JunHyuk Lim on 29/9/2022.
//

import SwiftUI

struct DiaryDetailsView: View {
    //MARK: - PROPERTIES
    
    @StateObject var vm : DiaryDetailsViewModel
//    var diary : MoodDiary
    
    //MARK: - BODY
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 50) {
                    Text(formattedDate(dateString: vm.diary.date))
                        .font(.system(size: 30, weight: .bold))
                    Image(systemName: vm.diary.mood.imageName)
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 0)
                        .frame(height: 80)
                    Text(vm.diary.text)
                        .font(.system(size: 20, weight: .medium))
                } //: VSTACK
                .frame(maxWidth: .infinity)
            } //: SCROLLVIEW
            
            HStack{
                Button {
                    print("Delete Button Tapped")
                    vm.delete()
                } label: {
                    Image(systemName: "trash")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20)
                }
                .padding()
                
                Spacer()
            } //: HSTACK
        } //: VSTACK

    }
}

//MARK: - EXTENSION

extension DiaryDetailsView {
    private func formattedDate(dateString : String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        
        let date = formatter.date(from: dateString)
        
        formatter.dateFormat = "EEE, MMM d, yyyy"
        return formatter.string(from: date!)
    }
}

//MARK: - PREVIEW
struct DiaryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = DiaryDetailsViewModel(diaries: .constant(MoodDiary.list), diary: MoodDiary.list[0])
        DiaryDetailsView(vm: vm)
    }
}
