//
//  ViewController.m
//  Warren_Robert_MDF1_1312_Week1_ver2
//
//  Created by Robert Warren on 11/28/13.
//  Copyright (c) 2013 Robert Warren. All rights reserved.
//

#import "ViewController.h"
#import "Gift1View.h"
#import "GiftData.h"

@interface ViewController ()
{
    UIImage *toInsertImage;
    NSString *toInsertName;
    NSString *toInsertInfo;
    
}
@end

@implementation ViewController
{
    
    
}

- (void)viewDidLoad
{
    //my 3 arrays to dynamically load into custom cell
    //title
    santaSack = [[NSMutableArray alloc] initWithObjects:
                 @"27\" iMac",
                 @"2 24\" Samsung LED Monitors",
                 @"Samsung Galaxy Note 10.1",
                 @"Nexus 10 Tablet",
                 @"Apple Time Capsule",
                 @"PlayStation 4",
                 @"XBox One",
                 @"Nintendo Wii U Deluxe Set",
                 @"Nintendo 3DS",
                 @"PlayStation Vita",
                 @"iPad Air Wifi",
                 @"iPad Mini Retina Wifi",
                 @"iPhone 5s Unlocked",
                 @"Apple Tv",
                 @"Turtle Beach Ear Force X42",
                 @"Samsung Galaxy Gear",
                 @"Pebble SmartWatch",
                 @"Google Glass",
                 @"Call of Duty Ghost",
                 @"Pair of Nike Cortez",
                 nil];
    //description1
    santaD1 = [[NSMutableArray alloc] initWithObjects:
               @"With 3.5Ghz CPU and 16gb Ram",
               @"Full 1080p HD",
               @"2014 Edition 32gb model",
               @"2014 Edition 32GB Model",
               @"2013 Model with 802.11ac technology",
               @"BattleField 4 and PS Plus Bundle",
               @"Day One Edition",
               @"With New Super Mario Bros. U",
               @"Black on Black",
               @"G model",
               @"128gb Model Space Grey",
               @"128gb Model Space Grey",
               @"64gb Model Space Grey",
               @"3rd Generation",
               @"Wireless Dolby Surround Sound",
               @"Jet Black",
               @"Jet Black",
               @"Prescription Edition",
               @"Hardened Edition",
               @"Black and White",
               nil];
    //description2
    santaD2 = [[NSMutableArray alloc] initWithObjects:
               @"4gb Video Card and AppleCare",
               @"With both DVI and VGA inputs",
               @"With a 64gb Micr0Sd Card",
               @"For Development use",
               @"For backup and network drive",
               @"Extra Controller",
               @"Extra Controller",
               @"And New Super Luigi U",
               @"The Legend of Zelda: A Link Between Worlds",
               @"Batman Arkham Origins",
               @"For Development",
               @"For Development",
               @"For Development",
               @"Upgrade My 2nd Generation",
               @"Gaming Headset",
               @"To sync with my Samsung Note 3",
               @"For syncing with everything else",
               @"For Development",
               @"PS4 Edition",
               @"Leather Version",
               nil];
    
    //set cell height
    self->charted.rowHeight = 100.f;
    //set editing to off on load
    [charted setEditing:false animated:true];
    
    [super viewDidLoad];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//set number of labels based on title array size.
- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return [santaSack count];
}

//commit to the delete here.
-(void)tableView:(UITableView*)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //verify editing style
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        //remove object from UI
        [santaSack removeObjectAtIndex:indexPath.section];
        //remove from arrays
        [charted deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        //turn editing off
        [charted setEditing:false animated:true];
    }
}

//create tags and insert data
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //create tags
    static NSString *cellId = @"Test";
    craptastic = [charted dequeueReusableCellWithIdentifier: cellId];
    if (craptastic == nil)
    {
        
        NSArray *loadedSleigh = [[NSBundle mainBundle] loadNibNamed:@"Gift1View" owner:nil options:nil];
        for (UIView *gifts in loadedSleigh)
        {
            if([gifts isKindOfClass:[Gift1View class]])
            {
                craptastic = (Gift1View*)gifts;
                
            }
        }
    }
    //load data into custom cell
    //load title
    craptastic->gift.text = (NSMutableString*)[santaSack objectAtIndex:indexPath.row];
    //load description 1
    craptastic->descrip1.text = (NSMutableString*)[santaD1 objectAtIndex:indexPath.row];
    //load description 2
    craptastic->descrip2.text = (NSMutableString*)[santaD2 objectAtIndex:indexPath.row];
    //load custom cell image
    craptastic->santa.image = [UIImage imageNamed:@"santa.jpg"];
    craptastic.tag = indexPath.row;
    return craptastic;
    //tag++;
    
}


//universal segue call to pass the custom data to detail page
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"GiftData"])
    {
        GiftData *destination = segue.destinationViewController;
        destination.insertImage = toInsertImage;
        destination.insertName = toInsertName;
        destination.InsertInfo = toInsertInfo;
        
    }
}

//selected row calls
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //grab text from gift label in selected cell
    grabIt = (Gift1View *)[charted cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row  inSection:0]];
    textFieldVal = [grabIt->gift text];
    //cells check to see if they are the selected cell
    //label 1
    if ([textFieldVal  isEqual: @"27\" iMac"])
    {
        toInsertImage = [UIImage imageNamed:@"imac.jpg"];
        toInsertName = [NSString stringWithFormat:@"iMac 27\""];
        toInsertInfo = [NSString stringWithFormat:@"Specifications:\n3.5GHz Quad-core Intel Core i7, Turbo Boost up to 3.9GHz\n16GB 1600MHz DDR3 SDRAM - 2X8GB\n\n1TB Serial ATA Drive @ 7200 rpm\nNVIDIA GeForce GTX 780M 4GB GDDR5\nMagic Trackpad\nApple Keyboard with Numeric Keypad (English)"];
        
        [self performSegueWithIdentifier: @"GiftData" sender: self];


    }
    //label 2
    else if ([textFieldVal  isEqual: @"2 24\" Samsung LED Monitors"])
    {
        toInsertImage = [UIImage imageNamed:@"monitor.jpg"];
        toInsertName = [NSString stringWithFormat:@"2 Samsung 24\" HD Monitors"];
        toInsertInfo = [NSString stringWithFormat:@"24-Inch (16:9) Screen Size 90°/65° Viewing Angle (Horizontal/Vertical) 16.7M Color Support 1,920 x 1,080 Resolution 5ms Response Time DVI and VGA Ports for Connecting a Laptop. This monitor features aDVI and a VGA port that enable you to connect a laptop so you can work or play on a larger screen. Simply press the source button on the monitor to switch sources."];
        
        [self performSegueWithIdentifier: @"GiftData" sender: self];
        
    }
    //label 3
    else if ([textFieldVal  isEqual: @"Samsung Galaxy Note 10.1"])
    {
        toInsertImage = [UIImage imageNamed:@"Note10.jpg"];
        toInsertName = [NSString stringWithFormat:@"Samsung Galaxy\nNote 10.1"];
        toInsertInfo = [NSString stringWithFormat:@"Android 4.3 Jelly Bean OS, 1.9GHz Samsung Exynos 5420 Quad-Core Processor; Wi-Fi connected only 32 GB Flash Memory, 3 GB RAM Memory 10.1-inch 2560x1600 WQXGA display with 4 million pixels 8MP rear camera includes LED flash and shoots video in full 1080p HD Pre-loaded with free content including Hulu Plus membership, Google Play credit, Businessweek subscription, and more"];
        [self performSegueWithIdentifier: @"GiftData" sender: self];
    }
    //label 4
    else if ([textFieldVal  isEqual: @"Nexus 10 Tablet"])
    {
        toInsertImage = [UIImage imageNamed:@"Nexus10.png"];
        toInsertName = [NSString stringWithFormat:@"Nexus 10"];
        toInsertInfo = [NSString stringWithFormat:@"Best of Google.\nNexus 10 comes loaded with your favorite Google apps — like Chrome, Gmail, YouTube, Hangouts and Google Now — so you can browse, watch, share and stay connected wherever you go. And because Google apps are designed for the cloud, everything is simple and works seamlessly across your phone, tablet and computer. Now you have all the stuff you need, when you need it. Android 4.4"];
        [self performSegueWithIdentifier: @"GiftData" sender: self];
    }
    //label 5
    else if ([textFieldVal  isEqual: @"Apple Time Capsule"])
    {
        toInsertImage = [UIImage imageNamed:@"timecapsule.jpg"];
        toInsertName = [NSString stringWithFormat:@"Apple\nTime Capsule"];
        toInsertInfo = [NSString stringWithFormat:@"Back up a lifetime’s worth of memories with AirPort Time Capsule, a wireless hard drive that works seamlessly with Time Machine in OS X. It’s also a full-featured Wi-Fi base station with the latest 802.11ac technology and simultaneous dual-band support. 3TB model."];
        [self performSegueWithIdentifier: @"GiftData" sender: self];
    }
    //label 6
    else if ([textFieldVal  isEqual: @"PlayStation 4"])
    {
        toInsertImage = [UIImage imageNamed:@"ps4.jpg"];
        toInsertName = [NSString stringWithFormat:@"PlayStation 4\nBattelefield 4\nPS Plus Bundle"];
        toInsertInfo = [NSString stringWithFormat:@"What's in the Box\nPlayStation 4 System (Jet Black)\nDUALSHOCK 4 Wireless Controller\nHDMI Cable\nPower Cable\nWired Mono Headset\nUSB Charging Cable\nBattlefield 4 PS4 Game\nPS Plus code will be emailed within two days after shipment"];
        [self performSegueWithIdentifier: @"GiftData" sender: self];
    }
    //label 7
    else if ([textFieldVal  isEqual: @"XBox One"])
    {
        toInsertImage = [UIImage imageNamed:@"xbox.jpg"];
        toInsertName = [NSString stringWithFormat:@"XBox One\nDay One Edition"];
        toInsertInfo = [NSString stringWithFormat:@"Get more with Xbox One.\nIntroducing Xbox One. Where the best games, multiplayer, and your favorite movies, music, sports and live TV come together in one place. Xbox One games look and feel incredibly real, with cinematic gameplay that rivals Hollywood. Watch TV or chat with friends on Skype while you play. Designed to keep getting better over time."];
        [self performSegueWithIdentifier: @"GiftData" sender: self];
    }
    //label 8
    else if ([textFieldVal  isEqual: @"Nintendo Wii U Deluxe Set"])
    {
        toInsertImage = [UIImage imageNamed:@"wii.jpg"];
        toInsertName = [NSString stringWithFormat:@"Nintendo Wii U\nDeluxe Set"];
        toInsertInfo = [NSString stringWithFormat:@"It's an entirely new system that will change the way you experience entertainment. Experience your favorite Nintendo worlds in crystal clear high definition. The New Wii U GamePad controller removes the traditional barriers between you, your games, and your TV by creating a second window into the video game world. Plus, in this bundle, you'll get Super Mario Bros. U and the New Super Luigi U, where it's finally Luigi's turn in the limelight!"];
        [self performSegueWithIdentifier: @"GiftData" sender: self];
    }
    //label 9
    else if ([textFieldVal  isEqual: @"Nintendo 3DS"])
    {
        toInsertImage = [UIImage imageNamed:@"3DS.jpg"];
        toInsertName = [NSString stringWithFormat:@"Nintendo 3DS"];
        toInsertInfo = [NSString stringWithFormat:@"The Nintendo 3DS XL system combines next-generation portable gaming with eye-popping 3D visuals. Take 3D photos, connect to friends, other players, or wireless hotspots with the wireless StreetPass and SpotPass communication modes. With 90 percent larger screens than the 3DS, 3DS XL is the ultimate 3D entertainment system."];
        [self performSegueWithIdentifier: @"GiftData" sender: self];
    }
    //label 10
    else if ([textFieldVal  isEqual: @"PlayStation Vita"])
    {
        toInsertImage = [UIImage imageNamed:@"vita.jpg"];
        toInsertName = [NSString stringWithFormat:@"PlayStation Vita\n3G"];
        toInsertInfo = [NSString stringWithFormat:@"Sony's PlayStation Vita retains the familiar form of the PlayStation Portable hardware series while dramatically improving on every aspect of its use with powerful and exciting new features including: dual touch pads, dual cameras, dual analog sticks, a 5-inch OLED screen, GPS, six-axis motion sensors and a three-axis compass and exceptional built-in connectivity via both Wi-Fi and exclusive to this model, an always on 3G connection."];
        [self performSegueWithIdentifier: @"GiftData" sender: self];
    }
    //label 11
    else if ([textFieldVal  isEqual: @"iPad Air Wifi"])
    {
        toInsertImage = [UIImage imageNamed:@"iPadAir.jpg"];
        toInsertName = [NSString stringWithFormat:@"iPad Air\nWiFi"];
        toInsertInfo = [NSString stringWithFormat:@"All-new design\niPad Air weighs just one pound, and it’s 20 percent thinner.2 But even though it’s extremely light, it has a refined aluminum unibody enclosure that feels solid and durable in your hand.\nUltrafast wireless\nNow you can get up to 2x faster Wi-Fi performance using 802.11n with MIMO."];
        [self performSegueWithIdentifier: @"GiftData" sender: self];
    }
    //label 12
    else if ([textFieldVal  isEqual: @"iPad Mini Retina Wifi"])
    {
        toInsertImage = [UIImage imageNamed:@"ipadmini.jpg"];
        toInsertName = [NSString stringWithFormat:@"iPad Mini\nRetina WiFi"];
        toInsertInfo = [NSString stringWithFormat:@"7.9-inch Retina display\nPhotos and videos look incredibly detailed and text is razor sharp on the stunning Retina display, which features over 3.1 million pixels — a million more than an HDTV. iPad mini is incredibly powerful and capable, with advanced features like iSight and FaceTime HD cameras. Yet you can still hold it in one hand."];
        [self performSegueWithIdentifier: @"GiftData" sender: self];
    }
    //label 13
    else if ([textFieldVal  isEqual: @"iPhone 5s Unlocked\n64gb Model Space Grey\nFor Development"])
    {
        toInsertImage = [UIImage imageNamed:@"iphone5s.png"];
        toInsertName = [NSString stringWithFormat:@"iPhone 5s\nUnlocked"];
        toInsertInfo = [NSString stringWithFormat:@"If you buy iPhone for T-Mobile, it will arrive with a nano-SIM card already installed that you can activate by visiting an Apple Retail Store or a T-Mobile store or by calling T-Mobile. If you buy a SIM-free iPhone, you will need to purchase a GSM-compatible nano-SIM card separately. In the United States, you can purchase such a SIM from AT&T or T-Mobile. The unlocked iPhone 5s model is A1533 (GSM)."];
        [self performSegueWithIdentifier: @"GiftData" sender: self];
    }
    //label 14
    else if ([textFieldVal  isEqual: @"Apple Tv\n 3rd Generation\nUpgrade My 2nd Generation"])
    {
        toInsertImage = [UIImage imageNamed:@"appletv.jpg"];
        toInsertName = [NSString stringWithFormat:@"Apple TV"];
        toInsertInfo = [NSString stringWithFormat:@"iTunes movies and TV shows in 1080p.\nBuy or rent the hottest HD movies, catch up on the TV shows everyone’s talking about, and tap into the millions of other entertainment options from  iTunes.\nAirPlay.\nAirPlay lets you wirelessly stream what’s on your Mac or iOS device to your HDTV and speakers via Apple TV. Or mirror exactly what’s on your device's display to the big screen."];
        [self performSegueWithIdentifier: @"GiftData" sender: self];
    }
    //label 15
    else if ([textFieldVal  isEqual: @"Turtle Beach Ear Force X42"])
    {
        toInsertImage = [UIImage imageNamed:@"turtle.gif"];
        toInsertName = [NSString stringWithFormat:@"Turtle Beach\nEar Force X42"];
        toInsertInfo = [NSString stringWithFormat:@"Powered by a state-of-the-art 2.4/5GHz Dual-Band Wi-Fi radio, the X42 easily coexists with Wi-Fi networks and virtually eliminates wireless interference with other devices. Multiple EQ presets and variable surround sound angles let you customize audio settings for any gaming situation. Its massive 50mm speakers deliver amazing audio fidelity and bone-rattling bass, while its lightweight design and breathable mesh ear cushions provide ultimate comfort."];
        [self performSegueWithIdentifier: @"GiftData" sender: self];
    }
    //label 16
    else if ([textFieldVal  isEqual: @"Samsung Galaxy Gear"])
    {
        toInsertImage = [UIImage imageNamed:@"gear.jpg"];
        toInsertName = [NSString stringWithFormat:@"Samsung Galaxy\nGear"];
        toInsertInfo = [NSString stringWithFormat:@"Compatible with Galaxy Note 3 and other Galaxy smartphones\n1.63 inch Super AMOLED screen and 1.9 Megapixel camera\nPlace calls and answer them directly from your Galaxy Gear\nEnjoy the S Voice personal assistant right on your wrist\nIncludes Samsung Galaxy Gear, wall charger, charging cradle, quick start guide"];
        [self performSegueWithIdentifier: @"GiftData" sender: self];
    }
    //label 17
    else if ([textFieldVal  isEqual: @"Pebble SmartWatch"])
    {
        toInsertImage = [UIImage imageNamed:@"Pebble.jpg"];
        toInsertName = [NSString stringWithFormat:@"Pebble\nSmart Watch"];
        toInsertInfo = [NSString stringWithFormat:@"View notifications from email, SMS, Caller ID, calendar and your favorite apps on your wrist.\nDownload watch faces and apps to suit your style and interests.\nControl music playing on iTunes, Spotify, Pandora and more.\nRechargeable battery lasts 5-7 days on a single charge\nCompatible with both Apple and Android devices"];
        [self performSegueWithIdentifier: @"GiftData" sender: self];
    }
    //label 18
    else if ([textFieldVal  isEqual: @"Google Glass"])
    {
        toInsertImage = [UIImage imageNamed:@"GoogleGlass.jpg"];
        toInsertName = [NSString stringWithFormat:@"Google Glass"];
        toInsertInfo = [NSString stringWithFormat:@"We learned a lot about Google Glass yesterday at SXSW, including a sample of the kinds of apps it will be running when it becomes available to the public. Today on Google+, the Project Glass team let out a bit of rather important hardware info: namely that Glass is compatible with prescription glasses. Turns out that its \"design is modular, so you will be able to add frames and lenses that match your prescription.\" "];
        [self performSegueWithIdentifier: @"GiftData" sender: self];
    }
    //label 19
    else if ([textFieldVal  isEqual: @"Call of Duty Ghost"])
    {
        toInsertImage = [UIImage imageNamed:@"codg.jpg"];
        toInsertName = [NSString stringWithFormat:@"Call of Duty:Ghost\nHardened Edition\nPS4 Version"];
        toInsertInfo = [NSString stringWithFormat:@"Call of Duty: Ghosts is an extraordinary step forward for one of the largest entertainment franchises of all-time. This new chapter in the Call of Duty franchise features a new dynamic where players are on the side of a crippled nation fighting not for freedom, or liberty, but simply to survive. Fueling this all new Call of Duty experience, the franchise’s new next-gen engine delivers stunning levels of immersion and performance."];
        [self performSegueWithIdentifier: @"GiftData" sender: self];
    }
    //label 20
    else if ([textFieldVal  isEqual: @"Pair of Nike Cortez"])
    {
        toInsertImage = [UIImage imageNamed:@"nike.jpg"];
        toInsertName = [NSString stringWithFormat:@"Nike Cortez"];
        toInsertInfo = [NSString stringWithFormat:@"leather/rubber sole\nLeather upper for a comfortable, lightweight fit.\nSuede overlays on the toe box, heel and eyestay for enhanced durability and a unique style appeal.\nLow-cut collar for a natural fit and comfort around the ankle.\nFull-length EVA midsole for lightweight cushioning and impact protection."];
        [self performSegueWithIdentifier: @"GiftData" sender: self];
    }
    
    
}

//set editing control on or off
-(IBAction)onClick:(id)sender
{
    if (!charted.editing)
    {
        [charted setEditing:true animated:true];
    }
    else
    {
        [charted setEditing:false animated:true];
    }
}


@end
