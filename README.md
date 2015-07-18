BlurFace
========

BlurFace is a swift component that allows to blur faces in an image quite easily.

![](after.png)

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

Check whether the image contains faces actually

`public func blurFaces() -> UIImage`

Returns a new image with blurring all the faces in the original image
