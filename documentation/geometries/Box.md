# Box
> `geometries.Box`

The Box class defines a box structure in a certain symbol.

### Hierarchy
- matlab.mixin.Heterogeneous
- handle
    - [HiddenHandle](../hiddensupers/HiddenHandle.md)
        - [CIFWriter](../definitions/CIFWriter.md)
            - [Geometry](./Geometry.md)
                - **Box**

## Constructor
> `obj = Box(fileHandle, layer, length, width, center, direction)`

Create an instance of the Box geometry

#### Inputs
- `fileHandle`: *int32* The file handle to the CIF file
- `layer`: *[Layer](../definitions/Layer.md)* The layer the geomettry uses
- `length`: *uint32* The length of the box
- `width`: *uint32* The width of the box
- `center`: *int32(1, 2)* The center of the box
- **optional** `direction`: *int32(1, 2) = [1, 0]* The direction the box is looking at, perpendicular to the width

#### Returns [Box](#box)

## Properties
### **SetPrivate** length: *uint32* The length of the box
### **SetPrivate** width: *uint32* The width of the box
### **SetPrivate** center: *int32(1, 2)* The center of the box
### **SetPrivate** direction: *int32(1, 2)* The direction the box is looking at, perpendicular to the width

## Accessors
### **set** length: *uint32*
> `obj = setLength(length)`

Set the length of the box

### **set** width: *uint32*
> `obj = setWidth(width)`

Set the width of the box

### **set** center: *int32(1, 2)*
> `obj = setCenter(center)`

Set the center of the box

### **set** direction: *int32(1, 2)*
> `obj = setDirection(direction)`

Set the direction of the box


