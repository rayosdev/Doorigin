
print('''
-----------------------
''')

var_types = [
    'String',
    'int',
    'float',
    'Array',
    'Dictionary'
]

var_types_standard_value = [
    '""',
    '0',
    '0.0'
    '[]',
    '{}'
]

for i, type in enumerate(var_types):
    print(i, type)

print('''
-----------------------
''')

var_type_index = input("Choose type: ")

var_type = ""
if var_type_index != '': 
    var_type = f''':{var_types[int(var_type_index)]}'''

print('''
-----------------------
''')

var_name = input("write var name: ")

print('''
-----------------------
''')

var_value = input("write var value: ")

print('''
-----------------------
''')

if var_value == "": var_value = 'null'
if var_type_index != '': var_value = var_types_standard_value[int(var_type_index)]

new_store_item = f'''

##
#	{var_name}
##
onready var {var_name}{var_type} = {var_value} setgetet set_{var_name}, get_{var_name}
signal on_{var_name}_change
func get_{var_name}(): return {var_name}
func set_{var_name}(new_value): 
	emit_signal("on_{var_name}_change", new_value, {var_name})
	{var_name} = new_value

'''

print(new_store_item)

# Open a file with access mode 'a'
file_object = open('Store.gd', 'a')
# Append 'hello' at the end of file
file_object.write(new_store_item)
# Close the file
file_object.close()