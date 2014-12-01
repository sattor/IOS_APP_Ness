//
//  HomeModel.m
//  CONEBU Mobile App
//
//  Created by Alberto Ramos on 29/11/14.
//  Copyright (c) 2014 Oscar Razo. All rights reserved.
//

#import "HomeModel.h"
#import "Grupos.h"
@interface HomeModel()
{
    NSMutableData *_downloadedData;
}
@end

@implementation HomeModel
- (void)downloadItems
{
    NSString *matricula = [[NSUserDefaults standardUserDefaults] objectForKey:@"matricula"];
    NSLog(@"username retrieved = %@", matricula);
    NSString * formato_celda = [NSString stringWithFormat:@"http://192.168.0.107:8080/WebService/IOS_Grupos.php?Matricula_Docente=%@",matricula];

    // Download the json file
    NSURL *jsonFileUrl = [NSURL URLWithString:@"http://localhost/webservice/index.php"];
    
    // Create the request
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonFileUrl];
    
    // Create the NSURLConnection
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
}
#pragma mark NSURLConnectionDataProtocol Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // Initialize the data object
    _downloadedData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // Append the newly downloaded data
    [_downloadedData appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Create an array to store the locations
    NSMutableArray *_Grupos = [[NSMutableArray alloc] init];
    
    // Parse the JSON that came in
    NSError *error;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:_downloadedData options:NSJSONReadingAllowFragments error:&error];
    
    // Loop through Json objects, create question objects and add them to our questions array
    for (int i = 0; i < jsonArray.count; i++)
    {
        //NSDictionary *jsonElement = jsonArray[i];
         NSArray *firstItemArray = jsonArray[i];
        // Create a new location object and set its props to JsonElement properties
        Grupos *newGrupo = [[Grupos alloc] init];
        newGrupo.Clave=firstItemArray[0];
        newGrupo.Materia=firstItemArray[1];
        newGrupo.Carrera=firstItemArray[2];
        
        // Add this question to the locations array
        [_Grupos addObject:newGrupo];
    }
    
    // Ready to notify delegate that data is ready and pass back items
    if (self.delegate)
    {
        [self.delegate itemsDownloaded:_Grupos];
    }
}

@end
