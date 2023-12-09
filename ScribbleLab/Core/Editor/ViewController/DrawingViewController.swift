//
//  DrawingViewController.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 25.11.23.
//

import SwiftUI
import UIKit
import PencilKit

class DrawingViewController: UIViewController, PKCanvasViewDelegate {
    
    private let canvasView: PKCanvasView = {
        let canvas = PKCanvasView()
        canvas.drawingPolicy = .anyInput
        return canvas
    }()
    
    let drawing = PKDrawing()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        canvasView.drawing = drawing
        canvasView.delegate = self
        view.addSubview(canvasView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        canvasView.frame = view.bounds
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let toolPicker = PKToolPicker()
        toolPicker.setVisible(true, forFirstResponder: canvasView)
        toolPicker.addObserver(canvasView)
        canvasView.becomeFirstResponder()
    }
    
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
        
    }
    
    func canvasViewDidEndUsingTool(_ canvasView: PKCanvasView) {
        
    }
    
    func canvasViewDidFinishRendering(_ canvasView: PKCanvasView) {
        
    }
    
    func canvasViewDidBeginUsingTool(_ canvasView: PKCanvasView) {
        
    }
}

// SwiftUI wrapper using UIViewControllerRepresentable
struct DrawingViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> DrawingViewController {
        return DrawingViewController()
    }
    
    func updateUIViewController(_ uiViewController: DrawingViewController, context: Context) {
        // Update the view controller if needed
    }
}

struct DrawingView: View {
    var body: some View {
        VStack {
            DrawingViewControllerWrapper()
        }
    }
}

#Preview {
    DrawingView()
}
