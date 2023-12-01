# CallSymbol
> `geometries.CallSymbol`

The CallSymbol class allows the user to call an already existing symbol to be used in the design

### Hierarchy
- matlab.mixin.Heterogeneous
- handle
    - [HiddenHandle](../hiddensupers/HiddenHandle.md)
        - [CIFWriter](../definitions/CIFWriter.md)
            - [Geometry](./Geometry.md)
                - **CallSymbol**

## Constructor
> `obj = CallSymbol(fileHandle, symbol)`

Create an instance of the CallSymbol geometry

#### Inputs
- `fileHandle` *int32* The file handle to the CIF file
- `symbol` *[Symbol](../definitions/Symbol.md)* The Symbol that should be called

#### Returns [CallSymbol](#callsymbol)

## Properties
### **SetPrivate** symbol: *[Symbol](../definitions/Symbol.md)* The Symbol that should be called
### **SetPrivate** transformations: *[Transformation](./callSymbol/Transformation.md)(1, :)* The transformations that should be applied

## Methods
### transform
> `obj = obj.transform(toX, toY)`

Transform the symbol to a given set of coordinates

#### Inputs
- `toX`: *int32(1, 1)* The x location to transform to
- `toY`: *int32(1, 1)* The y location to transform to

#### Returns [Transform](./callSymbol/Transform.md)

### mirror
> `obj = obj.mirror(overAxis)`

Mirror the symbol over the given axis (multiplies that coordinate by -1)

#### Inputs
- `overAxis`: *string: "X" | "Y"* The axis to mirror over

#### Returns [Mirror](./callSymbol/Mirror.md)

### rotate
> `obj = obj.rotate(toX, toY)`

Rotate the symbol over to the given coordinates

#### Inputs
- `toX`: *int32(1, 1)* The x location to rotate to
- `toY`: *int32(1, 1)* The y location to rotate to

#### Returns [Rotate](./callSymbol/Rotate.md)
