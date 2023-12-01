# Polygon
> `geometries.Polygon`

The Polygon class defines a polygon structure in a certain layer

### Hierarchy
- matlab.mixin.Heterogeneous
- handle
    - [HiddenHandle](../hiddensupers/HiddenHandle.md)
        - [CIFWriter](../definitions/CIFWriter.md)
            - [Geometry](./Geometry.md)
                - **Polygon**

## Constructor
> `obj = Polygon(fileHandle, layer, initialXYs)`

Create an instance of the Polygon geometry

#### Inputs
- `fileHandle` *int32* The file handle to the CIF file
- `layer` *[Layer](../definitions/Layer.md)* The layer the geometry uses
- **optional** `initialXYs` *int32(:, 2) = []* Optional list with x and y coordinates of the polygon path

#### Returns [Polygon](#polygon)

## Properties
### **SetPrivate** coords: *int32(:, 2)*

## Methods
### addPoint
> `obj = obj.addPoint(pointX, pointY)`

Add a single point to the polygon structure

#### Inputs
- `pointX`: *int32(1, 1)* The x coordinate of the point
- `pointY`: *int32(1, 1)* The y coordinate of the point

#### Returns [self](#polygon)

### addPoints
> `obj = obj.addPoints(pointsX, pointsY)`

Add multiple points to the polygon structure

#### Inputs
- `pointsX`: *int32(1, 1)* The x coordinates of the points
- `pointsY`: *int32(1, 1)* The y coordinates of the points

#### Returns [self](#polygon)

### clearPoints
> `obj = obj.clearPoints()`

Clear all the points in the polygon

#### Inputs

#### Returns [self](#polygon)
