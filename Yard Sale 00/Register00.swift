//
//  Register00.swift
//  Yard Sale 00
//
//  Created by Nick J Cameron on 2016-10-20.
//  Copyright © 2016 Nick J Cameron. All rights reserved.
//

import UIKit

class Register00: UIViewController,UITextFieldDelegate {
  
    
    var Registration = DataManagerViewController();
    
    @IBOutlet weak var lblBusiessName: UILabel!
    @IBOutlet weak var lblError: UILabel!
    @IBOutlet weak var txtData: UITextField!
    @IBOutlet weak var btnArrowForward: UIButton!
    @IBOutlet weak var btnArrowBack: UIButton!
    
    @IBOutlet weak var lblBusinessNameCompleted: UILabel!
    @IBOutlet weak var lblBusinessNameComplete: UILabel!
    var middleLabel = CGPoint();
    let screenSize: CGRect = UIScreen.main.bounds
    var inOrOut = 0;
    var lblText = "Busiess Name";
   
    var businessName = "";
    var businessLocation = "";
    
   //this is the counter to see when to switch to the next view
  //to continue registering..
 //when the second input of data is entered and confirmed it will switch aka counter = 2..012
    
    var counter = 0;
    
    
    
    override func viewDidLoad() {
        //WARNING! WARNING! WARNING!
        //Will need to restrict KEY on LAUNCH
       

        super.viewDidLoad()
        self.txtData.delegate = self;
        lblError.isHidden = true;
        lblBusiessName.text = "Business Name"
        btnArrowBack.isEnabled = false;
<<<<<<< Updated upstream
=======
        lblBusinessNameComplete.isHidden = true;
        lblBusinessNameCompleted.isHidden = true;


        
        
        
>>>>>>> Stashed changes
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func slideLabel(labelOne: UILabel){
        labelOne.text = "Business Name";
        labelOne.textColor = UIColor.black

        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.0, initialSpringVelocity: 0.0, options: .curveEaseIn, animations: {
            
    
            self.middleLabel = labelOne.center;
            NSLog("this is location" + String(describing: self.middleLabel));
            labelOne.center = CGPoint(x: self.screenSize.maxX + labelOne.frame.maxX, y:self.middleLabel.y )
      
            }, completion:{ finished in self.animationTwo(labelTwo: labelOne)})
        
    };
    
    
    func animationTwo(labelTwo: UILabel){
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.0, initialSpringVelocity: 0.0, options: .curveEaseIn, animations: {
            
            if(self.inOrOut == 0){
       labelTwo.text = "Business Location";
            labelTwo.textColor = UIColor.darkGray
            }
             labelTwo.center = self.middleLabel;
    
            }, completion:nil)
        
    }
    
    
  
    @IBAction func BackArrow(_ sender: AnyObject) {
        self.counter = 0;
        self.inOrOut = 1;
        slideLabel(labelOne: lblBusiessName);


    }
    
  
    @IBAction func ForwardArrow(_ sender: AnyObject) {
        self.inOrOut = 0;
        if(txtData.text != ""){
            if(counter == 0){
                businessName = txtData.text!;
            }else{
                businessLocation = txtData.text!;
            }
            
        slideLabel(labelOne: lblBusiessName);
            lblError.isHidden = true;
            btnArrowBack.alpha = 1;
            btnArrowBack.isEnabled = true;
            txtData.text = "";
           self.counter += 1;
            
            if(counter == 2){
<<<<<<< Updated upstream
//                if(  Registration.Register(userName: "nick", password: "pass", businessName: businessName, businessLocation: businessLocation, businessType: "Cafe")){

=======
                
>>>>>>> Stashed changes
                //This is adding to the data manager array and eventually it will populate it all
                Registration.registrationData.append(businessName);
                Registration.registrationData.append(businessLocation);

                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Register01") as! Register01
                    self.present(nextViewController, animated:true, completion:nil)
               // }
            }
        }else{
            lblError.isHidden = false;
        
        }
<<<<<<< Updated upstream
       // txtData.resignFirstResponder()
=======

>>>>>>> Stashed changes
    }
    
    
    func checkToSlideInOrOut(checker:Int)-> Int{
        if(checker == 0){
            return 1
        }else{
            return 0;
        }
    }//end of function
    
    
    
    open func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.inOrOut = 0;
        if(txtData.text != ""){
            if(counter == 0){
                businessName = txtData.text!;
            }else{
                businessLocation = txtData.text!;
            }
            
            slideLabel(labelOne: lblBusiessName);
            lblError.isHidden = true;
            btnArrowBack.alpha = 1;
            btnArrowBack.isEnabled = true;
            txtData.text = "";
            self.counter += 1;
            lblBusinessNameCompleted.text = businessName;
            
            lblBusinessNameCompleted.isHidden = false;
            lblBusinessNameComplete.isHidden = false;

            if(counter == 2){
                
                //This is adding to the data manager array and eventually it will populate it all
                Registration.registrationData.append(businessName);
                Registration.registrationData.append(businessLocation);
                
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Register01") as! Register01
                self.present(nextViewController, animated:true, completion:nil)
                
                // }
            }
            
            
            
            
        }else{
            lblError.isHidden = false;
            
        }

        return true
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Pass the selected object to the new view controller.
    }
    

}




