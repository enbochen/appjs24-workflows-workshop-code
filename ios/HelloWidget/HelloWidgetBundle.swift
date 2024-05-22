//
//  HelloWidgetBundle.swift
//  HelloWidget
//
//  Created by Enbo Chen on 22.5.2024.
//

import WidgetKit
import SwiftUI

@main
struct HelloWidgetBundle: WidgetBundle {
    var body: some Widget {
        HelloWidget()
        HelloWidgetLiveActivity()
    }
}
