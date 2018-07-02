//
//  Alert.swift
//  mpv-Drag-and-Drop
//
//  Created by THotaru on 2018/7/2.
//  Copyright © 2018年 THotaru. All rights reserved.
//

import Cocoa

class Alert {
    var title :String = "Warning"
    var info  :String = "Something went wrong"
    
    init(_ info: String){
        self.title = "Alert"
        self.info  = info
    }
    
    init(title: String, info: String){
        self.title = title
        self.info  = info
    }
    
    func show() {
        let alert = NSAlert()
        alert.messageText = title
        alert.informativeText = info
        alert.addButton(withTitle: "OK")
        alert.runModal()
    }
}


/*
 Use:
 
 Toast("Everything is OK", self.view.window).show(5)
 
 */

class Toast {
    var info   : String = "Toasted!"
    var window : NSWindow?
    
    init(_ info: String, _ window: NSWindow){
        self.info  = info
        self.window = window
    }
    
    func show(_ secs: Int) {
        guard let window = self.window else { return }
        
        let alert = NSAlert()
        alert.informativeText = info
        //alert.addButton(withTitle: "OK")
        let timer: DispatchTime = .now() + .milliseconds(secs * 1000)
        
        DispatchQueue.main.asyncAfter(deadline: timer) {
            print("Hide!")
            window.endSheet(alert.window)
        }
        
        alert.beginSheetModal(for: window) { NSModalResponse in
            print("Dismissed")
        }
    }
}


/*
 Use:
 
 Dialog("Everything is OK?").show()
 Dialog(title:"Warning", info:"The file will be deleted!").show()
 
 */
class Dialog {
    var title :String = "Message"
    var info  :String = "Would you like to proceed?"
    
    init(_ info: String){
        self.info  = info
    }
    
    init(title: String, info: String){
        self.title = title
        self.info  = info
    }
    
    func show() -> Bool{
        var ok = false
        let alert  = NSAlert()
        
        alert.messageText = title
        alert.informativeText = info
        alert.addButton(withTitle: "NO")
        alert.addButton(withTitle: "YES")
        ok = (alert.runModal() == NSApplication.ModalResponse.alertSecondButtonReturn)
        
        return ok
    }
}
