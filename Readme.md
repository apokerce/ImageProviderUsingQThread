# Qt to Qml Image Provider
This documentation is prepared to give an example on how to send the frames on Qt side to the qml. To have insight about the code one can read the comments provided in the code or refer the https://doc.qt.io/qt-6/qquickimageprovider.html
A custom menubar is added to project, one can observe and adjust according to her/him needs.



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
  <img width="550" height="585" src="https://user-images.githubusercontent.com/94297285/193598348-33d017c9-76d1-408d-9f25-792243ca6e9a.png">
</p>

<p align="center">
  <img width="550" height="585" src="https://user-images.githubusercontent.com/94297285/193598357-dc2da990-9c2f-44b2-91e0-bfc72a58ff21.png">
</p>

