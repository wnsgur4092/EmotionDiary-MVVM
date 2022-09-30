//
//  DiaryMoodInputView.swift
//  EmotionDiary-MVVM
//
//  Created by JunHyuk Lim on 30/9/2022.
//

import SwiftUI

struct DiaryMoodInputView: View {
    //MARK: - PROPERTIES
    @ObservedObject var vm : DiaryInputViewModel
    
    
    
    let moods : [Mood] = Mood.allCases
    
    //MARK: - BODY
    var body: some View {
        
        VStack{
            
            Spacer()
            
            HStack{
                ForEach(moods, id: \.self) { mood in
                    Button {
                        vm.mood = mood
                    } label: {
                        VStack {
                            Image(systemName:  mood.imageName)
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 80)
                                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 0)
                                .padding()
                            
                            Text("\(mood.name)")
                                .foregroundColor(.gray)
                        } //: VSTACK
                        .frame(height: 180)
                        .background(mood == vm.mood ? Color.gray.opacity(0.4) : Color.clear)
                        .cornerRadius(10)
                    } //: BUTTON
                    
                } //: LOOP
            } //: HSTACK
            .padding()
            
            Spacer()
            
            NavigationLink {
                DiaryTextInputView(vm: vm)
            } label: {
                Text("Next")
                    .frame(width: 200, height: 80)
                    .background(Color.pink)
                    .foregroundColor(.white)
                    .cornerRadius(40)
            }
        } //: VSTACK
        
        
        
    }
}

//MARK: - PREVIEW
struct DiaryMoodInputView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryMoodInputView(vm: DiaryInputViewModel(isPresented: .constant(false), diaries: .constant(MoodDiary.list)))
    }
}
