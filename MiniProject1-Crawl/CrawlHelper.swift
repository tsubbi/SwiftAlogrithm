//
//  CrawlHelper.swift
//  MiniProject1-Crawl
//
//  Created by Jamie Chen on 2021-08-03.
//

import Foundation

func isFileDirectory(atPath path: String, name: String) -> FileModel? {
    let fileManager = FileManager.default
    
    var isDir: ObjCBool = false
    
    return fileManager.fileExists(atPath: path+"/\(name)", isDirectory: &isDir) ? FileModel(path: path, name: name, isDirectory: isDir.boolValue) : nil
}

func getContentOfDirectory(at url: String) {
    let fileManager = FileManager.default
    
    do {
        let items = try fileManager.contentsOfDirectory(atPath: url)
        items.forEach {
            guard let model = isFileDirectory(atPath: url, name: $0) else {
                print("File does not exist")
                return
            }
            if model.isDirectory {
                getContentOfDirectory(at: url+"/\($0)")
            } else {
                if $0 == items.last {
                    print("│ \(FileHeaders.lastFileHeader.rawValue+$0)")
                } else {
                    print(FileHeaders.fileContentHeader.rawValue+$0)
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
    let isDirectory: Bool
}
