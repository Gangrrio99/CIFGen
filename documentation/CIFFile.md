# CIFFile
> `CIFFile`

The CIFFile class can be used to generate *Caltech Intermediate Format* files using matlab.
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

#### Example
This example shows how a new file is created without any content, and saved.
```matlab
% Create a new file called mask.cif
cif = CIFFile("./mask.cif");

% Write and close the file
cif.printFile();
```

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
> `obj = obj.createLayer(name, materialProperties)`

Create a new layer in the file. Using `materialProperties`, the properties of the material used by the layer can be changed. See [Material](./definitions/materials/Material.md) for more info about working with materials.

#### Inputs
- `name`: *string* The name of the layer (as used by CleWin)
- **optional** `materialProperties.fillStyle`: *[FillStyle](./definitions/materials/FillStyle.md)* The fill style of the material. Defaults to `FillStyle.Solid`
- **optional** `materialProperties.fillColor`: *uint8(1, 3)* The rgb color of the fill of the material. Defaults to `rgb(0, 0, 0)`
- **optional** `materialProperties.outlineStyle`: *[OutlineStyle](./definitions/materials/OutlineStyle.md)* The outline style of the material. Defaults to `OutlineStyle.Solid`
- **optional** `materialProperties.outlineColor`: *uint8(1, 3)* The rgb color of the outline of the material. When no outline color is provided, the same color will be used as specified for `fillColor`.

#### Example
We create a new file, and two new layers. One with default material parameters, one with new material parameters.

```matlab
% Create a new file called mask.cif
cif = CIFFile("./mask.cif");

% Create a layer with default material parameters
l1 = cif.createLayer("Layer 1");

% And a layer with new parameters (red fill color, and lines dashed as '_ _ ')
l2 = cif.createLayer("Layer 2", "fillColor", [255, 0, 0], "outlineStyle", "LDash");

% Write and close the file
cif.printFile();
```

#### Returns [Layer](./definitions/Layer.md)

### createSymbol
> `obj = obj.createSymbol(name, normalization)`

Create a new symbol in the file

#### Inputs
- `name`: *string* The name of the symbol
- `normalization`: *double* The factor by which the geometry is normalized, so each value filled in for lengths is normalized by this factor by the user

#### Example
We first create a layer to use, create a new symbol, and add a simple box (see [Symbol.createBox](./definitions/Symbol.md#createbox) for more) to this symbol.
```matlab
% Create a new file called mask.cif
cif = CIFFile("./mask.cif");

% Create a layer with default material parameters
l1 = cif.createLayer("Simple Layer");

% Create a new symbol, normalized to 1nm
s1 = cif.createSymbol("Symbol 1", 1e-9);

% Create a box of 10x15nm centered at (0,0) using the "Simple Layer"
s1.createBox(l1, 10, 15, [0, 0]);

% Write and close the file
cif.printFile();
```

#### Returns [Symbol](./definitions/Symbol.md)
