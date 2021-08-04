//
//  CrawlHelper.swift
//  MiniProject1-Crawl
//
//  Created by Jamie Chen on 2021-08-03.
//

import Foundation

func isFileDirectory(atPath path: String, name: String) -> FileModel {
    let fileManager = FileManager.default
    
    var isDir: ObjCBool = false
    
    return FileModel(path: path, name: name, isExist: fileManager.fileExists(atPath: path+"/\(name)", isDirectory: &isDir), isDirectory: isDir.boolValue)
}

func getContentOfDirectory(at url: String) {
    let fileManager = FileManager.default
    
    do {
        let items = try fileManager.contentsOfDirectory(atPath: url)
        for item in items {
            let model = isFileDirectory(atPath: url, name: item)
            if model.isExist && model.isDirectory {
                getContentOfDirectory(at: url+"/\(item)")
            } else if model.isExist && !model.isDirectory {
                if item == items.last {
                    print("│ \(FileHeaders.lastFileHeader.rawValue+item)")
                } else {
                    print(FileHeaders.fileContentHeader.rawValue+item)
                }
            }
        }
    } catch {
        print("there are no items")
    }
}

enum FileHeaders: String {
    case fileContentHeader = "├─"
    case lastFileHeader = "└─"
}

struct FileModel {
    let path: String
    let name: String
    let isExist: Bool
    let isDirectory: Bool
}
