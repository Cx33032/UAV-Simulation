import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;

import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.core.*;
import de.fhpotsdam.unfolding.mapdisplay.*;
import de.fhpotsdam.unfolding.marker.*;
import de.fhpotsdam.unfolding.providers.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.unfolding.geo.*;


class Test extends PApplet{
    UnfoldingMap map;

    void setup() {
        size(800, 600, P2D);
        map = new UnfoldingMap(this, new Google.GoogleMapProvider());
        MapUtils.createDefaultEventDispatcher(this, map);
    }

    void draw() {
        background(255);
        map.draw();
    }
}