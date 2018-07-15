package armory.logicnode;

import iron.Scene;
import armory.trait.internal.CanvasScript;

class CanvasGetTextNode extends LogicNode {

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
    return canvas.getElement(element).text;
  }

#end
}
