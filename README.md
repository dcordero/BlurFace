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

Check whether the image contains any face

`public func blurFaces() -> UIImage`

Return a new image blurring all the faces found in the original image
