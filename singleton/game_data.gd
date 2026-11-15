extends Node

var level_data : Array[Dictionary] = [
	{
	"level": 1,
	"completed": false
	},
	{
	"level": 2,
	"completed": false
	},
	{
	"level": 3,
	"completed": false
	},
	{
	"level": 4,
	"completed": false
	},
	{
	"level": 5,
	"completed": false
	},
]

func level_completed(level_name):
	level_data[level_name]["completed"] = true
