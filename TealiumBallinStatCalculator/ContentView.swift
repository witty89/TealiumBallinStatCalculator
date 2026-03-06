//
//  ContentView.swift
//  TealiumBallinStatCalculator
//
//  Created by Alex on 3/4/26.
//

import SwiftUI

enum StatField: Hashable {
    case fgm
    case threeFGM
    case fga
    case fta
}

struct ContentView: View {
    
    var stats: ShootingStats {
        ShootingStats(
            fgm: fgm,
            threeFGM: threeFGM,
            fga: fga,
            fta: fta,
        )
    }

    @FocusState private var focusedField: StatField?
    
    @State private var fgm: Int = 0
    @State private var threeFGM: Int = 0
    @State private var fga: Int = 0
    @State private var fta: Int = 0
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Basketball Shooting Calculator")
                .font(.title2)
                .fontWeight(.bold)
            
            VStack(spacing: 12) {
                
                InputRow(title: "FGM", value: $fgm, field: .fgm)
                InputRow(title: "3FGM", value: $threeFGM, field: .threeFGM)
                InputRow(title: "FGA", value: $fga, field: .fga)
                InputRow(title: "FTA", value: $fta, field: .fta)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            
            // Results Section
            VStack(alignment: .leading, spacing: 12) {

                Text("Results")
                    .font(.headline)
                
                HStack {
                    Text("FG%")
                    Spacer()
                    Text(String(format: "%.1f%%", stats.fgPercentage * 100))
                }
                
                HStack {
                    Text("eFG%")
                    Spacer()
                    Text(String(format: "%.1f%%", stats.efgPercentage * 100))
                }
                
                HStack {
                    Text("True Shooting %")
                    Spacer()
                    Text(String(format: "%.1f%%", stats.trueShootingPercentage * 100))
                }
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)

            Spacer()

            Button("Clear") {
                fgm = 0
                threeFGM = 0
                fga = 0
                fta = 0
            }
        }
        .padding()
        .environment(\.focusedStatField, $focusedField)
        
        
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    focusedField = nil
                }
            }
        }
    }
}

    
private struct FocusedStatFieldKey: EnvironmentKey {
    static let defaultValue: FocusState<StatField?>.Binding? = nil
}

extension EnvironmentValues {
    var focusedStatField: FocusState<StatField?>.Binding? {
        get { self[FocusedStatFieldKey.self] }
        set { self[FocusedStatFieldKey.self] = newValue }
    }
}
