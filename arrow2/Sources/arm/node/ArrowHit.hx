package arm.node;

@:keep class ArrowHit extends armory.logicnode.LogicTree {

	public function new() { super(); notifyOnAdd(add); }

	override public function add() {
		var _SetParent = new armory.logicnode.SetParentNode(this);
		var _RemoveRigidBody = new armory.logicnode.RemoveRigidBodyNode(this);
		var _OnContact = new armory.logicnode.OnContactNode(this);
		_OnContact.property0 = "Begin";
		_OnContact.addInput(new armory.logicnode.ObjectNode(this, ""), 0);
		_OnContact.addInput(new armory.logicnode.ObjectNode(this, "CollisionTarget"), 0);
		var _Sleep = new armory.logicnode.SleepNode(this);
		_Sleep.addInput(_OnContact, 0);
		_Sleep.addInput(new armory.logicnode.FloatNode(this, 2.0), 0);
		var _RemoveObject = new armory.logicnode.RemoveObjectNode(this);
		_RemoveObject.addInput(_Sleep, 0);
		_RemoveObject.addInput(new armory.logicnode.ObjectNode(this, ""), 0);
		_RemoveObject.addOutputs([new armory.logicnode.NullNode(this)]);
		_Sleep.addOutputs([_RemoveObject]);
		var _SetProperty = new armory.logicnode.SetPropertyNode(this);
		_SetProperty.addInput(_OnContact, 0);
		_SetProperty.addInput(new armory.logicnode.ObjectNode(this, "ControllTarget"), 0);
		_SetProperty.addInput(new armory.logicnode.StringNode(this, "HitCounter"), 0);
		var _Math_001 = new armory.logicnode.MathNode(this);
		_Math_001.property0 = "Add";
		_Math_001.property1 = "false";
		var _GetProperty = new armory.logicnode.GetPropertyNode(this);
		_GetProperty.addInput(new armory.logicnode.ObjectNode(this, "ControllTarget"), 0);
		_GetProperty.addInput(new armory.logicnode.StringNode(this, "HitCounter"), 0);
		_GetProperty.addOutputs([_Math_001]);
		_Math_001.addInput(_GetProperty, 0);
		_Math_001.addInput(new armory.logicnode.FloatNode(this, 1.0), 0);
		_Math_001.addOutputs([_SetProperty]);
		_SetProperty.addInput(_Math_001, 0);
		var _SendGlobalEvent = new armory.logicnode.SendGlobalEventNode(this);
		_SendGlobalEvent.addInput(_SetProperty, 0);
		_SendGlobalEvent.addInput(new armory.logicnode.StringNode(this, "Hit"), 0);
		_SendGlobalEvent.addOutputs([new armory.logicnode.NullNode(this)]);
		_SetProperty.addOutputs([_SendGlobalEvent]);
		_OnContact.addOutputs([_Sleep, _RemoveRigidBody, _SetProperty]);
		_RemoveRigidBody.addInput(_OnContact, 0);
		_RemoveRigidBody.addInput(new armory.logicnode.ObjectNode(this, ""), 0);
		_RemoveRigidBody.addOutputs([_SetParent]);
		_SetParent.addInput(_RemoveRigidBody, 0);
		_SetParent.addInput(new armory.logicnode.ObjectNode(this, ""), 0);
		_SetParent.addInput(new armory.logicnode.ObjectNode(this, "CollisionTarget"), 0);
		_SetParent.addOutputs([new armory.logicnode.NullNode(this)]);
		var _RemoveObject_001 = new armory.logicnode.RemoveObjectNode(this);
		var _Sleep_001 = new armory.logicnode.SleepNode(this);
		var _RemoveRigidBody_001 = new armory.logicnode.RemoveRigidBodyNode(this);
		var _OnContact_001 = new armory.logicnode.OnContactNode(this);
		_OnContact_001.property0 = "Begin";
		_OnContact_001.addInput(new armory.logicnode.ObjectNode(this, ""), 0);
		_OnContact_001.addInput(new armory.logicnode.ObjectNode(this, "ground"), 0);
		_OnContact_001.addOutputs([_RemoveRigidBody_001]);
		_RemoveRigidBody_001.addInput(_OnContact_001, 0);
		_RemoveRigidBody_001.addInput(new armory.logicnode.ObjectNode(this, ""), 0);
		_RemoveRigidBody_001.addOutputs([_Sleep_001]);
		_Sleep_001.addInput(_RemoveRigidBody_001, 0);
		_Sleep_001.addInput(new armory.logicnode.FloatNode(this, 5.0), 0);
		_Sleep_001.addOutputs([_RemoveObject_001]);
		_RemoveObject_001.addInput(_Sleep_001, 0);
		_RemoveObject_001.addInput(new armory.logicnode.ObjectNode(this, ""), 0);
		_RemoveObject_001.addOutputs([new armory.logicnode.NullNode(this)]);
	}
}
