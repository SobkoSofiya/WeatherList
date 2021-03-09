//
//  Main.swift
//  WeatherW
//
//  Created by Sofi on 09.03.2021.
//

import SwiftUI
struct MainModelAppend:View  {
    @StateObject var model = ViewModel()
    var body: some View{
        ZStack{
            Main(modelID: $model.modelThreeDaysID, model: $model.modelThreeDays)
        }.onAppear(perform: {
            model.getWeatherThreeDays()
        })
    }
}

struct Main: View {
//    @State var model = ViewModel()
    @Binding var modelID:[ModelThreeDaysID]
    @Binding var model:[ModelThreeDays]
    @State var show = false
    @State var showSecondDay = false
    @State var showThirdDay = false
    var body: some View {
       
        ZStack{
            ScrollView{
                VStack{
                  
                        Button(action: {
                            show.toggle()
                        }, label: {
                            VStack{
                                HStack{
                            Text("London")
                                    Text("Today")
                                }
                            if show{
                                ForEach(model, id:\.self){ i in
                                    if i.time.contains("2021-03-09"){
                                        VStack{
                                            Text(i.time).foregroundColor(.red)
                                            HStack{
                                                Text("Wind:")
                                                Text(i.wind)
                                            }
                                            HStack{
                                                Text("Hum:")
                                                Text(i.humidity)
                                            }
                                            HStack{
                                                Text("Temp:")
                                                Text(i.temp)
                                            }
                                            HStack{
                                                Text("Details:")
                                                Text(i.detailsWeather)
                                            }
                                        }
                                    }
                                }
                            }
                            }
                        })
                    Button(action: {
                        showSecondDay.toggle()
                    }, label: {
                        VStack{
                            HStack{
                        Text("London")
                                Text("Tomorrow")
                            }
                        if showSecondDay{
                            ForEach(model, id:\.self){ i in
                                if i.time.contains("2021-03-10"){
                                    VStack{
                                        Text(i.time).foregroundColor(.red)
                                        HStack{
                                            Text("Wind:")
                                            Text(i.wind)
                                        }
                                        HStack{
                                            Text("Hum:")
                                            Text(i.humidity)
                                        }
                                        HStack{
                                            Text("Temp:")
                                            Text(i.temp)
                                        }
                                        HStack{
                                            Text("Details:")
                                            Text(i.detailsWeather)
                                        }
                                    }
                                }
                            }
                        }
                        }
                    })
                    Button(action: {
                        showThirdDay.toggle()
                    }, label: {
                        VStack{
                            HStack{
                        Text("London")
                                Text("11.03")
                            }
                        if showThirdDay{
                            ForEach(model, id:\.self){ i in
                                if i.time.contains("2021-03-11"){
                                    VStack{
                                        Text(i.time).foregroundColor(.red)
                                        HStack{
                                            Text("Wind:")
                                            Text(i.wind)
                                        }
                                        HStack{
                                            Text("Hum:")
                                            Text(i.humidity)
                                        }
                                        HStack{
                                            Text("Temp:")
                                            Text(i.temp)
                                        }
                                        HStack{
                                            Text("Details:")
                                            Text(i.detailsWeather)
                                        }
                                    }
                                }
                            }
                        }
                        }
                    })


                    
                }
//
            }
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        MainModelAppend()
    }
}
