package armory.logicnode;

import iron.Scene;
import armory.trait.internal.CanvasScript;

class CanvasSetTransformNode extends LogicNode {

	var canvas:CanvasScript;
	var element:String;
	var x:Float;
	var y:Float;
	var rotation:Null<Float>;
	
		public function new(tree:LogicTree) {
			super(tree);
		}

	#if arm_ui
		function update() {
			if (!canvas.ready) return;
			tree.removeUpdate(update);

			canvas.getElement(element).x = x;
			canvas.getElement(element).y = y;
			canvas.getElement(element).rotation = rotation;
			super.run();
		}

		override function run() {
			element = inputs[1].get();
			x = inputs[2].get();
			y = inputs[3].get();
			rotation = inputs[4].get();
			canvas = Scene.active.getTrait(CanvasScript);
			if (canvas == null) canvas = Scene.active.camera.getTrait(CanvasScript);

			tree.notifyOnUpdate(update);
			update();
		}
	#end
	}