from bpy.types import Node
from arm.logicnode.arm_nodes import *
import arm.nodes_logic

class RemoveRigidBodyNode(Node, ArmLogicTreeNode):
    '''Add Remove Rigid Body node'''
    bl_idname = 'LNRemoveRigidBodyNode'
    bl_label = 'Remove Rigid Body'
    bl_icon = 'GAME'

    def init(self, context):
        self.inputs.new('ArmNodeSocketAction', 'In')
        self.inputs.new('ArmNodeSocketObject', "Object")
        self.outputs.new('ArmNodeSocketAction', 'Out')

class CanvasGetTextNode(Node, ArmLogicTreeNode):
    '''Add Canvas Get Text node'''
    bl_idname = 'LNCanvasGetTextNode'
    bl_label = 'Canvas Get Text'
    bl_icon = 'GAME'
    
    def init(self, context):
        self.inputs.new('NodeSocketString', 'Element')
        self.outputs.new('NodeSocketString', 'Text')

class CanvasSetTransformNode(Node, ArmLogicTreeNode):
    '''Add Canvas Set Transform node'''
    bl_idname = 'LNCanvasSetTransformNode'
    bl_label = 'Canvas Set Transform'
    bl_icon = 'GAME'

    def init(self, context):
        self.inputs.new('ArmNodeSocketAction', 'In')
        self.inputs.new('NodeSocketString', 'Element')
        self.inputs.new('NodeSocketFloat', 'X')
        self.inputs.new('NodeSocketFloat', 'Y')
        self.inputs.new('NodeSocketFloat', 'Rotation')
        self.outputs.new('ArmNodeSocketAction', 'Out')

class CanvasGetTransformNode(Node, ArmLogicTreeNode):
    '''Add Canvas Get Transform node'''
    bl_idname = 'LNCanvasGetTransformNode'
    bl_label = 'Canvas Get Transform'
    bl_icon = 'GAME'

    def init(self, context):
        self.inputs.new('NodeSocketString', 'Element')
        self.outputs.new('NodeSocketFloat', 'X')
        self.outputs.new('NodeSocketFloat', 'Y')
        self.outputs.new('NodeSocketFloat', 'Rotation')

class ChooseEventNode(Node, ArmLogicTreeNode):
    '''Add Choose Event node'''
    bl_idname = 'LNChooseEventNode'
    bl_label = 'Choose Event'
    bl_icon = 'GAME'

    def init(self, context):
        self.inputs.new('NodeSocketInt', 'Choice')
        self.inputs.new('NodeSocketAction', 'Default')
        self.outputs.new('NodeSocketAction', 'Out')

    def draw_buttons(self, context, layout):
        row = layout.row(align=True)

        op = row.operator('arm.node_add_input', text='New', icon='PLUS', emboss=True)
        op.node_index = str(id(self))
        op.socket_type = 'ArmNodeSocketAction'
        op2 = row.operator('arm.node_remove_input', text='', icon='X', emboss=True)
        op2.node_index = str(id(self))

def register():
    # Add custom nodes
    add_node(RemoveRigidBodyNode, category='Physics')
    add_node(CanvasGetTextNode, category='Canvas')
    add_node(CanvasGetTransformNode, category='Canvas')
    add_node(CanvasSetTransformNode, category='Canvas')
    add_node(ChooseEventNode, category='Logic')
    # Register newly added nodes
    arm.nodes_logic.register_nodes()
