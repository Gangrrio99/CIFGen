# RoundFlash
> `geometries.Geometry`

The RoundFlash class defines a circular structure at a given position

### Hierarchy
- matlab.mixin.Heterogeneous
- handle
    - [HiddenHandle](../hiddensupers/HiddenHandle.md)
        - [CIFWriter](../definitions/CIFWriter.md)
            - [Geometry](./Geometry.md)
                - **RoundFlash**

## Constructor
> `obj = RoundFlash(fileHandle, layer, diameter, center)`

Create an instance of the RoundFlash Geometry

#### Inputs
- `fileHandle` *int32* The file handle to the CIF file
- `layer` *[Layer](../definitions/Layer.md)* The layer the geometry uses
- `diameter` *uint32(1, 1)* The diameter of the round flash
- `center` *int32*(1, 2) The center of the round flash

#### Returns [RoundFlash](#roundflash)

## Properties
### **SetPrivate** diameter: *uint32(1, 1)* The diameter of the round flash
### **SetPrivate** center: *int32(1, 2)* The center of the round flash

## Methods
### setDiameter
> `obj = obj.setDiameter(diameter)`

Set the diameter of the circle

#### Inputs
- `diameter` *uint32(1, 1)* The diameter of the round flash

#### Returns [self](#roundflash)

### setCenter
> `obj = obj.setCenter(center)`

Set the center of the circle

#### Inputs
- `center` *int32(1, 2)* The center of the round flash

#### Returns [self](#roundflash)
