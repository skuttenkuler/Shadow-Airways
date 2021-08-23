//
//  ContentView.swift
//  Shadow Airways
//
//  Created by Sam Kuttenkuler on 8/5/21.
//

import SwiftUI
import UIKit
import ExternalAccessory

class ViewController: UIViewController {
    
    private var accessory: EAAccessory?
    private var session: EASession?
    private let communicationProtocol = "<<protocol>>"
    
    private var writeBuffer:[UInt8] = [0,0,0,0]
    
    var accesoryManager = EAAccessoryManager.shared()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //addidtional setup after loading view
        EAAccessoryManager.shared().registerForLocalNotifications()
        NotificationCenter.default.addObserver(self, selector: #selector(didConnectAccessory(_:)), name: Notification.Name.EAAccessoryDidConnect, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didDisconnectAccessory(_:)), name: Notification.Name.EAAccessoryDidDisconnect, object: nil)
    }
    
    @objc
    private func didConnectAccessory(_ notification: NSNotification){
        let accessoryManager = EAAccessoryManager.shared()
        for accessory in accessoryManager.connectedAccessories {
            if accessory.protocolStrings.contains(communicationProtocol){
                let description = """
                    Accessory name: \(accessory.name)
                    Manufacturer: \(accessory.manufacturer)
                    Model number: \(accessory.modelNumber)
                    Serial number: \(accessory.serialNumber)
                    HW Revision: \(accessory.hardwareRevision)
                    FW Revision: \(accessory.firmwareRevision)
                    Connected: \(accessory.isConnected)
                    Connection ID: \(accessory.connectionID)
                    Protocol strings: \(accessory.protocolStrings.joined(separator: "; "))
                                
                """
                debugPrint(description)
                self.accessory = accessory
                openSession()
            }
        }
    }
    @objc private func didDisconnectAccessory(_ notification: NSNotification){
        
    }
    
    func openSession(){
        guard let newSession = EASession(accessory: accessory!, forProtocol: communicationProtocol) else {
            print("failed to create session")
            return
        }
        self.session = newSession
        session?.inputStream?.delegate = self
        session?.inputStream?.schedule(in: RunLoop.current, forMode: .default)
        session?.inputStream?.open()
        session?.outputStream?.delegate = self
        session?.outputStream?.schedule(in: RunLoop.current, forMode: .default)
        session?.outputStream?.open()
    }
    private func writeToStream() {
        while self.session?.outputStream?.hasSpaceAvailable ?? false && !writeBuffer.isEmpty {
            guard let bytesWritten = self.session?.outputStream?.write(&writeBuffer, maxLength: writeBuffer.count) else {
                return
            }
            if bytesWritten == -1 {
                return
            }
            else if bytesWritten > 0 {
                writeBuffer.replaceSubrange(0..<bytesWritten, with: [UInt8]())
            }
        }
    }
    private func readFromStream() -> Data?{
        var readBuffer = [UInt8]()
        let BUF_LEN = 128
        var buf = [UInt8].init(repeating: 0x00, count: BUF_LEN)
        while (self.session?.inputStream?.hasBytesAvailable) ?? false{
            guard let bytesRead = session?.inputStream?.read(&buf, maxLength: BUF_LEN) else {
                return nil
            }
            if bytesRead == -1 {
                return nil
            }
            else if bytesRead > 0 {
                readBuffer.append(contentsOf: buf.prefix(bytesRead))
            }
        }
        return Data.init(readBuffer)
    }
}

extension ViewController: StreamDelegate {
    func stream(_ aStream: Stream, handle eventCode: Stream.Event) {
        switch (eventCode) {
            case Stream.Event.hasBytesAvailable:
                //device sent data to iOS
                //read stream
                let data = self.readFromStream()
                print("recieved \(String(describing: data?.count))bytes from device")
            case Stream.Event.hasSpaceAvailable:
                //device ready to recieve data from ios
                self.writeToStream()
            case Stream.Event.errorOccurred:
            //error
                print("error communicating with device")
        default:
        break
        
        }
       
    }
}

struct HomeView: View {
    var body: some View {
        //add navView
        NavigationView {
            VStack{
                
            HomeContent()

            }.background(
                Image("background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            )
    
        }
    }
}

struct HomeContent: View {
    //view block
    
    var body: some View {
        Text("Shadow Airways")
            .font(.system(size: 40))
            .bold()
            .italic()
            .offset(y: -25)
        Spacer()
        
        NavigationLink(destination:BookTicketView(), label: {
            Text("Book Flight")
                .font(.system(size:60))
                .foregroundColor(Color.white)
                .background(Color.blue)
                .cornerRadius(20)
                
            })
}
}
