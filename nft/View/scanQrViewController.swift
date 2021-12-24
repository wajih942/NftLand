//
//  scanQrViewController.swift
//  nft
//
//  Created by wajih on 11/16/21.
//

import UIKit
import AVFoundation

class scanQrViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate {

    
    //var
    var captureSession = AVCaptureSession()
    var videoPreviewLayer : AVCaptureVideoPreviewLayer?
    var qrcodeFrameView : UIView?
    var walletinfo = ["wallet address", "private key"]//[String]()
    let defaults = UserDefaults.standard
    
    //iboutlets
    
    @IBOutlet weak var nextshape: UIButton!
    
    @IBOutlet weak var addressText: UITextField!
    
    @IBOutlet weak var privateKey: UITextField!
    
    //ibactions
    
    @IBAction func nextButton(_ sender: Any) {
        walletinfo[0] = addressText.text!
        defaults.set(walletinfo,forKey: "info")
        performSegue(withIdentifier: "scanToPrivateSegue", sender: self)
        
    }
    
    
    @IBAction func burgerButton(_ sender: Any) {
        performSegue(withIdentifier: "scanToFunctionalitiesSegue", sender: self)
    }
    
    @IBAction func connectYourWalletButton(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func qrCodeButton(_ sender: Any) {
        
    }
    
    @IBAction func NFTLand(_ sender: Any) {
    }
    @IBAction func infoButton(_ sender: Any) {
    }
    
    
    
    
    //functions
    /*func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
            // Check if the metadataObjects array is not nil and it contains at least one object.
            if metadataObjects.count == 0 {
                qrCodeFrameView?.frame = CGRect.zero
                messageLabel.text = "No QR code is detected"
                return
            }
            
            // Get the metadata object.
            let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
            
            if supportedCodeTypes.contains(metadataObj.type) {
                // If the found metadata is equal to the QR code metadata (or barcode) then update the status label's text and set the bounds
                let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
                qrCodeFrameView?.frame = barCodeObject!.bounds
                
                if metadataObj.stringValue != nil {
                    launchApp(decodedURL: metadataObj.stringValue!)
                    messageLabel.text = metadataObj.stringValue
                }
            }
        }*/
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextshape.layer.cornerRadius = 15
        /*
        
        //get the back facing camera for capturing the videos
        guard let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
            print("Failed to get the camera device")
            return
        }
        
        do{
            //get instance of the avcapturedeviceinput class using the previous device object
            let input = try AVCaptureDeviceInput(device: captureDevice)
            //set the input device on  the capture session
            captureSession.addInput(input)
            
            //initialize a avcapturemetadata output object and set it as the output device to the capture session
            let captureMetaDataOutput = AVCaptureMetadataOutput()
            captureSession.addOutput(captureMetaDataOutput)
            //set delegate and use the default dispatch queu to execute the call back
            captureMetaDataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetaDataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
            
            
            //INITIALIZE the video preview layer and add it as a sublayer to the viewPreview view s layer
            
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
            videoPreviewLayer?.frame = view.layer.bounds
            view.layer.addSublayer(videoPreviewLayer!)
            
            //start video capture
            captureSession.startRunning()
            //Move the messsage label and top bar to front
            //view.bringSubviewToFront(messageLabel)
            //view.bringSubviewToFront(topbar)
            
            
        }catch{
            //if an error ocurrs ,simply print it out and don t continue anymore
            print(error)
            return
        }*/
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
