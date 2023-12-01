# Geometry
> **abstract** `geometries.Geometry`

Abstract class for defining different geometries within symbols.

### Hierarchy
- matlab.mixin.Heterogeneous
- handle
    - [HiddenHandle](../hiddensupers/HiddenHandle.md)
        - [CIFWriter](../definitions/CIFWriter.md)
            - **Geometry**
            
## Constructor
> `obj = Geometry(fileHandle, layer)`

#### Inputs
- `fileHandle`: *int32* The file handle to the CIF file
- `layer`: *[Layer](../definitions/Layer.md)* The layer the geometry uses

#### Returns [Geometry](#geometry)

## Properties
### **SetPrivate** layer: *[Layer](../definitions/Layer.md)* The layer the geometry uses

## Methods
### **abstract** printFile
> `obj = printFile(comment)`

Write the contents of the specialized class to the CIF file. Should be implemented by other classes that want to write their contents to the CIF file.

#### Inputs

#### Returns [self](#geometry)