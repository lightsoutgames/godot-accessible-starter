extends Node

const TTS = preload("res://addons/godot-tts/godot-tts.gdns")
var tts

# Called when the node enters the scene tree for the first time.
func _ready():
    tts = TTS.new()
