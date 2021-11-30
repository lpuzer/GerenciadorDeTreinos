//
//  AddTraining.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 27/11/21.
//

import SwiftUI


struct AddMainTraining: View {
    @EnvironmentObject var mainViewModel:MainViewModel
    @Environment(\.dismiss) var dismiss
    
    init(){
        UITableView.appearance().backgroundColor = .systemOrange
    }
    
    var body: some View {
        ZStack {
            Form {
                VStack (alignment: .leading, spacing: 5){
                    Section{
                        Text("Nome do Treino")
                            .padding(.top)
                        TextField("ex: treino para ganhar massa muscular", text: $mainViewModel.trainingName)
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
                    Section{
                        Text("Descrição do Treino")
                        TextEditor(text: $mainViewModel.trainingDescription)
                            .padding(.horizontal)
                            .frame(width: 270, height: 100)
                            .cornerRadius(20)
                            .foregroundColor(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    }.font(.caption)
                    Spacer()
                    Section{
                        HStack{
                            Spacer()
                            Button(action: {
                                let card = MainModel(id: "100", name: mainViewModel.trainingName, description: mainViewModel.trainingDescription, suggestedTraining: false)
                                mainViewModel.addTraining(card)
                                dismiss()
                            }) {
                                Text("Salvar")
                                    .fontWeight(.semibold)
                                    .font(.title3)
                                    .frame(width: 120, height: 50)
                                    .cornerRadius(30)
                                    .foregroundColor(.black)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.orange, lineWidth: 2)
                                    )
                            }
                            Spacer()
                            Button(action: {
                                dismiss()
                            }) {
                                Text("Cancelar")
                                    .fontWeight(.semibold)
                                    .font(.title3)
                                    .frame(width: 120, height: 50)
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
                }.frame(height: 320)
            }.frame(width: 300, height: 400)
                .cornerRadius(30)
                .padding()
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
            .environmentObject(MainViewModel())
            .previewLayout(.sizeThatFits)
    }
}
