//
//  FileDragView.swift
//  mpv-Drag-and-Drop
//
//  Created by THotaru on 2018/7/2.
//  Copyright © 2018年 THotaru. All rights reserved.
//

import Cocoa

protocol FileDragDelegate: class {
    func didFinishDrag(_ filePath:String)
}

class FileDragView: NSView {
    weak var delegate: FileDragDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.registerForDraggedTypes([.fileURL])
    }
    
    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        
        let sourceDragMask : NSDragOperation = sender.draggingSourceOperationMask
        let pboard : NSPasteboard = sender.draggingPasteboard
        let dragTypes : [NSPasteboard.PasteboardType]? = pboard.types
        
        if let dragTypes = dragTypes , dragTypes.contains(.fileURL) {
            if sourceDragMask.contains([.link]) {
                return .link
            }
            if sourceDragMask.contains([.copy]) {
                return .copy
            }
        }
        
        return .generic
    }
    
    override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
        
        let pboard : NSPasteboard = sender.draggingPasteboard
        let dragTypes : [NSPasteboard.PasteboardType]? = pboard.types
        
        if let dragTypes = dragTypes , dragTypes.contains(.fileURL) {
            if let filePath = URL(string: pboard.string(forType: .fileURL)!)?.absoluteString {
                if let delegate = self.delegate {
                    print("filePath \(filePath)")
                    delegate.didFinishDrag(filePath)
                }
            }
        }
        
        return true
    }
}
