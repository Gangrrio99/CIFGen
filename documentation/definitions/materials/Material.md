# Material
> `definitions.materials.Material`

Class that describes the material used by a layer, as shown in CleWin. The instance will describe the fill style, outline style, and colors used.

### Hierarchy
- handle
    - [HiddenHandle](../hiddensupers/HiddenHandle.md)
        - **Material**

## Constructor
> `obj = Material(fillStyle, outlineStyle, r, g, b)`

Create an instance of a material. By default, the fill color is the same as the background color.

#### Inputs
- `fillStyle`: *[FillStyle](./FillStyle.md)* The style of the fill of the layer
- `outlineStyle`: *[OutlineStyle](./OutlineStyle.md)* The style of the outline of the layer
- `r`: *uint8* Red value of the layer    0-255
- `g`: *uint8* Green value of the layer  0-255
- `b`: *uint8* Blue value of the layer   0-255

#### Returns [Material](#material)

## Properties
### **SetPrivate** fillStyle: *[FillStyle](./FillStyle.md)* The style of the fill of the layer 
### **SetPrivate** fillColor: *uint8(1, 3)* The color of the layer
### **SetPrivate** outlineStyle: *[OutlineStyle](./OutlineStyle.md)* The style of the outline of the layer
### **SetPrivate** outlineColor: *uint8(1, 3)* The color of the outline

## Accessors
### **set** fillStyle: *[FillStyle](./FillStyle.md)*
> `obj = setFillStyle(fillStyle)`

Set the style of the fill of the material

### **set** fillColor: *[uint32, uint32, uint32]*
> `obj = setLength(length)`

Set the color of the fill of the material

### **set** outlineStyle: *[OutlineStyle](./OutlineStyle.md)*
> `obj = setLength(length)`

Set the style of the outline of the material

### **set** outlineColor: *[uint32, uint32, uint32]*
> `obj = setLength(length)`

Set the color of the outline of the material

## Methods
### getMaterialString
> `styleStr = getMaterialString(obj)`

Convert the Material to a string to be used by CleWin. Is of the form of `abccddee abffgghh`, where: 

- `a`: the hexadecimal ID of [OutlineStyle](./OutlineStyle.md)
- `b`: the hexadecimal ID of [FillStyle](./FillStyle.md)
- `cc`: the hexadecimal conversion of the red colors in the filling
- `dd`: the hexadecimal conversion of the green colors in the filling
- `ee`: the hexadecimal conversion of the blue colors of the filling
- `ff`: the hexadecimal conversion of the red colors of the outline
- `gg`: the hexadecimal conversion of the green colors of the outline
- `hh`: the hexadecimal conversion of the blue colors of the outline

#### Inputs

#### Returns string
