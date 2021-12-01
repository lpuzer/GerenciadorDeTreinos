//
//  CelulaDeTreinoPrincipal.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 27/11/21.
//

import SwiftUI


struct TrainingCellView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @State var selectedTraining:MainModel?
 
    
    var body: some View {
        HStack {
            ForEach (mainViewModel.mainModel) { task in
                VStack {
                    ZStack(alignment: .leading) {
                        Image(task.suggestedTraining ? "imageTreinoJoelho": "imageTreinoBackground")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(20)
                            .frame(width: 300, height: 200)
                        Text(task.name)
                            .font(.title2)
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .offset(x: 0, y: 20)
                            .padding()
                        Image(systemName: "list.bullet.circle")
                            .foregroundColor(Color.gray)
                            .offset(x: 270, y: -40)
                            .onTapGesture {
                                self.mainViewModel.showActionSheet.toggle()
                                self.selectedTraining = task
                            }
                            .actionSheet(isPresented: $mainViewModel.showActionSheet) {
                                ActionSheet(title: Text("Selecione a opção que deseja"), message: nil, buttons: [
                                    .default(Text("Abrir"),
                                             action: {
                                                 
                                             }),
                                    .default(Text("Editar"),
                                             action: {
                                                 
                                             }
                                            ),
                                    .destructive(Text("Excluir"),
                                                 action: {
                                                     
                                                     if let selectedTraining = self.selectedTraining {
                                                         if selectedTraining.suggestedTraining == false {
                                                         self.delete(treinoModels: selectedTraining)
                                                     }
                                                     else{
                                                         print("The training can not be excluded")
                                                     }
                                                     }
                                                 }),
                                    .cancel()
                                ])
                                
                            }
                    }.frame(width: 300, height: 200)
                }.frame(width: 300, height: 200)
                
            }.onDelete { (indexSet) in
                self.mainViewModel.mainModel.remove(atOffsets: indexSet)
            }
        
        }.background(Color("mainBackground"))
    }

    
    func delete(treinoModels: MainModel) {
        mainViewModel.removeTraining(treinoModels)
        }


 
}



struct MainTrainingCell_Previews: PreviewProvider {
    static var previews: some View {
        TrainingCellView()
            .previewLayout(.sizeThatFits)
            .environmentObject(MainViewModel())
    }
}


