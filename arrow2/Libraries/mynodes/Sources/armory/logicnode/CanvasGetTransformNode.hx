package armory.logicnode;

import iron.Scene;
import armory.trait.internal.CanvasScript;

class CanvasGetTransformNode extends LogicNode {

	var canvas:CanvasScript;
	var element:String;

	public function new(tree:LogicTree) {
		super(tree);
	}

#if arm_ui

  override function get(from:Int):Dynamic {
    element = inputs[0].get();
    canvas = Scene.active.getTrait(CanvasScript);
    if (canvas == null) canvas = Scene.active.camera.getTrait(CanvasScript);
		
		switch (from) {
		case 0:
			return canvas.getElement(element).x;
    case 1: 
			return canvas.getElement(element).y;
		case 2:
			return canvas.getElement(element).rotation;
		}
		return null;
  }

#end
}
