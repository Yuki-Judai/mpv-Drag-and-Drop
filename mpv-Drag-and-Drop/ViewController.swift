//
//  ViewController.swift
//  mpv-Drag-and-Drop
//
//  Created by THotaru on 2018/7/2.
//  Copyright © 2018年 THotaru. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var dragView: FileDragView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dragView.delegate = self
    }

}

extension ViewController : FileDragDelegate {
    
    func didFinishDrag(_ filePath: String) {
        
        let fileManager : FileManager = FileManager()
        var mpvVersions : [String] = []
        
        if let homebrewMpvURL = URL(string: "/usr/local/Cellar/mpv/") {
            do {
                let mpvDirectories : [URL] = try fileManager.contentsOfDirectory(at: homebrewMpvURL, includingPropertiesForKeys: [URLResourceKey.isDirectoryKey], options: FileManager.DirectoryEnumerationOptions.skipsHiddenFiles)
                for version in mpvDirectories {
                    mpvVersions.append(version.lastPathComponent)
                }
                
                let sortedVersions : [String] = mpvVersions.sorted(by: >)
                let lastVersion : String = sortedVersions[0]
                print("已安装的mpv最新版本 \(lastVersion)")
                
                let task : Process = Process()
                task.executableURL = URL(fileURLWithPath: "/usr/local/Cellar/mpv/\(lastVersion)/bin/mpv")
                task.arguments = [filePath]
                
                do {
                    try task.run()
                } catch {
                    Alert(title: "错误", info: "文件路径错误").show()
                }
            } catch {
                Alert(title: "警告", info: "您没有通过homebrew安装mpv播放器").show()
            }
        }

        NSApp.terminate(self)
    }
}
