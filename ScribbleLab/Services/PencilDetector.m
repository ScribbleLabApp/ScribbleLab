//
//  PencilDetector.m
//  ScribbleLab
//
//  Created by Nevio Hirani on 08.06.24.
//

#import <Foundation/Foundation.h>
#include "PencilDetector.h"

@interface PencilDetector ()

@end

@implementation PencilDetector
{
  CBCentralManager* m_centralManager;
}

- (instancetype)init
{
  self = [super init];
  if (self != nil) {
    m_centralManager = [[CBCentralManager alloc] initWithDelegate:self
                                                            queue:nil
                                                          options:nil];
  }

  return self;
}

- (void)centralManagerDidUpdateState:(CBCentralManager *)central
{
  if ([central state] == CBCentralManagerStatePoweredOn)
  {
    NSArray* myArray = [NSArray arrayWithObject:[CBUUID UUIDWithString:@"180A"]];

    NSArray* peripherals =
      [m_centralManager retrieveConnectedPeripheralsWithServices:myArray];
    for (CBPeripheral* peripheral in peripherals)
    {
        if ([[peripheral name] isEqualToString:@"Apple Pencil"])
        {
            // The Apple pencil is connected
        }
    }
  }
}

@end
