//
//  ContentView.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 24/11/21.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @EnvironmentObject var weekTrainingViewModel: WeekTrainingViewModel
    
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
                        mainViewModel.showSheetMainForm.toggle()
                    } ) {
                        TopBarMenu(buttonBarWidth: 30.0, buttonBarHeight: 30.0, buttonBarColor: .blue)
                    }.sheet(isPresented: $mainViewModel.showSheetMainForm) {
                        AddMainTraining()
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        NavigationLink(destination: TrainingListView()) {
                            TrainingCellView()
                            
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
            .environmentObject(WeekTrainingViewModel())
    }
}


