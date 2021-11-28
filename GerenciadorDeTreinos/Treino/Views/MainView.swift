//
//  ContentView.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 24/11/21.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @EnvironmentObject var trainingListViewModel: TrainingListViewModel
    @State var selectedTraining:MainModel?
    @State var showActionSheet: Bool = false
    @State var showSheetForm:Bool = false
    var actionSheet: ActionSheet {
        ActionSheet(title: Text("Action Sheet"), message: Text("Choose Option"), buttons: [
            .default(Text("Save")),
            .default(Text("Delete")),
            .destructive(Text("Cancel"))
        ])
    }
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Button(action:  {
                        showSheetForm.toggle()
                    } ) {
                        TopBarMenu()
                    }.sheet(isPresented: $showSheetForm) {
                        AddTraining()
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        NavigationLink(destination: TrainingListView()) {
                            TrainingCellView(showActionSheet: showActionSheet)
                        }
                    }
                    
                    Spacer()
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background {
                    Color("mainBackground")
                        .ignoresSafeArea()
                }
                .navigationBarHidden(true)
        }
    }
}



struct Home_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(MainViewModel())
            .environmentObject(TrainingListViewModel())
        
    }
}


