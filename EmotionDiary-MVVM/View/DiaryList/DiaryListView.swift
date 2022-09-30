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
    @State var isPresenting : Bool = false
    
    let layout : [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            VStack{
                ScrollView(.vertical, showsIndicators: true) {
                    LazyVGrid(columns: layout) {
                        ForEach(vm.keys, id: \.self) { key in
                            Section {
                                let items = vm.dic[key] ?? []
                                let ordredItems = items.sorted(by: { $0.date < $1.date})
                                ForEach(ordredItems) { item in
                                    NavigationLink {
                                        DiaryDetailsView(diary: item)
                                    } label: {
                                        MoodDiaryCell(diary: item)
                                            .frame(height: 50)
                                    } //: LINK
                                } //: LOOP
                            } header: {
                                Text(formattedSectionTitle(key))
                                    .font(.system(size: 30, weight: .black))
                            } //: SECTION
                            .frame(height: 60)
                            .padding()
                        } //: LOOP
                    }//: VGRID
                }//: SCROLLVIEW
                HStack{
                    Button {
                        print("New Item Button Tapped")
                        isPresenting = true
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                    } //: BUTTON
                    .frame(width: 80, height: 80)
                    .foregroundColor(.white)
                    .background(.pink)
                    .cornerRadius(40)
                } //: HSTACK
                
            }
            .navigationTitle("Emotion Diary")
        }//: NAVIGATION
        .sheet(isPresented: $isPresenting) {
            let vm = DiaryInputViewModel(isPresented: $isPresenting)
            DiaryDateInputView(vm: vm)
        }

    }
}

//MARK: - EXTENSION

extension DiaryListView {
    private func formattedSectionTitle(_ id: String) -> String {
        let dateComponents = id
            .components(separatedBy: " - ")
            .compactMap{ Int($0) }
        guard let year = dateComponents.first, let month = dateComponents.last else {
            return id
        }
        
        let calendar = Calendar(identifier: .gregorian)
        let dateComponent = DateComponents(calendar: calendar, year: year, month: month)
        let date = dateComponent.date!
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: date)
    }
}

//MARK: - PREVIEW
struct DiaryListView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryListView(vm: DiaryListViewModel())
    }
}
