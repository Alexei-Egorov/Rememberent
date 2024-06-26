import SwiftUI

struct DateRingView: View {
    
    // MARK: - Properties
    
    let viewModel = DateRingViewModel()
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 23)
                .frame(width: 160, height: 160)
                .foregroundStyle(.appPrimary)
                .shadow(color: .appPrimary, radius: 10, x: 0, y: 0)
            Circle()
                .fill(.white)
                .frame(width: 137, height: 137)
            VStack(spacing: -6) {
                Text("\(viewModel.day)")
                    .font(.sfProTextBold(size: 50))
                Text("\(viewModel.month)")
                    .font(.sfProTextBold(size: 20))
            }
        }
    }
}

#Preview {
    DateRingView()
}
