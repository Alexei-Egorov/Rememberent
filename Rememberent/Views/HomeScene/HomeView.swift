import SwiftUI
import SwiftData

struct HomeView: View {
    
    // MARK: - Properties
    
    private let viewModel: HomeViewModel
    
    // MARK: - Initialization
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - View
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                    .frame(height: 67)
                
                DateRingView()
                
                Spacer()
                    .frame(height: 24)
                
                LazyVStack(alignment: .leading, spacing: 12) {
                    ForEach(viewModel.workingDays, id: \.id) { workingDay in
                        WorkingDayView(viewModel: viewModel.workingDayViewModel(for: workingDay))
                    }
                }
                
                Spacer()
                
                Button("Add recurring activity") {
                    viewModel.addExampleRoutines()
                }
                .font(.sfProTextBold(size: 20))
                .tint(.white)
                .frame(width: geometry.size.width * 0.8, height: 50)
                .background(.appPrimary)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            }
            .padding(.horizontal, 16)
            // VStack
        }
        .onAppear(perform: {
            viewModel.start()
        })
        // GeometryReader
    }
    // body
}

#Preview {
    
    HomeView(
        viewModel: HomeViewModel(
            activityRepository: InMemoryActivityRepository(),
            routineRepository: InMemoryRoutineRepository()
        )
    )
    .modelContainer(PreviewData.previewContainer)
}
