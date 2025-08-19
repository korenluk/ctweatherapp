//
//  HorizontalCalendar.swift
//  CTWeatherApp
//
//  Created by David Pařízek on 22.07.2025.
//

import SwiftUI


struct HorizontalCalendarView: View {
    @State var selectedIndex = 0
    var dates: [DateVO] = []
    var onIndexChanged: ((Int) -> Void)
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(Array(dates.enumerated()), id: \.0) { index, date in
                    dateItem(index: index, date: date)
                        .padding(.horizontal, 4)
                        .padding(.leading, index == 0 ? 12 : 0)
                        .padding(.trailing, index == dates.count - 1 ? 12 : 0)
                }
            }
        }
    }
    
    func dateItem(index: Int, date: DateVO) -> some View {
        VStack(spacing: 0) {
            Text(date.weekday)
                .font(.subheadline)
                .foregroundStyle(.gray)
                .padding(.top, 8)
                .padding(.leading, 8)
                .padding(.trailing, 8)
            
            Text(date.day)
                .animatableSystemFont(size: selectedIndex == index ? 30 : 20)
                .foregroundStyle(.blue)
                .padding(.leading, 8)
                .padding(.trailing, 8)
                .padding(.bottom, 8)
        }
        .frame(minWidth: 50, minHeight: 50)
        .overlay {
            RoundedRectangle(cornerRadius: 5)
                .strokeBorder(Color.blue.opacity(0.5), lineWidth: 2)
        }
        .onTapGesture {
            withAnimation() {
                selectedIndex = index
            }
            onIndexChanged(index)
        }
    }
}

#Preview {
    HorizontalCalendarView(
        dates: [
            DateVO(day: "1", weekday: "Mon"),
            DateVO(day: "2", weekday: "Tue"),
            DateVO(day: "3", weekday: "Wed"),
            DateVO(day: "4", weekday: "Thu"),
            DateVO(day: "5", weekday: "Fri"),
            DateVO(day: "6", weekday: "Sat"),
            DateVO(day: "7", weekday: "Sun")
        ],
        onIndexChanged: { _ in }
    )
}
