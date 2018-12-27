extends Sprite


var is_dissolve = false
var dissolve_value = 0
var dissolve_time = 3

func _ready():
    pass

func _process(delta):
    if is_dissolve:
        dissolve_value += delta
        var value = dissolve_value / dissolve_time
        material.set_shader_param("dissolve", value)
        if value >= 1.0: # over
            print('Dissolve over,remove node here')
            is_dissolve = false
            queue_free()

func dissolve(time):
    if time > 0:
        dissolve_time = time
    dissolve_value = 0
    is_dissolve = true
    