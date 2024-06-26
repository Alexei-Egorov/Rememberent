import SwiftUI
import SwiftData

struct WorkingDayView: View {
    
    // MARK: - Properties
    
    private let viewModel: WorkingDayViewModel
    
    // MARK: - Initialization
    
    init(viewModel: WorkingDayViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - View
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.dayString)
                .font(.sfProTextBold(size: 20))
            
            VStack {
                ForEach(viewModel.workingDay.activities) { activity in
                    ActivityView(viewModel: viewModel.getActivityViewModel(for: activity))
                        .onTapGesture {
                            viewModel.toggleActivity(activity)
                        }
                }
            }
            // VStack
        }
        // VStack
    }
}

#Preview {
    WorkingDayView(viewModel: WorkingDayViewModel(workingDay: WorkingDay.stub))
        .modelContainer(PreviewData.previewContainer)
}
