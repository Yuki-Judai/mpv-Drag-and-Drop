//
//  WindowController.swift
//  mpv-Drag-and-Drop
//
//  Created by THotaru on 2018/7/2.
//  Copyright © 2018年 THotaru. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
    
        window?.center()
        window?.titleVisibility = .hidden
    window?.standardWindowButton(.miniaturizeButton)?.removeFromSuperview()
        window?.standardWindowButton(.zoomButton)?.removeFromSuperview()
        window?.styleMask.insert(.fullSizeContentView)
        window?.titlebarAppearsTransparent = true
        window?.contentView?.wantsLayer = true
        window?.contentView?.layer?.contents = NSImage(imageLiteralResourceName: "leaf")
        window?.isMovableByWindowBackground = true
    }

}
