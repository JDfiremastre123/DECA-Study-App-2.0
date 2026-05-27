//
//  ExamSelectionView.swift
//  DECA Study App
//

import SwiftUI

struct ExamSelectionView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedCluster: ExamCluster? = nil
    @State private var navigateToMenu = false
    var onClusterSelected: (ExamCluster) -> Void
    var body: some View {
            ZStack {
                Color(.systemBackground).ignoresSafeArea()

                VStack(spacing: 0) {
                    // Header
                    ZStack {
                        Color.blue.ignoresSafeArea(edges: .top)
                        VStack(spacing: 4) {
                            Text("Choose Your Exam")
                                .font(.title2).fontWeight(.bold)
                                .foregroundColor(.white)
                            Text("Select the cluster you are preparing for")
                                .font(.subheadline)
                                .foregroundColor(.white.opacity(0.85))
                        }
                        .padding(.vertical, 20)
                    }
                    .frame(height: 90)

                    // Cluster list
                    ScrollView {
                        VStack(spacing: 14) {
                            ForEach(ExamCluster.allCases) { cluster in
                                ClusterRow(
                                    cluster: cluster,
                                    isSelected: selectedCluster == cluster
                                ) {
                                    if cluster.isAvailable {
                                        selectedCluster = cluster
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                        .padding(.bottom, 30)
                    }

                    // Continue button
                    Button(action: {
                        if let cluster = selectedCluster {
                            onClusterSelected(cluster)
                            dismiss()
                        }
                    }) {
                        Text("Continue")
                            .font(.title3).fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 60)
                            .background(selectedCluster != nil ? Color.blue : Color.gray.opacity(0.4))
                            .cornerRadius(16)
                    }
                    .disabled(selectedCluster == nil)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 30)
                }
            }
            .navigationBarHidden(true)
            .navigationDestination(isPresented: $navigateToMenu) {
                if let cluster = selectedCluster {
                    // TODO: Call the fn passed into this view to tell the parent VC what was chosen
                    MenuPageView(cluster: cluster)
                }
            }
    }
}

// MARK: - Cluster Row
struct ClusterRow: View {
    let cluster: ExamCluster
    let isSelected: Bool
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 16) {
                // Icon
                ZStack {
                    Circle()
                        .fill(cluster.isAvailable
                              ? (isSelected ? Color.blue : Color.blue.opacity(0.12))
                              : Color.gray.opacity(0.15))
                        .frame(width: 46, height: 46)
                    Image(systemName: cluster.iconName)
                        .font(.system(size: 20))
                        .foregroundColor(cluster.isAvailable
                                         ? (isSelected ? .white : .blue)
                                         : .gray)
                }

                VStack(alignment: .leading, spacing: 2) {
                    Text(cluster.rawValue)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(cluster.isAvailable ? .primary : .gray)
                    if !cluster.isAvailable {
                        Text("Coming Soon")
                            .font(.caption)
                            .foregroundColor(.orange)
                    }
                }

                Spacer()

                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.blue)
                        .font(.title3)
                } else if cluster.isAvailable {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray.opacity(0.5))
                        .font(.subheadline)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(isSelected
                          ? Color.blue.opacity(0.08)
                          : Color(.secondarySystemBackground))
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 2)
                    )
            )
        }
        .disabled(!cluster.isAvailable)
    }
}

#Preview {
    ExamSelectionView(onClusterSelected: { _ in })
}
