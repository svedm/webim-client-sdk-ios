//
//  ChatViewController+.swift
//  WebimClientLibrary_Example
//
//  Created by Anna Frolova on 21.01.2022.
//  Copyright © 2022 Webim. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Foundation
import WebimClientLibrary

extension ChatViewController: WMDialogPopoverDelegate {
    func addQuoteReplyBar() {
        self.toolbarView.addQuoteBarForMessage(self.selectedMessage, delegate: self)
        if self.selectedMessage?.isFile() ?? false && self.selectedMessage?.getData()?.getAttachment()?.getFileInfo().getImageInfo() != nil {
            self.toolbarView.quoteView.quoteImageView.isUserInteractionEnabled = true
            self.toolbarView.quoteView.quoteImageView.gestureRecognizers = nil
        }
        
        self.toolbarView.addQuoteBarForMessage(self.selectedMessage, delegate: self)
    }
    
    func hideQuoteView() {
        self.toolbarView.removeQuoteEditBar()
    }
    
    func addQuoteEditBar() {
        self.toolbarView.addQuoteEditBarForMessage(self.selectedMessage, delegate: self)
    }
    
    func likeMessage() {
        self.reactMessage(reaction: ReactionString.like)
    }
    
    func dislikeMessage() {
        self.reactMessage(reaction: ReactionString.dislike)
    }
    
    @objc
    func hideOverlayWindow() {
        AppDelegate.keyboardHidden(false)
    }
    
    func removeQuoteEditBar() {
        self.toolbarView.removeQuoteEditBar()
    }
}
