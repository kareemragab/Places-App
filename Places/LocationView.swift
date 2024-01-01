//
//  LocationView.swift
//  Places
//
//  Created by Kareem Ragab Hassan on 27/11/2023.
//

import SwiftUI
import MapKit

struct LocationView: View {
    //property
    @EnvironmentObject var vm : locationViewModel

    //body
    var body: some View {
        ZStack{
            Map(coordinateRegion: $vm.CoordinateRegion,
                annotationItems: vm.locations ,
                annotationContent: { location in
                MapAnnotation(coordinate: location.coordinates) {
                    mapPinItem()
                        .scaleEffect( vm.CurrentMApLocation.id == location.id ? 1.1 : 0.7)
                        .onTapGesture {
                            withAnimation(.linear) {
                                vm.CurrentMApLocation = location
                            }
                        }
                }
            }
            )
            .edgesIgnoringSafeArea(.all)
            VStack(spacing:0){

                headerListItem

                Spacer()

                ForEach(vm.locations){ location in

                    if vm.CurrentMApLocation.id == location.id {
                        CurrentLocationInfoView(location: vm.CurrentMApLocation)
                    .padding()
                    .cornerRadius(12)

                    }
                }
                    }
                }
        .sheet(item: $vm.SheetLocation, onDismiss: nil) { location1 in
            LocationDetailView(location: location1)

        }
            }

        }

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
            .environmentObject(locationViewModel())
    }
}


extension LocationView {

    var headerListItem : some View {
        VStack {
            VStack {
                Text(vm.CurrentMApLocation.name+" , "+vm.CurrentMApLocation.cityName)
                    .font(.system(size: 30, weight: .semibold, design: .serif))
                    .padding(.bottom)


            }.padding(.top,20)
                .frame(width: UIScreen.main.bounds.width/1.1, height: 70, alignment: .center)
                .background(.ultraThickMaterial)
                .cornerRadius(20)
                .overlay(Button(action: {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        vm.updateListState()
                    }


                }, label: {
                    Image(systemName: "arrow.down")
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .foregroundColor(.black)
                        .rotationEffect(Angle(degrees: vm.isListDisplayed ? 180 : 0 ))

                        .padding(.leading)
            }),alignment: .leading)


            if vm.isListDisplayed{
                List{
                    ForEach(vm.locations){ Location in
                        LIstRowView(loaction: Location)
                            .padding(3)
                    }

                }.listStyle(PlainListStyle())
                    .padding(.horizontal,20)
            }
        }
    }

}
