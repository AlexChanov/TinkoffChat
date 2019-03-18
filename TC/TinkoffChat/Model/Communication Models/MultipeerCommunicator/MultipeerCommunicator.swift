//
//  MultipeerCommunicator.swift
//  TinkoffChat
//
//  Created by Чанов] Алексей
//  Copyright © 2019 Чанов Алексей . All rights reserved.
//

import MultipeerConnectivity

class MultipeerCommunicator: NSObject, Communicator {
    
    var browser: MCNearbyServiceBrowser!
    var advertiser: MCNearbyServiceAdvertiser!
    var localPeerId: MCPeerID!
    var sessionsDictionary: [String: MCSession] = [:]

    weak var delegate: CommunicatorDelegate?
    
    var online: Bool = true {
        didSet {
            if online {
                browser.startBrowsingForPeers()
                advertiser.startAdvertisingPeer()
            } else {
                browser.stopBrowsingForPeers()
                advertiser.stopAdvertisingPeer()
            }
        }
    }
    
    
    
    init(profile: Profile) {
        super.init()
        
        localPeerId = MCPeerID(displayName: UIDevice.current.name)
        browser = MCNearbyServiceBrowser(peer: localPeerId, serviceType: "tinkoff-chat")
        advertiser = MCNearbyServiceAdvertiser(peer: localPeerId, discoveryInfo: ["userName" : profile.name], serviceType: "tinkoff-chat")
        browser.delegate = self
        advertiser.delegate = self
        advertiser.startAdvertisingPeer()
        browser.startBrowsingForPeers()
    }
    
    
            delegate?.didReceiveMessage(text: string, fromUser: localPeerId.displayName, toUser: userId)
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
    
    
 
    }
}
