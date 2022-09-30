//
//  DiaryDateInputView.swift
//  EmotionDiary-MVVM
//
//  Created by JunHyuk Lim on 30/9/2022.
//

import SwiftUI

struct DiaryDateInputView: View {
    //MARK: - PROPERTIES
    
    @StateObject var vm : DiaryInputViewModel
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                DatePicker("Start Date", selection: $vm.date, displayedComponents: [.date])
                    .datePickerStyle(.graphical)
                
                Spacer()
                
                NavigationLink {
                    DiaryMoodInputView(vm: vm)
                } label: {
                    Text("NEXT")
                        .frame(width: 200, height: 80)
                        .background(Color.pink)
                        .foregroundColor(.white)
                         .cornerRadius(40)
                }
            } //: VSTACK
        } //: NAVIGATION VIEW
        
        
        
        
    }
    
}


//MARK: - PREVIEW
struct DiaryDateInputView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = DiaryInputViewModel(isPresented: .constant(false), diaries: .constant(MoodDiary.list))
        DiaryDateInputView(vm: vm)
    }
}
