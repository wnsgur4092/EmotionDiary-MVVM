//
//  DiaryTextInputView.swift
//  EmotionDiary-MVVM
//
//  Created by JunHyuk Lim on 30/9/2022.
//

import SwiftUI

struct DiaryTextInputView: View {
    //MARK: - PROPERTIES
    @ObservedObject var vm : DiaryInputViewModel
    @FocusState var focused : Bool
    //MARK: - BODY
    var body: some View {
        VStack {
            TextEditor(text: $vm.text)
                .focused($focused)
                .border(.gray.opacity(0.2), width: 2)
            
            Button {
                vm.completed()
            } label: {
                Text("Done")
                    .frame(width: 200, height: 80)
                    .background(Color.pink)
                    .foregroundColor(.white)
                    .cornerRadius(40)
            } //: BUTTON

        } //: VSTACK
        .padding()
        .onAppear {
            focused = true
        }
    }
}

//MARK: - PREVIEW
struct DiaryTextInputView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryTextInputView(vm: DiaryInputViewModel(isPresented: .constant(false)))
    }
}
