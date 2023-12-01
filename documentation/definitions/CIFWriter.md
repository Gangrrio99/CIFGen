# CIFWriter
> **abstract** `definitions.CIFWriter`

Base class for writing data to the CIF file.

### Hierarchy
- handle
    - [HiddenHandle](../hiddensupers/HiddenHandle.md)
        - **CIFWriter**

## Constructor
> `obj = CIFWriter(fileHandle)`

#### Inputs
- `fileHandle`: *int32* The handle to the file returned by `fopen`

#### Returns [CIFWriter](#cifwriter)

## Properties
### **SetPrivate, GetProtected** fileHandle: *double* File handle to the file where the CIF data should be written to
### **SetPrivate, GetProtected** comments: *string(1, :)* The comments that should be printed

## Methods
### **abstract** printFile
> `obj = printFile(comment)`

Write the contents of the specialized class to the CIF file. Should be implemented by other classes that want to write their contents to the CIF file.

#### Inputs

#### Returns [self](#cifwriter)

### addComment
> `obj = addComment(comment)`

Add a comment to the list. Will print the comment next time [CIFWriter.write](#protected-write) is called.

#### Inputs
- `comment`: *string* The comment to add to the list

#### Returns [self](#cifwriter)

### flushComments
> `obj = flushComments()`

Remove all stored comments (called automatically after calling [CIFWriter.write](#protected-write)) is called.

#### Inputs

#### Returns [self](#cifwriter)

### **protected** write
> `obj = write(line)`

Write the generated line to the CIF file

#### Inputs
- `line`: *string(1, 1)* The string to write to the file

#### Returns [self](#cifwriter)

### **protected** writeComments
> `obj = writeComments()`

Write the stored comments to the file

#### Inputs

#### Returns [self](#cifwriter)

### **protected** close
> `obj = close()`

Closes the file handle

#### Inputs

#### Returns [self](#cifwriter)
