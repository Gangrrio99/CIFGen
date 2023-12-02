# CIFGen
MATLAB Package for generating CIF files

## Installation
This packages makes use of the Matlab Package Manager ([mpm](https://github.com/Gangrrio99/mpm)) to manage and install the package. 

### Using the package with mpm
**Currently, classes are not fully supported by mpm, for now, it is advised to use the 'Using the package without mpm' method**
1. Clone the repository
2. Link the package to your mpm library
  - Go into the repository
  - Call `mpm link`
3. Install the package to your own project
  - Create and navigate into a new folder
  - Initialize the mpm project using `mpm init`
  - Install the package using `mpm install CIFGen`
  - All files will be located in the `packages` package in matlab

### Using the package without mpm
1. Clone the repository
2. Either copy the files to your project, or add the folder to your path using `addpath`

## Usage of CIFGen
CIFGen is an object oriented based library to generate CIF files from within MATLAB. The code has been written with the goal of ease of use by multiple people, 
simple maintance, and the possibility to add more functionality without the need to change a lot of the source code.

One of the biggest issues in working with CIF, is keeping track of the IDs used for the different symbols. If one engineer adds a new symbol without informing the other, 
this might lead to the same symbol being used twice. The same is the case with layers used in the design. To get rid of this, the library is inspired by a Factory design pattern. Instead of creating instances of different classes yourself, methods are called in, for example, the [CFIFile](./documentation/CIFFile.md) class, which will create either a layer or symbol for you. The class will also assign a unique ID to the new layer or symbol, ensuring that no IDs will be reused.

### Documentation
Although the use of the library is not very complicated as will be visible in the example below, there has been made [documentation](./documentation/documentation.md) for all classes in the library.

### Example
Let's write a very basic design, with no particular use, just to show all features in the software. The left side of the table shows the source code, and the right side the generated .cif code. 

Since all functionality is wrapped within the data you are working with, it is very easy to pass on different design steps to other engineers, who can then write the functionality in their own functions. All you have to do, is pass an instance of the generated .cif file, and they are good to go.

<table>
<tr>
<th>CIFGen</th>
<th>.cif</th>
</tr>
<tr>
<td>

```matlab
% Create a new .cif file
cif = CIFFile("./design.cif");

% Add optional comments explaining your design. This method can be called on each class in this library
cif.addComment("Example .cif design using CIFGen");

%% Create three layers
l1 = cif.createLayer("Layer 1");
% Only change the fillcolor after initialization
l1.setFillColor(0, 255, 0);         
% Change the fill style after initialization
l1.setFillStyle("Horizontal");

% Change the fill style and fill color during intialization 
% (no "outlineColor" specified, so the outline color will be the same)
l2 = cif.createLayer("Layer 2", ...
    "fillColor", [255, 0, 0], "fillStyle", "DiagonalRight");

% Create a layer with default color and style settings (black and solid)
l3 = cif.createLayer("Layer 3");

%% Create symbols
% Create our first symbol
s1 = cif.createSymbol("Symbol 1", 1e-9); % Symbol's unit is 1nm
s1.addComment("Our first symbol!");

% Draw a box using layer 1, of 20 by 20, located at [0,0]
s1.createBox(l1, 20, 20, [0, 0]);
% Create a polygon using layer one. Notice that the layer 
% call will only be printed once in the output, as the polygon 
% uses the same layer as the aforementioned box.
poly = s1.createPolygon(l1);
poly.addPoints(...
    [-10, -5, 5, 10, 5, -5], ...  % x coordinates
    [0, 5, 10, 5, -5, -10] ...    % y coordinates
    );

% Create a second symbol
s2 = cif.createSymbol("Symbol 2", 1e-9);
s2.createBox(l2, 40, 40, [0,0]);
% The next box uses a different layer, so we have multiple 
% layer calls in the output
s2.createBox(l1, 60, 60, [0,0]);

% Let's perform a symbol call! 
% Here, we include symbol 1 in symbol 2
sCall = s2.callSymbol(s1);
% Transform the symbol call. You can chain any method call in the library!
sCall.transform(0,0).mirror("X").rotate(-3, 1);

% Let's write the file!
cif.printFile();
```

</td>
<td>

```lisp
(CIF generated by CIFGen v1.0.0 - Daan Roos (2023));
(Example .cif design using CIFGen);
(Layer definitions);
L L1; (CleWin: 1 Layer 1/0000FF00 00000000);
L L2; (CleWin: 2 Layer 2/03FF0000 03FF0000);
L L3; (CleWin: 3 Layer 3/0F000000 0F000000);
(Symbol definitions);
(Our first symbol!);
DS1 1 10;
9 Symbol_1;
L L1;
B 20 20 0 0 1 0;
P -10 0 -5 5 5 10 10 5 5 -5 -5 -10;
DF;
DS2 1 10;
9 Symbol_2;
L L2;
B 40 40 0 0 1 0;
L L1;
B 60 60 0 0 1 0;
C1 T 0 0 M X R -3 1;
DF;
E;

```

</td>
</tr>
</table>
