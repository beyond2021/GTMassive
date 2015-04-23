//
//  GTCameraViewController.swift
//  GTMassive
//
//  Created by KEEVIN MITCHELL on 4/22/15.
//  Copyright (c) 2015 Beyond 2021. All rights reserved.
//

import UIKit
import AVFoundation

class GTCameraViewController: UIViewController {
    let captureSession = AVCaptureSession()
    var backFacingCamera:AVCaptureDevice?
    var frontFacingCamera:AVCaptureDevice?
    var currentDevice:AVCaptureDevice?
    
    var stillImageOutput:AVCaptureStillImageOutput?
    var stillImage:UIImage?
    
    var cameraPreviewLayer:AVCaptureVideoPreviewLayer?
    //@property (nonatomic, assign) BOOL slideOutAnimationEnabled;
    
    var slideOutAnimationEnabled = true
    
    
    @IBOutlet weak var cameraButton:UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.slideOutAnimationEnabled = YES;
        slideOutAnimationEnabled = true
        
        
        // Preset the session for taking photo in full resolution
        captureSession.sessionPreset = AVCaptureSessionPresetPhoto
        
        let devices = AVCaptureDevice.devicesWithMediaType(AVMediaTypeVideo) as! [AVCaptureDevice]
        // Get the front and back-facing camera for taking photos
        for device in devices {
            if device.position == AVCaptureDevicePosition.Back {
            backFacingCamera = device
        } else if device.position == AVCaptureDevicePosition.Front {
            frontFacingCamera = device
            }
        }
        currentDevice = backFacingCamera
        var error : NSError?
        let captureDeviceInput = AVCaptureDeviceInput(device: currentDevice, error: &error)
        if error != nil {
            println("error: \(error?.localizedDescription)")
        }
        // Configure the session with the output for capturing still images
        stillImageOutput = AVCaptureStillImageOutput()
        stillImageOutput?.outputSettings = [AVVideoCodecKey: AVVideoCodecJPEG]
        
        // Configure the session with the input and the output devices
        captureSession.addInput(captureDeviceInput)
        captureSession.addOutput(stillImageOutput)
        
        // Provide a camera preview
        cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        view.layer.addSublayer(cameraPreviewLayer)
        cameraPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
        cameraPreviewLayer?.frame = view.layer.frame
        // Bring the camera button to front
        view.bringSubviewToFront(cameraButton)
        captureSession.startRunning()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func unwindToCamera(segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func capture(sender: AnyObject) {
            let videoConnection = stillImageOutput?.connectionWithMediaType(AVMediaTypeVideo)
            stillImageOutput?.captureStillImageAsynchronouslyFromConnection(videoConnection, completionHandler: { (imageDataSampleBuffer, error) -> Void
            in
            let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(imageDataSampleBuffer)
            self.stillImage = UIImage(data: imageData)
            self.performSegueWithIdentifier("showPhoto", sender: self)
            })
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            // Get the new view controller using segue.destinationViewController.
            // Pass the selected object to the new view controller.
            if segue.identifier == "showPhoto" {
            let photoViewController = segue.destinationViewController as! GTPhotoViewController
            photoViewController.imageView.image = stillImage
            }
    }
    

}
