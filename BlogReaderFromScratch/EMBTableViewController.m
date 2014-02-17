//
//  EMBTableViewController.m
//  BlogReaderFromScratch
//
//  Created by Sean Hunter on 2/11/14.
//  Copyright (c) 2014 Embaucha LLC. All rights reserved.
//

#import "EMBTableViewController.h"
#import "EMBBlogPost.h"
#import "EMBWebViewController.h"

@interface EMBTableViewController ()

@end

@implementation EMBTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *blogURL = [NSURL URLWithString:@"http://blog.teamtreehouse.com/api/get_recent_summary"];
    NSData *jsonData = [NSData dataWithContentsOfURL:blogURL];
    
//    NSLog(@"%@", jsonData);
    
    
    NSError *err = nil;
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&err];
    
    NSArray *blogPostsArray = [dataDictionary objectForKey:@"posts"];
    
    self.blogPosts = [NSMutableArray array];
    
    for (NSDictionary *bp in blogPostsArray) {
//        [self.blogPosts addObject:bp];
        
        EMBBlogPost *blogPost = [[EMBBlogPost alloc] init];
        blogPost.title = [bp objectForKey:@"title"];
        blogPost.author = [bp objectForKey:@"author"];
        blogPost.date = [bp objectForKey:@"date"];
        @try {
            blogPost.url = [NSURL URLWithString:[bp objectForKey:@"url"]];
        }
        @catch (NSException *exception) {
            NSLog(@"%@",exception);
        }
        @finally {
            //nada
            //keep calm and carry on
        }
        if ([bp objectForKey:@"thumbnail"] != [[NSNull alloc] init]) {
            @try {
                blogPost.thumbnail = [NSURL URLWithString:[bp objectForKey:@"thumbnail"]];
            }
            @catch (NSException *e) {
                NSLog(@"Exception caught. Probably an empty thumbnail URL.");
                NSLog(@"%@", e);
            }
        } else {
            NSLog(@"There was a post without a thumbnail.");
        }
        
        [self.blogPosts addObject:blogPost];
        blogPost = nil;
    }
    
    blogPostsArray = nil;
    
    
    NSDictionary *book1, *book2, *book3;
    book1 = [NSDictionary dictionaryWithObjectsAndKeys:@"Sabriel",@"title",@"Garth Nix",@"author", nil];
    book2 = [NSDictionary dictionaryWithObjectsAndKeys:@"Lirael",@"title", @"Garth Nix", @"author", nil];
    book3 = [NSDictionary dictionaryWithObjectsAndKeys:@"Abhorsen",@"title", @"Garth Nix", @"author", nil];
    
    self.books = [NSMutableArray arrayWithObjects:book1, book2, book3, nil];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
//    return [self.books count];
    return [self.blogPosts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSLog(@"Adding text to cells...");
//    cell.textLabel.text = [[self.books objectAtIndex:indexPath.row] valueForKey:@"title"];
//    cell.detailTextLabel.text = [[self.books objectAtIndex:indexPath.row] valueForKey:@"author"];
    
    NSLog(@"Checking if URL is present.");
    
    if ([[self.blogPosts objectAtIndex:indexPath.row] thumbnail] != nil) {
        NSLog(@"URL was not null.");
        cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[[self.blogPosts objectAtIndex:indexPath.row] thumbnail]]];
    } else {
        NSLog(@"URL was null.");
    }
    
    cell.textLabel.text = [[self.blogPosts objectAtIndex:indexPath.row] title];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", [[self.blogPosts objectAtIndex:indexPath.row] author], [[self.blogPosts objectAtIndex:indexPath.row] formattedDate]];
//    [cell setExclusiveTouch:YES];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

//#pragma mark - App delegate
//
//- (void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"Row %d selected.", indexPath.row);
//    UIApplication *application = [UIApplication sharedApplication];
//    [application openURL:[[self.blogPosts objectAtIndex:indexPath.row] url]];
//}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"%@",segue.identifier);
    
    if ([segue.identifier isEqualToString:@"showBlogPost"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        EMBBlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
        
        [segue.destinationViewController setBlogPostURL:blogPost.url];
    }
}

@end
