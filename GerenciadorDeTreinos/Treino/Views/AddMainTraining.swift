//
//  AddTraining.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 27/11/21.
//

import SwiftUI


struct AddMainTraining: View {
    @EnvironmentObject var mainViewModel:MainViewModel
    @Environment(\.presentationMode) var presentationMode
    
    init(){
        UITableView.appearance().backgroundColor = .systemOrange
    }
    
    var body: some View {
        ZStack {
            Form {
                VStack (alignment: .leading, spacing: 10){
                    Section{
                        Text("Nome do Treino")
                            .padding(.top)
                        TextField("ex: treino para ganhar massa muscular", text: $mainViewModel.initialMainTraining.name)
                            .padding(.horizontal)
                            .frame(width: 270, height: 40)
                            .cornerRadius(20)
                            .foregroundColor(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .padding(.bottom, 20)
                    }.font(.caption)
                    .frame(width: 300)
                
                        .background(Color.white)
                    Section{
                        Text("Descrição do Treino")
                        TextEditor(text: $mainViewModel.initialMainTraining.description)
                            .padding(.horizontal)
                            .frame(width: 270, height: 100)
                            .cornerRadius(20)
                            .foregroundColor(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    }.font(.caption)
                    .frame(width: 300)
                    .background(Color.white)
                    Spacer()
                    Section{
                        HStack{
                            Spacer()
                            Button(action: {
                                if mainViewModel.initialMainTraining.name != "" {
                                        if (mainViewModel.initialMainTraining.editable == true) {
                                            let card = MainModel(id: mainViewModel.initialMainTraining.id,
                                                                 name: mainViewModel.initialMainTraining.name,
                                                                 description: mainViewModel.initialMainTraining.description,
                                                                 suggestedTraining: false,
                                                                 userId: mainViewModel.initialMainTraining.userId,
                                                                 editable: mainViewModel.initialMainTraining.editable
                                                                 
                                            )
                                            mainViewModel.updateTraining(card)
                                        }
                                        else {
                                            let card = MainModel(name: mainViewModel.initialMainTraining.name,
                                                                 description: mainViewModel.initialMainTraining.description,
                                                                 suggestedTraining: false,
                                                                 userId: mainViewModel.initialMainTraining.userId,
                                                                 editable: mainViewModel.initialMainTraining.editable
                                            )
                                            mainViewModel.addTraining(card)
                                        }
                                    self.mainViewModel.initialMainTraining.name = ""
                                    self.mainViewModel.initialMainTraining.description = ""
                                    self.mainViewModel.initialMainTraining.editable = false
                            }
                                presentationMode.wrappedValue.dismiss()
                            }) {
                                Text("Salvar")
                                    .fontWeight(.semibold)
                                    .font(.title3)
                                    .frame(width: 100, height: 50)
                                    .cornerRadius(30)
                                    .foregroundColor(.black)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.orange, lineWidth: 2)
                                    )
                            }
                            Spacer()
                            Spacer()
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }) {
                                Text("Cancelar")
                                    .fontWeight(.semibold)
                                    .font(.title3)
                                    .frame(width: 100, height: 50)
                                    .cornerRadius(30)
                                    .foregroundColor(.black)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.orange, lineWidth: 2)
                                    )
                            }
                            Spacer()
                        }.padding(.bottom, 10)
                    }.font(.caption)
                    .frame(width: 300)
                    .background(Color.white)
                }.frame(maxWidth: 300, maxHeight: 400)
                    .background(Color.white)
                    .offset(x: -16, y: 0)
            }.frame(width: 300, height: 400)
                .cornerRadius(30)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Color("mainBackground")
                    .ignoresSafeArea()
            }
    }
}

struct AddMainTraining_Previews: PreviewProvider {
    static var previews: some View {
        AddMainTraining()
            .preferredColorScheme(.dark)
            .environmentObject(MainViewModel())
            .previewLayout(.sizeThatFits)
    }
}
