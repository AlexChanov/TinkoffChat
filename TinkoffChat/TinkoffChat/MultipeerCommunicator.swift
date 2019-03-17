//
//  MultipeerCommunicator.swift
//  TinkoffChat
//
//  Created by Алексей ]Чанов on 15/03/2019.
//  Copyright © 2019 Алексей Чанов. All rights reserved.
//

import MultipeerConnectivity

class MultipeerCommunicator: NSObject, Communicator {
    
    
    weak  var delegate: CommunicatorDelegate?
    var browser: MCNearbyServiceBrowser!
    var advertiser: MCNearbyServiceAdvertiser!
    var localPeerId: MCPeerID!
    var sessionsDictionary: [String: MCSession] = [:]
    
    
    static let shared = MultipeerCommunicator()
    var online: Bool = true {
        didSet {
            if online {
                browser.startBrowsingForPeers()
                advertiser.startAdvertisingPeer()
            } else {
                sessionsDictionary.removeAll()
                browser.stopBrowsingForPeers()
                advertiser.stopAdvertisingPeer()
            }
        }
    }
    
    func startCommunication(name: String) {
        guard browser == nil || advertiser == nil  else { return }
        localPeerId = MCPeerID(displayName: UIDevice.current.name)
        browser = MCNearbyServiceBrowser(peer: localPeerId, serviceType: "tinkoff-chat")
        advertiser = MCNearbyServiceAdvertiser(peer: localPeerId,
                                               discoveryInfo: ["userName": name], serviceType: "tinkoff-chat")
        
        browser.delegate = self
        advertiser.delegate = self
    }
    
    func sendMessage(string text: String, to userId: String, completionHandler: MessageHandler?) {
        guard let session = sessionsDictionary[userId] else { return }
        let dictionaryToSend = ["eventType": "TextMessage", "messageId": generateMessageId(), "text": text]
        guard let data = try? JSONSerialization.data(withJSONObject: dictionaryToSend,
                                                     options: .prettyPrinted) else { return }
        do {
            try session.send(data, toPeers: session.connectedPeers, with: .reliable)
            delegate?.didReceiveMessage(text: text, fromUser: localPeerId.displayName, toUser: userId)
            if let completion = completionHandler {
                completion(true, nil)
            }
        } catch let error {
            if let completion = completionHandler {
                completion(false, error)
            }
        }
    }
    
    func getSession(with peerID: MCPeerID) -> MCSession {
        guard sessionsDictionary[peerID.displayName] == nil else { return sessionsDictionary[peerID.displayName]! }
        let session = MCSession(peer: localPeerId, securityIdentity: nil, encryptionPreference: .none)
        session.delegate = self
        sessionsDictionary[peerID.displayName] = session
        return sessionsDictionary[peerID.displayName]!
    }
    
    func generateMessageId() -> String {
        let string = "\(arc4random_uniform(UINT32_MAX))" +
            "+\(Date.timeIntervalSinceReferenceDate)" +
        "+\(arc4random_uniform(UINT32_MAX))"
        let encodedString = string.data(using: .utf8)?.base64EncodedString()
        return encodedString!
    }
}
