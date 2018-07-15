package armory.logicnode;

import iron.object.Object;
import iron.math.Vec4;
import armory.trait.physics.RigidBody;

class RemoveRigidBodyNode extends LogicNode {

	public function new(tree:LogicTree) {
		super(tree);
	}

	override function run() {
		var object:Object = inputs[1].get();
		
		if (object == null) return;

#if arm_physics
		var rb:RigidBody = object.getTrait(RigidBody);
		if (rb != null ){
			rb.remove();
		}	
#end

		super.run();
	}
}
