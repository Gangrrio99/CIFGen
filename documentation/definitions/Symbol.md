# Symbol
> `definitions.Symbol`

The Symbol class is used to create symbols, and the geometries in them. To create a new Symbol,
construct an instance of the [CIFFile](../CIFFile.md) class, and call the [CIFFile.createSymbol](../CIFFile.md#createsymbol) method.
To generate the contents of the Symbol, make sure that the necessary layers have been created,
and use them to call the [Symbol.createPolygon](#createpolygon), [Symbol.createBox](#createbox), [Symbol.createRoundFlash](#createroundflash),
and [Symbol.createWire](#createwire) methods, or the [Symbol.callSymbol](#callsymbol) method to insert another symbol.

### Hierarchy
- handle
    - [HiddenHandle](../hiddensupers/HiddenHandle.md)
        - [CIFWriter](./CIFWriter.md)
            - **Symbol**

## Constructor
> `obj = Symbol(fileHandle, symbolId, name, normalization)`

Create an instance of a Symbol object that is responsible for managing the information about a symbol in the CIF design.

#### Inputs
- `fileHandle`: *int32* The file handle to the CIF file
- `symbolId`: *int32* The id of the symbol
- `name`: *string* The name of the symbol
- `normalization`: *double* The factor by which the geometry is normalized, so each value filled in for lengths is normalized by this factor by the user

## Properties
### **SetPrivate** symbolId: *int32* The id of the symbol
### **SetPrivate** name: *string* The name of the symbol
### **SetPrivate** normalization: *double* The factor by which the geometry is normalized, so each value filled in for lengths is normalized by this factor by the user
### **SetPrivate** geometries: *[Geometry](../geometries/Geometry.md)(1, :)* All defined geometries in the symbol

## Methods
### callSymbol
> `obj = obj.callSymbol(symbol)`

Call a given symbol. Adds the symbol to the parent symbol and returns a new CallSymbol object to apply transformations

#### Inputs
- `symbol`: *[Symbol](#symbol)* The Symbol that should be called

#### Returns [CallSymbol](../geometries/CallSymbol.md)

### createPolygon
> `obj = obj.createPolygon(layer, initialXYs)`

Create a polygon and add it to the symbol.

#### Inputs
- `layer`: *[Layer](./Layer.md)* The layer the geometry uses
- **optional** `initialXYs`: *int32(:, 2)* Optional list with x and y coordinates of the polygon path

#### Returns [Polygon](../geometries/Polygon.md)

### createBox
> `obj = obj.createBox(layer, length, width, center, direction)`

Create a box and add it to the symbol.

#### Inputs
- `layer`: *[Layer](./Layer.md)* The layer the geometry uses
- `length`: *uint32* The length of the box
- `width`: *uint32* The width of the box
- `center`: *int32(1, 2)* The center of the box
- **optional** `direction`: *int32(1, 2) = [1, 0]* The direction the box is looking at, perpendicular to the width

#### Returns [Box](../geometries/Box.md)

### createRoundFlash
> `obj = obj.createRoundFlash(layer, diameter, center)`

Create a circle and add it to the symbol

#### Inputs
- `layer` *[Layer](./Layer.md)* The layer the geometry uses
- `diameter` *uint32* The diameter of the round flash
- `center` *int32(1, 2)* The center of the round flash

#### Returns [RoundFlash](../geometries/RoundFlash.md)

### createWire
> `obj = obj.createWire(layer, initialXYs)`

Create a wire and add it to the symbol

#### Inputs
- `layer`: *[Layer](./Layer.md)* The layer the geometry uses
- `initialXYs`: *int32(:, 2) = []* Optional list with x and y coordinates of the wire path

#### Returns [Wire](../geometries/Wire.md)
