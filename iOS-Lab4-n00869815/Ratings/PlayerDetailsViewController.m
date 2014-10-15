//
//  PlayerDetailsViewController.m
//  Ratings
//
//  Created by Marin Todorov on 9/9/13.
//
//

#import "PlayerDetailsViewController.h"
#import "Player.h"


@interface PlayerDetailsViewController ()

@end

@implementation PlayerDetailsViewController
{
    	NSString *game;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   if (indexPath.section == 0)
    {
        [self.nameTextField becomeFirstResponder];
    }
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
	if ((self = [super initWithCoder:aDecoder]))
	{
		NSLog(@"init PlayerDetailsViewController");
		game = @"Chess";
	}
	return self;
}

- (IBAction)cancel:(id)sender
{
	[self.delegate playerDetailsViewControllerDidCancel:self];
}

- (IBAction)done:(id)sender
{
    Player *player = [[Player alloc] init];
    player.name = self.nameTextField.text;
    player.game = @"Chess";
    player.rating = 5;
    [self.delegate playerDetailsViewController:self didAddPlayer:player];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.detailLabel.text = game;
   
}



@end
