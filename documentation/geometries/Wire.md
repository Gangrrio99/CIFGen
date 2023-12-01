# Wire
> `geometries.Wire`

The Wire class defines a wire structure in a certain layer

### Hierarchy
- matlab.mixin.Heterogeneous
- handle
    - [HiddenHandle](../hiddensupers/HiddenHandle.md)
        - [CIFWriter](../definitions/CIFWriter.md)
            - [Geometry](./Geometry.md)
                - **Wire**

## Constructor
> `obj = Wire(fileHandle, layer, initialXYs)`

Create an instance of the Wire geometry

#### Inputs
- `fileHandle` *int32* The file handle to the CIF file
- `layer` *[Layer](../definitions/Layer.md)* The layer the geometry uses
- **optional** `initialXYs` *int32(:, 2) = []* Optional list with x and y coordinates of the wire path

#### Returns [Wire](#wire)

## Properties
### **SetPrivate** coords: *int32(:, 2)*

## Methods
### addPoint
> `obj = obj.addPoint(pointX, pointY)`

Add a single point to the wire structure

#### Inputs
- `pointX`: *int32(1, 1)* The x coordinate of the point
- `pointY`: *int32(1, 1)* The y coordinate of the point

#### Returns [self](#wire)

### addPoints
> `obj = obj.addPoints(pointsX, pointsY)`

Add multiple points to the wire structure

#### Inputs
- `pointsX`: *int32(1, 1)* The x coordinates of the points
- `pointsY`: *int32(1, 1)* The y coordinates of the points

#### Returns [self](#wire)

### clearPoints
> `obj = obj.clearPoints()`

Clear all the points in the wire

#### Inputs

#### Returns [self](#wire)
