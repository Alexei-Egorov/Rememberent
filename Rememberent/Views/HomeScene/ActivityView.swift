import SwiftUI
import SwiftData

struct ActivityView: View {
    
    // MARK: - Properties
    
    private let viewModel: ActivityViewModel
    
    // MARK: - Initialization
    
    init(viewModel: ActivityViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - View
    
    var body: some View {
        HStack(spacing: 4) {
            
            // Circle
            if viewModel.isFinished {
                Circle()
                    .fill(.appPrimary)
                    .frame(width: 20, height: 20)
            } else {
                Circle()
                    .stroke(.appPrimary, lineWidth: 2)
                    .frame(width: 20, height: 20)
            }
            
            // Text
            Text(viewModel.title)
                .font(.sfProTextRegular(size: 17))
            
            Spacer()
        }
        // VStack
    }
    // body
}

#Preview {
    ActivityView(viewModel: ActivityViewModel(activity: Activity.stub))
        .modelContainer(PreviewData.previewContainer)
}
