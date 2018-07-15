package arm.node;

@:keep class PlayerControll extends armory.logicnode.LogicTree {

	public function new() { super(); notifyOnAdd(add); }

	override public function add() {
		var _SetCameraFOV_001 = new armory.logicnode.SetCameraFovNode(this);
		var _OnKeyboard_001 = new armory.logicnode.OnKeyboardNode(this);
		_OnKeyboard_001.property0 = "Started";
		_OnKeyboard_001.property1 = "up";
		_OnKeyboard_001.addOutputs([_SetCameraFOV_001]);
		_SetCameraFOV_001.addInput(_OnKeyboard_001, 0);
		_SetCameraFOV_001.addInput(new armory.logicnode.ObjectNode(this, "Camera"), 0);
		var _Math_006 = new armory.logicnode.MathNode(this);
		_Math_006.property0 = "Max";
		_Math_006.property1 = "false";
		var _Math_005 = new armory.logicnode.MathNode(this);
		_Math_005.property0 = "Subtract";
		_Math_005.property1 = "false";
		var _GetCameraFOV_001 = new armory.logicnode.GetCameraFovNode(this);
		_GetCameraFOV_001.addInput(new armory.logicnode.ObjectNode(this, "Camera"), 0);
		var _Math_004 = new armory.logicnode.MathNode(this);
		_Math_004.property0 = "Add";
		_Math_004.property1 = "false";
		_Math_004.addInput(_GetCameraFOV_001, 0);
		var _Float_002 = new armory.logicnode.FloatNode(this);
		_Float_002.addInput(new armory.logicnode.FloatNode(this, 0.10000000149011612), 0);
		_Float_002.addOutputs([_Math_004, _Math_005]);
		_Math_004.addInput(_Float_002, 0);
		var _Math_007 = new armory.logicnode.MathNode(this);
		_Math_007.property0 = "Min";
		_Math_007.property1 = "false";
		_Math_007.addInput(_Math_004, 0);
		_Math_007.addInput(new armory.logicnode.FloatNode(this, 1.5), 0);
		var _SetCameraFOV = new armory.logicnode.SetCameraFovNode(this);
		var _OnKeyboard = new armory.logicnode.OnKeyboardNode(this);
		_OnKeyboard.property0 = "Started";
		_OnKeyboard.property1 = "down";
		_OnKeyboard.addOutputs([_SetCameraFOV]);
		_SetCameraFOV.addInput(_OnKeyboard, 0);
		_SetCameraFOV.addInput(new armory.logicnode.ObjectNode(this, "Camera"), 0);
		_SetCameraFOV.addInput(_Math_007, 0);
		_SetCameraFOV.addOutputs([new armory.logicnode.NullNode(this)]);
		_Math_007.addOutputs([_SetCameraFOV]);
		_Math_004.addOutputs([_Math_007]);
		_GetCameraFOV_001.addOutputs([_Math_005, _Math_004]);
		_Math_005.addInput(_GetCameraFOV_001, 0);
		_Math_005.addInput(_Float_002, 0);
		_Math_005.addOutputs([_Math_006]);
		_Math_006.addInput(_Math_005, 0);
		_Math_006.addInput(new armory.logicnode.FloatNode(this, 0.20000000298023224), 0);
		_Math_006.addOutputs([_SetCameraFOV_001]);
		_SetCameraFOV_001.addInput(_Math_006, 0);
		_SetCameraFOV_001.addOutputs([new armory.logicnode.NullNode(this)]);
		var _SetRotation = new armory.logicnode.SetRotationNode(this);
		var _OnMouse = new armory.logicnode.OnMouseNode(this);
		_OnMouse.property0 = "Moved";
		_OnMouse.property1 = "left";
		_OnMouse.addOutputs([_SetRotation]);
		_SetRotation.addInput(_OnMouse, 0);
		_SetRotation.addInput(new armory.logicnode.ObjectNode(this, ""), 0);
		var _VectorMath = new armory.logicnode.VectorMathNode(this);
		_VectorMath.property0 = "Multiply";
		var _Vector = new armory.logicnode.VectorNode(this);
		var _Math_003 = new armory.logicnode.MathNode(this);
		_Math_003.property0 = "Subtract";
		_Math_003.property1 = "false";
		var _Math_001 = new armory.logicnode.MathNode(this);
		_Math_001.property0 = "Divide";
		_Math_001.property1 = "false";
		var _SeparateXYZ_001 = new armory.logicnode.SeparateVectorNode(this);
		var _MouseCoords = new armory.logicnode.MouseCoordsNode(this);
		_MouseCoords.addOutputs([_SeparateXYZ_001]);
		_MouseCoords.addOutputs([new armory.logicnode.VectorNode(this, 0.0, 0.0, 0.0)]);
		_MouseCoords.addOutputs([new armory.logicnode.IntegerNode(this, 0)]);
		_SeparateXYZ_001.addInput(_MouseCoords, 0);
		var _Math = new armory.logicnode.MathNode(this);
		_Math.property0 = "Divide";
		_Math.property1 = "false";
		_Math.addInput(_SeparateXYZ_001, 0);
		var _WindowInfo = new armory.logicnode.WindowInfoNode(this);
		_WindowInfo.addOutputs([_Math]);
		_WindowInfo.addOutputs([_Math_001]);
		_Math.addInput(_WindowInfo, 0);
		var _Math_002 = new armory.logicnode.MathNode(this);
		_Math_002.property0 = "Subtract";
		_Math_002.property1 = "false";
		_Math_002.addInput(_Math, 0);
		_Math_002.addInput(new armory.logicnode.FloatNode(this, 0.5), 0);
		_Math_002.addOutputs([_Vector]);
		_Math.addOutputs([_Math_002]);
		_SeparateXYZ_001.addOutputs([_Math]);
		_SeparateXYZ_001.addOutputs([_Math_001]);
		_SeparateXYZ_001.addOutputs([new armory.logicnode.FloatNode(this, 0.0)]);
		_Math_001.addInput(_SeparateXYZ_001, 1);
		_Math_001.addInput(_WindowInfo, 1);
		_Math_001.addOutputs([_Math_003]);
		_Math_003.addInput(_Math_001, 0);
		_Math_003.addInput(new armory.logicnode.FloatNode(this, 0.5), 0);
		_Math_003.addOutputs([_Vector]);
		_Vector.addInput(_Math_003, 0);
		_Vector.addInput(new armory.logicnode.FloatNode(this, 0.0), 0);
		_Vector.addInput(_Math_002, 0);
		_Vector.addOutputs([_VectorMath]);
		_VectorMath.addInput(_Vector, 0);
		var _Vector_001 = new armory.logicnode.VectorNode(this);
		var _Float = new armory.logicnode.FloatNode(this);
		_Float.addInput(new armory.logicnode.FloatNode(this, 1.3999998569488525), 0);
		_Float.addOutputs([_Vector_001]);
		_Vector_001.addInput(_Float, 0);
		_Vector_001.addInput(new armory.logicnode.FloatNode(this, 2.0), 0);
		var _Float_001 = new armory.logicnode.FloatNode(this);
		_Float_001.addInput(new armory.logicnode.FloatNode(this, 1.5), 0);
		_Float_001.addOutputs([_Vector_001]);
		_Vector_001.addInput(_Float_001, 0);
		_Vector_001.addOutputs([_VectorMath]);
		_VectorMath.addInput(_Vector_001, 0);
		_VectorMath.addOutputs([_SetRotation]);
		_VectorMath.addOutputs([new armory.logicnode.FloatNode(this, 0.0)]);
		_SetRotation.addInput(_VectorMath, 0);
		_SetRotation.addOutputs([new armory.logicnode.NullNode(this)]);
		var _SetProperty_003 = new armory.logicnode.SetPropertyNode(this);
		var _OnMouse_002 = new armory.logicnode.OnMouseNode(this);
		_OnMouse_002.property0 = "Started";
		_OnMouse_002.property1 = "left";
		_OnMouse_002.addOutputs([_SetProperty_003]);
		_SetProperty_003.addInput(_OnMouse_002, 0);
		_SetProperty_003.addInput(new armory.logicnode.ObjectNode(this, "ControllBow"), 0);
		_SetProperty_003.addInput(new armory.logicnode.StringNode(this, "MouseStartedTime"), 0);
		var _Time = new armory.logicnode.TimeNode(this);
		var _Math_008 = new armory.logicnode.MathNode(this);
		_Math_008.property0 = "Subtract";
		_Math_008.property1 = "false";
		_Math_008.addInput(_Time, 0);
		var _GetProperty_002 = new armory.logicnode.GetPropertyNode(this);
		_GetProperty_002.addInput(new armory.logicnode.ObjectNode(this, "ControllBow"), 0);
		_GetProperty_002.addInput(new armory.logicnode.StringNode(this, "MouseStartedTime"), 0);
		_GetProperty_002.addOutputs([_Math_008]);
		_Math_008.addInput(_GetProperty_002, 0);
		var _Math_011 = new armory.logicnode.MathNode(this);
		_Math_011.property0 = "Multiply";
		_Math_011.property1 = "false";
		_Math_011.addInput(_Math_008, 0);
		_Math_011.addInput(new armory.logicnode.FloatNode(this, 30.0), 0);
		var _Math_012 = new armory.logicnode.MathNode(this);
		_Math_012.property0 = "Max";
		_Math_012.property1 = "false";
		_Math_012.addInput(_Math_011, 0);
		var _GetProperty_004 = new armory.logicnode.GetPropertyNode(this);
		_GetProperty_004.addInput(new armory.logicnode.ObjectNode(this, "ControllBow"), 0);
		_GetProperty_004.addInput(new armory.logicnode.StringNode(this, "MinPower"), 0);
		_GetProperty_004.addOutputs([_Math_012]);
		_Math_012.addInput(_GetProperty_004, 0);
		var _Math_009 = new armory.logicnode.MathNode(this);
		_Math_009.property0 = "Min";
		_Math_009.property1 = "false";
		_Math_009.addInput(_Math_012, 0);
		var _GetProperty_003 = new armory.logicnode.GetPropertyNode(this);
		_GetProperty_003.addInput(new armory.logicnode.ObjectNode(this, "ControllBow"), 0);
		_GetProperty_003.addInput(new armory.logicnode.StringNode(this, "MaxPower"), 0);
		_GetProperty_003.addOutputs([_Math_009]);
		_Math_009.addInput(_GetProperty_003, 0);
		var _SetProperty_002 = new armory.logicnode.SetPropertyNode(this);
		var _SetProperty_001 = new armory.logicnode.SetPropertyNode(this);
		var _Gate = new armory.logicnode.GateNode(this);
		_Gate.property0 = "Equal";
		_Gate.property1 = 9.999999747378752e-05;
		var _OnMouse_001 = new armory.logicnode.OnMouseNode(this);
		_OnMouse_001.property0 = "Released";
		_OnMouse_001.property1 = "left";
		_OnMouse_001.addOutputs([_Gate]);
		_Gate.addInput(_OnMouse_001, 0);
		var _GetProperty_001 = new armory.logicnode.GetPropertyNode(this);
		_GetProperty_001.addInput(new armory.logicnode.ObjectNode(this, "ControllBow"), 0);
		_GetProperty_001.addInput(new armory.logicnode.StringNode(this, "Fireable"), 0);
		_GetProperty_001.addOutputs([_Gate]);
		_Gate.addInput(_GetProperty_001, 0);
		var _Integer = new armory.logicnode.IntegerNode(this);
		_Integer.addInput(new armory.logicnode.IntegerNode(this, 1), 0);
		var _SetProperty = new armory.logicnode.SetPropertyNode(this);
		var _Sleep = new armory.logicnode.SleepNode(this);
		_Sleep.addInput(_SetProperty_001, 0);
		_Sleep.addInput(new armory.logicnode.FloatNode(this, 0.5), 0);
		_Sleep.addOutputs([_SetProperty]);
		_SetProperty.addInput(_Sleep, 0);
		_SetProperty.addInput(new armory.logicnode.ObjectNode(this, ""), 0);
		_SetProperty.addInput(new armory.logicnode.StringNode(this, "Fireable"), 0);
		_SetProperty.addInput(_Integer, 0);
		_SetProperty.addOutputs([new armory.logicnode.NullNode(this)]);
		_Integer.addOutputs([_Gate, _SetProperty]);
		_Gate.addInput(_Integer, 0);
		_Gate.addOutputs([_SetProperty_001]);
		_Gate.addOutputs([new armory.logicnode.NullNode(this)]);
		_SetProperty_001.addInput(_Gate, 0);
		_SetProperty_001.addInput(new armory.logicnode.ObjectNode(this, ""), 0);
		_SetProperty_001.addInput(new armory.logicnode.StringNode(this, "Fireable"), 0);
		var _Integer_001 = new armory.logicnode.IntegerNode(this);
		_Integer_001.addInput(new armory.logicnode.IntegerNode(this, 0), 0);
		_Integer_001.addOutputs([_SetProperty_001]);
		_SetProperty_001.addInput(_Integer_001, 0);
		_SetProperty_001.addOutputs([_Sleep, _SetProperty_002]);
		_SetProperty_002.addInput(_SetProperty_001, 0);
		_SetProperty_002.addInput(new armory.logicnode.ObjectNode(this, "ControllBow"), 0);
		_SetProperty_002.addInput(new armory.logicnode.StringNode(this, "FirePower"), 0);
		_SetProperty_002.addInput(_Math_009, 0);
		var _SendEvent = new armory.logicnode.SendEventNode(this);
		_SendEvent.addInput(_SetProperty_002, 0);
		_SendEvent.addInput(new armory.logicnode.StringNode(this, "Fire"), 0);
		_SendEvent.addInput(new armory.logicnode.ObjectNode(this, ""), 0);
		var _SetProperty_004 = new armory.logicnode.SetPropertyNode(this);
		_SetProperty_004.addInput(_SendEvent, 0);
		_SetProperty_004.addInput(new armory.logicnode.ObjectNode(this, "ControllBow"), 0);
		_SetProperty_004.addInput(new armory.logicnode.StringNode(this, "FirePower"), 0);
		var _Integer_002 = new armory.logicnode.IntegerNode(this);
		_Integer_002.addInput(new armory.logicnode.IntegerNode(this, 0), 0);
		_Integer_002.addOutputs([_SetProperty_004]);
		_SetProperty_004.addInput(_Integer_002, 0);
		_SetProperty_004.addOutputs([new armory.logicnode.NullNode(this)]);
		_SendEvent.addOutputs([_SetProperty_004]);
		_SetProperty_002.addOutputs([_SendEvent]);
		var _Print = new armory.logicnode.PrintNode(this);
		var _OnUpdate = new armory.logicnode.OnUpdateNode(this);
		_OnUpdate.addOutputs([_Print]);
		_Print.addInput(_OnUpdate, 0);
		_Print.addInput(_Math_009, 0);
		_Print.addOutputs([new armory.logicnode.NullNode(this)]);
		_Math_009.addOutputs([_SetProperty_002, _Print]);
		_Math_012.addOutputs([_Math_009]);
		_Math_011.addOutputs([_Math_012]);
		_Math_008.addOutputs([_Math_011]);
		_Time.addOutputs([_SetProperty_003, _Math_008]);
		_Time.addOutputs([new armory.logicnode.FloatNode(this, 0.0)]);
		_SetProperty_003.addInput(_Time, 0);
		_SetProperty_003.addOutputs([new armory.logicnode.NullNode(this)]);
	}
}