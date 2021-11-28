//
//  MainView.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 26/11/21.
//

import SwiftUI

struct PageController: View {
    @EnvironmentObject var treinoViewModel: MainViewModel
    @State private var selection = 0
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.systemGray5
        UITabBar.appearance().unselectedItemTintColor = UIColor.black
    }
    
    var body: some View {
        NavigationView {
            TabView (selection: $selection){
                MainView()
                    .tabItem {
                        Image(systemName: "list.bullet.rectangle")
                        Text("Treinos")
                    }.tag(0)
                
                Text("Entre em sua Conta")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Conta")
                    }.tag(2)
            }.accentColor(.red)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        PageController()
            .environmentObject(MainViewModel())
            .environmentObject(ExerciseImagesViewModel())
            .environmentObject(ExerciseViewModel())
            .environmentObject(TrainingListViewModel())
    }
}
