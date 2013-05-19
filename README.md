![simplot 2D](http://www.scribegriff.com/dartlang/github/simplot/simplot-logo.png)

# Simplot #

## A simple, 2D HTML canvas plotting library for drawing graphs in a browser window. ##

Supports a variety of plot styles, including:

- data
- points (scatter)
- line
- line with points (default) 
- curve
- curve with points 

  
## Library Usage: ##

Add the following to your pubspec.yaml:

    convolab:
      git: git://github.com/scribeGriff/simplot.git

Then import the library to your app:

    import 'package:simplot/simplot.dart';

Besides the basic `plot()` command, a number of configurable methods are available including:

- `grid()`   
- `xlabel(String xlabelName, [String labelColor])`   
- `ylabel(String ylabelName, [String labelColor])`   
- `title(String title, [String titleColor])`   
- `date([bool short])`   
- `legend()`   
- `xmarker(num xval, [bool annotate])`
- `ymarker()`   
- `save()`

There is also a top level function `saveAll()` that saves all currently drawn plots to a PNG file.  An example of saving a quad layout of plots is shown below:

![simplot: built with dartlang](http://www.scribegriff.com/dartlang/github/simplot/simplot-quad-ex.png)

