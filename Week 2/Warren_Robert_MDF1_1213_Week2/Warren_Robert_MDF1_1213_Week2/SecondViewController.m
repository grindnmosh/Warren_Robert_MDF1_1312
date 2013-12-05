//
//  SecondViewController.m
//  Warren_Robert_MDF1_1213_Week2
//
//  Created by Robert Warren on 11/29/13.
//  Copyright (c) 2013 Robert Warren. All rights reserved.
//

#import "SecondViewController.h"
#import "TopicViewController.h"

@interface SecondViewController ()
{
    NSString *toInsertTitle;
    NSString *toInsertInfo;
    NSString *toInsertUrl;
    
}

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    
    //array of topics
    topics = [[NSMutableArray alloc] initWithObjects:
              @"Mobile Applications Security",
              @"Apple Unveils iOS 7",
              @"Augmenting Your Reality",
              @"No app for that? Write one!",
              @"JONY IVE WINS AGAIN",
              nil];
    
    //set cell height
    self->_onChart.rowHeight = 80.0f;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//set cell count
- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return [topics count];
}

//commit to the delete here.
-(void)tableView:(UITableView*)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //verify editing style
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        //remove object from UI
        [topics removeObjectAtIndex:indexPath.section];
        //remove from arrays
        [_onChart deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

//create tags and insert data
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //create tags
    static NSString *cellId = @"Test";
    schoolData = [_onChart dequeueReusableCellWithIdentifier: cellId];
    if (schoolData == nil)
    {
        schoolData = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    //load title of topic
    schoolData.textLabel.text = (NSMutableString*)[topics objectAtIndex:indexPath.row];
    return schoolData;
    //tag++;
    
}


//universal segue call to pass the custom data to detail page
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detail"])
    {
        TopicViewController *destination = segue.destinationViewController;
        destination.artName = toInsertTitle;
        destination.artInfo = toInsertInfo;
        destination.artUrl = toInsertUrl;
        
    }
}

//selected row calls
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //row 1 info
    grabData = (UITableViewCell*)[_onChart cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row  inSection:0]];
    textVal = [grabData.textLabel text];
    if ([textVal  isEqual: @"Mobile Applications Security"])
    {
        toInsertTitle = [NSString stringWithFormat:@"Mobile Applications Security."];
        toInsertInfo = [NSString stringWithFormat:@"With the proliferation of mobile devices in today's information-rich environment, the security of data at rest on the device and in transit will determine the ultimate usability of mobile devices in the defense environment. Relying on the security models provided by Apple's iOSis not enough to meet the information protection needs of the defense environment. Researchers at Southwest Research Institute® (SwRI®) are investigating the security models available for application development on iOS, the threats involved, methodologies for application-level data protection, the intersection between data security and user experience, and best practices for ensuring data security within mobile applications."];
        toInsertUrl = [NSString stringWithFormat:@"http://goo.gl/5Q8SQJ"];
        [self performSegueWithIdentifier: @"detail" sender: self];
    }
    //row 2 info
    else if ([textVal  isEqual: @"Apple Unveils iOS 7"])
    {
        toInsertTitle = [NSString stringWithFormat:@"Apple Unveils iOS 7: The 'Biggest Change to iOS' Since the iPhone's Debut."];
        toInsertInfo = [NSString stringWithFormat:@"The article discusses computer company Apple Inc. and the release of the iOS 7 mobile operating system for the company's iPhone smartphone, focusing on an analysis of the iOS 7 program and Apple Inc. chief executive officer Tim Cook's comments about the iOS product at the Worldwide Development Conference which was held in June 2013. Multitasking and the Safari Internet browser are mentioned, along with the AirDrop mobile device application and Apple Inc.'s iTunes music service."];
        toInsertUrl = [NSString stringWithFormat:@"http://goo.gl/6aVzTd"];
        [self performSegueWithIdentifier: @"detail" sender: self];
    }
    //row 3 info
    else if ([textVal  isEqual: @"Augmenting Your Reality"])
    {
        toInsertTitle = [NSString stringWithFormat:@"Augmenting Your Reality Part 2: Nuts and Bolts Edition."];
        toInsertInfo = [NSString stringWithFormat:@"The article discusses an advisory in library virtualization through augmented reality (AR). When making AR programs for library services, it is suggested that librarians, school staff, and programmers must be familiar with technology acronyms including Apple mobile operating system iOS, SDK for software development kit, and API for application programming interface. The article says that librarians can also avail AR development kits from companies including Layar and Qualcomm."];
        toInsertUrl = [NSString stringWithFormat:@"http://goo.gl/z2jMc3"];
        [self performSegueWithIdentifier: @"detail" sender: self];
    }
    //row 4 info
    else if ([textVal  isEqual: @"No app for that? Write one!"])
    {
        toInsertTitle = [NSString stringWithFormat:@"No app for that? Write one!"];
        toInsertInfo = [NSString stringWithFormat:@"The article looks at the need for more industrial engineering measurement tool applications for mobile devices, suggesting that engineers can write their own customized applications software for specific productivity uses. Particular focus is given to the development of applications for Apple Computer Inc. mobile devices using the Apple operating system iOS Software Development Kit (SDK) Xcode, including the formatting of user interfaces for various device sizes, how to apply for distribution on the product distribution platform iTunes, and application testing."];
        toInsertUrl = [NSString stringWithFormat:@"http://goo.gl/cZFgKl"];
        [self performSegueWithIdentifier: @"detail" sender: self];
    }
    //row 5 info
    else if ([textVal  isEqual: @"JONY IVE WINS AGAIN"])
    {
        toInsertTitle = [NSString stringWithFormat:@"JONY IVE WINS AGAIN."];
        toInsertInfo = [NSString stringWithFormat:@"The article presents information on the career of Jonathan Ive, a software designer at the consumer electronics company Apple, with a focus on the possibility that he may succeed Scott Forstall as chief of development for the Apple operating software iOS in 2013."];
        toInsertUrl = [NSString stringWithFormat:@"http://goo.gl/RO8o9s"];
        [self performSegueWithIdentifier: @"detail" sender: self];
    }
    
}

//set editing control on or off
-(IBAction)onClick:(id)sender
{
    if (!_onChart.editing)
    {
        [_onChart setEditing:true animated:true];
    }
    else
    {
        [_onChart setEditing:false animated:true];
    }
}


@end
