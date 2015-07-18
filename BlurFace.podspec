Pod::Spec.new do |spec|
  spec.name 		= 'BlurFace'
  spec.summary 		= 'Blur the faces in an image'
  spec.version 		= '0.0.1'
  spec.platforms 	= :ios
  spec.platform		= :ios, "8.0"
  spec.authors 		= { 'David Cordero' => 'dcorderoramirez@gmail.com' }
  spec.homepage 	= 'https://github.com/dcordero/BlurFace'
  spec.license 		= { :type => 'MIT', :file => 'LICENSE' }
  spec.source           = { :git => "https://github.com/dcordero/BlurFace.git", :tag => spec.version }
  spec.source_files	= 'BlurFace/BlurFace/*.{swift}'
  spec.requires_arc 	= true
end
