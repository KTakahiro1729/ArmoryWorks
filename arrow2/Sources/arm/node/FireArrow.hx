package arm.node;

@:keep class FireArrow extends armory.logicnode.LogicTree {

	public function new() { super(); notifyOnAdd(add); }

	override public function add() {
		var _SetProperty = new armory.logicnode.SetPropertyNode(this);
		var _ApplyImpulse = new armory.logicnode.ApplyImpulseNode(this);
		var _SpawnObject = new armory.logicnode.SpawnObjectNode(this);
		var _Gate = new armory.logicnode.GateNode(this);
		_Gate.property0 = "Equal";
		_Gate.property1 = 9.999999747378752e-05;
		var _OnEvent = new armory.logicnode.OnEventNode(this);
		_OnEvent.property0 = "Fire";
		_OnEvent.addOutputs([_Gate]);
		_Gate.addInput(_OnEvent, 0);
		_Gate.addInput(new armory.logicnode.NullNode(this), 0);
		_Gate.addInput(new armory.logicnode.NullNode(this), 0);
		_Gate.addOutputs([_SpawnObject]);
		_Gate.addOutputs([new armory.logicnode.NullNode(this)]);
		_SpawnObject.addInput(_Gate, 0);
		_SpawnObject.addInput(new armory.logicnode.ObjectNode(this, "ControllArrow"), 0);
		var _GetTransform = new armory.logicnode.GetTransformNode(this);
		var _GetChild = new armory.logicnode.GetChildNode(this);
		_GetChild.property0 = "Starts With";
		_GetChild.addInput(new armory.logicnode.ObjectNode(this, ""), 0);
		var _String = new armory.logicnode.StringNode(this);
		_String.addInput(new armory.logicnode.StringNode(this, "SpawnLocArrow"), 0);
		_String.addOutputs([_GetChild]);
		_GetChild.addInput(_String, 0);
		var _GetTransform_001 = new armory.logicnode.GetTransformNode(this);
		_GetTransform_001.addInput(_GetChild, 0);
		var _VectorFromTransform = new armory.logicnode.VectorFromTransformNode(this);
		_VectorFromTransform.property0 = "Look";
		_VectorFromTransform.addInput(_GetTransform_001, 0);
		var _VectorMath = new armory.logicnode.VectorMathNode(this);
		_VectorMath.property0 = "Multiply";
		_VectorMath.addInput(_VectorFromTransform, 0);
		var _Vector = new armory.logicnode.VectorNode(this);
		var _GetProperty = new armory.logicnode.GetPropertyNode(this);
		_GetProperty.addInput(new armory.logicnode.ObjectNode(this, "ControllBow"), 0);
		_GetProperty.addInput(new armory.logicnode.StringNode(this, "FirePower"), 0);
		_GetProperty.addOutputs([_Vector, _Vector, _Vector]);
		_Vector.addInput(_GetProperty, 0);
		_Vector.addInput(_GetProperty, 0);
		_Vector.addInput(_GetProperty, 0);
		_Vector.addOutputs([_VectorMath]);
		_VectorMath.addInput(_Vector, 0);
		_VectorMath.addOutputs([_ApplyImpulse]);
		_VectorMath.addOutputs([new armory.logicnode.FloatNode(this, 0.0)]);
		_VectorFromTransform.addOutputs([_VectorMath]);
		_GetTransform_001.addOutputs([_VectorFromTransform]);
		_GetChild.addOutputs([_GetTransform, _GetTransform_001]);
		_GetTransform.addInput(_GetChild, 0);
		_GetTransform.addOutputs([_SpawnObject]);
		_SpawnObject.addInput(_GetTransform, 0);
		_SpawnObject.addOutputs([_ApplyImpulse]);
		_SpawnObject.addOutputs([_ApplyImpulse]);
		_ApplyImpulse.addInput(_SpawnObject, 0);
		_ApplyImpulse.addInput(_SpawnObject, 1);
		_ApplyImpulse.addInput(_VectorMath, 0);
		_ApplyImpulse.addOutputs([_SetProperty]);
		_SetProperty.addInput(_ApplyImpulse, 0);
		_SetProperty.addInput(new armory.logicnode.ObjectNode(this, "ControllBow"), 0);
		_SetProperty.addInput(new armory.logicnode.StringNode(this, "FirePower"), 0);
		var _GetProperty_001 = new armory.logicnode.GetPropertyNode(this);
		_GetProperty_001.addInput(new armory.logicnode.ObjectNode(this, "ControllBow"), 0);
		_GetProperty_001.addInput(new armory.logicnode.StringNode(this, "MinPower"), 0);
		_GetProperty_001.addOutputs([_SetProperty]);
		_SetProperty.addInput(_GetProperty_001, 0);
		_SetProperty.addOutputs([new armory.logicnode.NullNode(this)]);
	}
}
