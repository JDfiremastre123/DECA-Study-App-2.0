//
//  StudyModeView.swift
//  DECA Study App
//

import SwiftUI

struct StudyModeView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var settings: SettingsManager

    let cluster: ExamCluster

    // Gather terms for this cluster, grouped by category
    private var allTerms: [StudyTerm] {
        MarketingDatabase.studyTerms.filter { $0.cluster == cluster }
    }

    private var categories: [String] {
        var seen = Set<String>()
        return allTerms.compactMap { term in
            guard !seen.contains(term.category) else { return nil }
            seen.insert(term.category)
            return term.category
        }
    }

    @State private var searchText = ""
    @State private var expandedTermID: UUID? = nil

    private var filteredTerms: [StudyTerm] {
        if searchText.isEmpty { return allTerms }
        return allTerms.filter {
            $0.term.localizedCaseInsensitiveContains(searchText) ||
            $0.definition.localizedCaseInsensitiveContains(searchText)
        }
    }

    private var filteredCategories: [String] {
        var seen = Set<String>()
        return filteredTerms.compactMap { term in
            guard !seen.contains(term.category) else { return nil }
            seen.insert(term.category)
            return term.category
        }
    }

    var body: some View {
        ZStack(alignment: .top) {
            Color(.systemBackground).ignoresSafeArea()

            VStack(spacing: 0) {
                // ── Header ───────────────────────────────────────────────
                ZStack {
                    HStack {
                        Button(action: { dismiss() }) {
                            Image(systemName: "arrowshape.backward.circle")
                                .font(.title2)
                                .foregroundColor(.primary)
                        }
                        Spacer()
                        VStack(spacing: 2) {
                            Text(cluster.rawValue.uppercased())
                                .font(.system(size: 16, weight: .heavy))
                                .foregroundColor(.primary)
                            Text("Study Mode · \(allTerms.count) terms")
                                .font(.caption)
                                .foregroundColor(.black)
                        }
                        Spacer()
                        Image(systemName: cluster.iconName)
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 14)
                }
                .frame(height: 80)
                .background(cluster.color)

                // ── Search bar ───────────────────────────────────────────
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.secondary)
                    TextField("Search terms...", text: $searchText)
                        .font(.system(size: CGFloat(settings.textSize)))
                    if !searchText.isEmpty {
                        Button(action: { searchText = "" }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .padding(10)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(12)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)

                // ── Term list ────────────────────────────────────────────
                if filteredTerms.isEmpty {
                    Spacer()
                    Text("No terms found for \"\(searchText)\"")
                        .foregroundColor(.secondary)
                    Spacer()
                } else {
                    ScrollView {
                        LazyVStack(spacing: 0, pinnedViews: .sectionHeaders) {
                            ForEach(filteredCategories, id: \.self) { category in
                                Section {
                                    ForEach(filteredTerms.filter { $0.category == category }) { term in
                                        TermCard(
                                            term: term,
                                            isExpanded: expandedTermID == term.id,
                                            fontSize: CGFloat(settings.textSize)
                                        ) {
                                            withAnimation(.spring(response: 0.35)) {
                                                expandedTermID = expandedTermID == term.id ? nil : term.id
                                            }
                                        }
                                        Divider().padding(.leading, 20)
                                    }
                                } header: {
                                    CategoryHeader(title: category)
                                }
                            }
                        }
                        .padding(.bottom, 30)
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
}

// MARK: - Category Header
struct CategoryHeader: View {
    let title: String
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.blue)
                .textCase(nil)
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 8)
        .background(Color(.systemBackground).opacity(0.95))
    }
}

// MARK: - Term Card
struct TermCard: View {
    let term: StudyTerm
    let isExpanded: Bool
    let fontSize: CGFloat
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 0) {
                // Term title row
                HStack {
                    Text(term.term)
                        .font(.system(size: fontSize, weight: .semibold))
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.blue)
                        .font(.caption)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 14)

                // Expanded content
                if isExpanded {
                    VStack(alignment: .leading, spacing: 12) {
                        // Definition
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Definition")
                                .font(.system(size: 11, weight: .bold))
                                .foregroundColor(.secondary)
                                .textCase(.uppercase)
                            Text(term.definition)
                                .font(.system(size: fontSize - 1))
                                .foregroundColor(.primary)
                                .fixedSize(horizontal: false, vertical: true)
                        }

                        // Example
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Example")
                                .font(.system(size: 11, weight: .bold))
                                .foregroundColor(.secondary)
                                .textCase(.uppercase)
                            HStack(alignment: .top, spacing: 8) {
                                RoundedRectangle(cornerRadius: 2)
                                    .fill(Color.blue)
                                    .frame(width: 3)
                                Text(term.example)
                                    .font(.system(size: fontSize - 2))
                                    .foregroundColor(.secondary)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 16)
                    .background(Color.blue.opacity(0.04))
                }
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    NavigationStack {
        StudyModeView(cluster: .marketing)
            .environmentObject(SettingsManager())
    }
}
