# CIFFile
> `CIFFile`

The CIFFile class can be used to generate Caltech Intermediate Format files using matlab.
To get started, all one has to do is create a new instance of this class, providing a path to a new or existing .cif file.
By using the methods in this class, layers and symbols can be created.

### Hierarchy
- handle
    - [HiddenHandle](./hiddensupers/HiddenHandle.md)
        - [CIFWriter](./definitions/CIFWriter.md)
            - **CIFFile**

## Constructor
> `obj = CIFFile(filePath)`

Create an instance of CIFFile, which creates a Caltech Intermediate Format file and can write the structure created using the instance to it.

#### Inputs
- `filePath`: *string* The path to where the .cif file should be generated

## Properties
### **private** layers: *[Layer](./definitions/Layer.md)(1, :)* The layers that are being used in the file
### **private** symbols: *[Symbol](./definitions/Symbol.md)(1, :)* The symbols that are being used in the file

## Accessors

## Methods
### delete
> `obj.delete()`

Destructor to make sure the file is closed at the end of use.

#### Inputs

### printFile
> `obj = obj.printFile()`

Write the contents of the CIFFile class and its children to the opened file.

See more in [CIFWriter.printFile](./definitions/CIFWriter.md#printFile).

#### Inputs

#### Returns self

### createLayer
> `obj = obj.createLayer(name, styling)`

Create a new layer in the file

#### Inputs
- `name`: *string* The name of the layer (as used by CleWin)
- **optional** `styling`: *string(1,2)* The optional styling of the layer, uses syntax of CleWin, will be updated later

#### Returns [Layer](./definitions/Layer.md)

### createSymbol
> `obj = obj.createSymbol(name, normalization)`

Create a new symbol in the file

#### Inputs
- `name`: *string* The name of the symbol
- `normalization`: *double* The factor by which the geometry is normalized, so each value filled in for lengths is normalized by this factor by the user

#### Returns [Symbol](./definitions/Symbol.md)
