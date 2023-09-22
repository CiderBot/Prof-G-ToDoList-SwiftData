# Prof-G-ToDoList-SwiftData
Simple To Do List iPhone app based on the ToDoList lesson from Prof John Gallaugher

This simple app is based on the tutorial from Professor John Gallaugher (https://www.youtube.com/@profgallaugher).

In his video on using SwiftData on his To Do app (https://www.youtube.com/watch?v=Z6JVLX-Bfc0&list=PL9VJ9OpT-IPSM6dFSwQCIl409gNBsqKTe&index=69), there seems to be a bug on the edit screen (DetailView).  Since Swift Data is persistent, all changes to the data on the screen is updated immediately, so the "Cancel" button does not really work.  

Apple does have a solution example, it's at https://developer.apple.com/documentation/swiftdata/adding-and-editing-persistent-data-in-your-app

This project is a combination of Prof-G's solution and the Apple documentation, plus a couple of small things that I added.

The project was build using xCode 15.0 with iOS 17.0 as target, SwiftData was select as data source during initial creation.
