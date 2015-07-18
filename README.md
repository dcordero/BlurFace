BlurFace
========

BlurFace is a swift component that allows to blur faces in an UIImage quite easily.

![](Preview.gif)

Usage
=====

BlurFace is available using CocoaPods

```
pod 'BlurFace', :git => 'https://github.com/dcordero/BlurFace.git' 
```

TODO: Send it to CocoaPods Specs

Available methods
=================

`public func hasFaces() -> Bool`

Check whether the image contains any faces

`public func blurFaces() -> UIImage`

Returns a new image blurring all the faces in the original image
