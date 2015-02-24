//
//  TalentoTableViewController.m
//  Talento
//
//  Created by Diego Andrade on 1/2/15.
//  Copyright (c) 2015 Diego Andrade. All rights reserved.
//

#import "TalentoTableViewController.h"


@interface TalentoTableViewController ()

@end

@implementation TalentoTableViewController

@synthesize fetchedResultsController = _fetchedResultsController;

-(void) addItemViewControllerDidCancel:(Item *)itemToDelete{
    NSManagedObjectContext  *context = self.managedObjectContext;
    [context deleteObject:itemToDelete];
    
       [self dismissModalViewControllerAnimated:YES];
    
}

-(void) addItemViewControllerDidSave{
    NSError *error = nil;
    NSManagedObjectContext *context = self.managedObjectContext;
    if (![context save:&error]) {
        NSLog(@"Error! %@", error);
    }
    [self dismissModalViewControllerAnimated:YES];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    //Parece que estoy anadiendo dos objectos aqui
    
    if([[segue identifier] isEqualToString:@"addItem"]){
        AddItemViewController *aivc = (AddItemViewController *) [segue destinationViewController];
        aivc.delegate = self;
        
        Item *newItem = (Item *) [NSEntityDescription insertNewObjectForEntityForName:@"Item" inManagedObjectContext:[self managedObjectContext]];
        
        aivc.currentItem = newItem;
    }
    
    /*
    
    if([[segue identifier] isEqualToString:@"showDetail"]){
        DisplayEditViewController *dvc = (DisplayEditViewController *) [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Item *selectedItem = (Item *) [self.fetchedResultsController objectAtIndexPath:indexPath];
        dvc.currentItem = selectedItem;
    }
    
    
    if([[segue identifier] isEqualToString:@"toTalentoView"])
    {
        ScoreViewController *dvc = (ScoreViewController *) [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Item *selectedItem = (Item *) [self.fetchedResultsController objectAtIndexPath:indexPath];
        dvc.currentItem = selectedItem;

        //[[segue destinationViewController] setManagedObjectContext:self.managedObjectContext];
    }
*/
    
    //[[segue destinationViewController] setManagedObjectContext:self.managedObjectContext];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.view.backgroundColor = [UIColor blueColor];
    
    
    //[self readData];
    
    
    NSError *error = nil;
    if(![[self fetchedResultsController] performFetch:&error]){
        NSLog(@"Error! %@", error);
        abort();
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return [[self.fetchedResultsController sections]count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> secInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
    return [secInfo numberOfObjects];
}


#pragma mark -
#pragma mark Fetched Results Controller Section
-(NSFetchedResultsController *) fetchedResultsController{
    if(_fetchedResultsController != nil){
        return _fetchedResultsController;
    }
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    _managedObjectContext = [appDelegate managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Item" inManagedObjectContext:[self managedObjectContext]];
    [fetchRequest setEntity:entity];
    // Specify how the fetched objects should be sorted
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"descriptionItem"
                                                                   ascending:YES];
    
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    
    _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:@"descriptionItem" cacheName:nil];
    
    _fetchedResultsController.delegate = self;
    
    return _fetchedResultsController;
   
}

-(void) controllerWillChangeContent:(NSFetchedResultsController *)controller{
    [self.tableView beginUpdates];
}

-(void) controllerDidChangeContent:(NSFetchedResultsController *)controller{
    [self.tableView endUpdates];
}

-(void) controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
    
    UITableView *tableView = self.tableView;
    
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate: {
            Item *changedItem = [self.fetchedResultsController objectAtIndexPath:indexPath];
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            cell.textLabel.text = changedItem.descriptionItem;
        }
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }

}

-(void)controller:(NSFetchedResultsController *)controller didChangeSection:(id<NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // dequeue a RecipeTableViewCell, then set its recipe to the recipe for the current row
    RecipeTableViewCell *recipeCell =
    (RecipeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"MyIdentifier" forIndexPath:indexPath];
    [self configureCell:recipeCell atIndexPath:indexPath];
    
    return recipeCell;
    
    /*UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemCell" forIndexPath:indexPath];

    
    if([self currentItem]!=nil){
        
    // Configure the cell...
    Item *item = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    //how the cell should appear
    cell.textLabel.text = item.descriptionItem;
    cell.detailTextLabel.text = @"diegol eres un capo!"; //[NSString stringWithFormat:@"%@",[self.currentItem maxScore ]];//
   
    cell.backgroundColor = [UIColor colorWithRed:0 green:0.545 blue:0.6 alpha:1];
    
   
    }
    else{
        cell.textLabel.text = @"Add an Item";
    }
     return cell;*/
}

/*-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSString *stringTemp = @"Hola";
    if ([[self.fetchedResultsController sections]count]!=0)
    {
         stringTemp=[[[self.fetchedResultsController sections]objectAtIndex:section]name];
    }
    else{
        stringTemp=@"Empty";
    }
    return stringTemp;
    
}
 */
  
-(void) readData {
    
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    _managedObjectContext = [appDelegate managedObjectContext];
    
    NSManagedObjectContext * context= self.managedObjectContext ;
   
    //NSEntityDescription * weekEntity = [NSEntityDescription entityForName:@"Week" inManagedObjectContext:context];
    
     Week *weekEntity = (Week *) [NSEntityDescription insertNewObjectForEntityForName:@"Week" inManagedObjectContext:[self managedObjectContext]];
    
    /*
    // Item *newItem = (Item *) [NSEntityDescription insertNewObjectForEntityForName:@"Item" inManagedObjectContext:[self managedObjectContext]];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:weekEntity];
    
    NSArray * weeks = [context executeFetchRequest:fetchRequest error:nil];
    
    id id_week;
    
    NSEnumerator *it = [id_week objectEnumerator];
    
    while((id_week = [it nextObject]) != nil) {
        NSLog(@"Week: %@", [weeks valueForKey:@"id_week"]);
        
        NSManagedObject * items = [weeks valueForKey:@"id_week"];
     
    }
     */
          
    
    
    
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSManagedObjectContext * context = [self managedObjectContext];
        Item *itemToDelete = [self.fetchedResultsController objectAtIndexPath:indexPath];
        [context deleteObject:itemToDelete];
        
        NSError *error = nil;
        if (![context save:&error]) {
            NSLog(@"Error! %@",error);
        }
    }
}

- (id)init
{
    self = [super initWithNibName:@"TalentoTableViewController" bundle:nil];
    if (self != nil)
    {
        // Further initialization if needed
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle
{
    NSAssert(NO, @"Initialize with -init");
    return nil;
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

