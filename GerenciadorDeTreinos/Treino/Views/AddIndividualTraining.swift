//
//  AddIndividualTraining.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 28/11/21.
//

import SwiftUI


struct AddIndividualTraining: View {
    
    
    @EnvironmentObject var mainViewModel:MainViewModel
    @EnvironmentObject var weekTrainingViewModel: WeekTrainingViewModel
    @State var trainingDayName:String = ""
    @Environment(\.dismiss) var dismiss
    @State var x:[String] = []
    @State var showAlert:Bool = false
    
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
                        TextField("ex: treino para ganhar massa muscular", text: $trainingDayName)
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
                    Spacer()
                    Section{
                        VStack (alignment: .center, spacing: 5){
                            Text("Escolha os dias da semana para esse treino")
                                .font(.caption)
                                .foregroundColor(Color.black)
                            List{
                                HStack (alignment: .top, spacing: 15) {
                                    ForEach(0..<weekTrainingViewModel.daysOfWeek.count){ index in
                                        VStack  {
                                            Button(action: {
                                                weekTrainingViewModel.daysOfWeek[index].isSelected = weekTrainingViewModel.daysOfWeek[index].isSelected ? false : true
                                                   
                                                if weekTrainingViewModel.daysOfWeek[index].isSelected {
                                                    x.append(weekTrainingViewModel.filteredDayArray[index])
                                                }
                                            }) {
                                                VStack (alignment: .center, spacing: 2){
                                                    if weekTrainingViewModel.daysOfWeek[index].isSelected {
                                                        Image(systemName: "checkmark.square")
                                                            .foregroundColor(.green)
                                                    } else {
                                                        Image(systemName: "square")
                                                            .foregroundColor(.primary)
                                                    }
                                                    Text(weekTrainingViewModel.daysOfWeek[index].day)
                                                        .font(.caption)
                                                        .foregroundColor(Color.black)  
                                                }
                                               
                                            }.buttonStyle(BorderlessButtonStyle())
                                        }
                                    }
                                }
                               
                            }.frame(width: 270, height: 50, alignment: .center)
                        }
                            
                    }.font(.caption)
                    Spacer()
                    Section{
                        HStack{
                            Spacer()
                            Button(action: {
                                let cardsDay = WeekTraining(
                                        dayOfWeek: x,
                                        trainingName:
                                        trainingDayName, isTrainingCompleted: false)
                                        self.weekTrainingViewModel.addDayTraining(cardsDay)
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

struct AddIndividualTraining_Previews: PreviewProvider {
    static var previews: some View {
        AddIndividualTraining()
            .environmentObject(MainViewModel())
            .environmentObject(WeekTrainingViewModel())
    }
}
