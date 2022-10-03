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


<p align="center">
  <img width="550" height="585" src="https://user-images.githubusercontent.com/94297285/193527601-f0833a72-d6f1-4499-b73d-ae33d470be7d.png">
</p>

<p align="center">
  <img width="550" height="585" src="https://user-images.githubusercontent.com/94297285/193527610-de2c00b9-094d-4af7-98aa-fd1f5064bd59.png">
</p>

