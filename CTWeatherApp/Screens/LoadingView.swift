//
//  LoadingView.swift
//  CTWeatherApp
//
//  Created by Lukas Korinek on 18.08.2025.
//


import SwiftUI

// MARK: - LoadingView

public struct LoadingView<Content: View>: View {

    private let content: Content
    private let isLoading: Bool
    
    
    // MARK: - Body

    public var body: some View {
        ZStack {
            content

            if isLoading {
                ProgressView()
                    .controlSize(.large)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.white.opacity(0.5))
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }


    // MARK: - Init

    public init(
        isLoading: Bool,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content()
        self.isLoading = isLoading
    }
}


// MARK: - Convenience modifier for all views

extension View {

    public func loading(
        _ isLoading: Bool
    ) -> some View {
        LoadingView(
            isLoading: isLoading
        ) {
            self
        }
    }
}


// MARK: - Preview

#Preview {
    LoadingView(isLoading: true) {}
}
