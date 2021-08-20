// 

import Foundation
import CryptoKit

extension Crypto.X25519 {
    struct PrivateKey: Equatable {
        static func == (lhs: Crypto.X25519.PrivateKey, rhs: Crypto.X25519.PrivateKey) -> Bool {
            lhs.raw == rhs.raw
        }
        
        private let privateKey: Curve25519.KeyAgreement.PrivateKey
        
        var raw: Data {
            return privateKey.rawRepresentation
        }
        var publicKey: Data {
            return privateKey.publicKey.rawRepresentation
        }
        
        init(){
            privateKey = Curve25519.KeyAgreement.PrivateKey()
        }
        
        init(raw: Data) throws {
            privateKey = try Curve25519.KeyAgreement.PrivateKey(rawRepresentation: raw)
        }
    }
    
    struct AgreementKeys: Equatable {
        let sharedKey: Data
        let publicKey: Data
    }
}

