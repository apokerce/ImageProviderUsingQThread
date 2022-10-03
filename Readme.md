# Qt to Qml Image Provider
This documentation is prepared to give an example on how to send the frames on Qt side to the qml.



## Version
  - Desktop Qt 5.15.2 GCC 64 bit
  - OpenCV 4.6.0


## Explanation
```shell
There is not a direct connection to extract image frames in qml so Qt is 
providing a class called QQuickImageProvider. By inhering from this class
and overriding the methods we create a class to send the frames to qml.
```

