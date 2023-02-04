extends Node


func make_dir(path:String, path_with_file = true) -> void:
	if(path_with_file):
		var split_path = path.split('/')
		var path_file
		for item in split_path:
			if(item.find(".") and item.length() > 2):
				path_file = item
		var only_path = path.replace(path_file, "")
		Directory.new().make_dir_recursive(only_path)
	else: Directory.new().make_dir_recursive(path)


func save_json(path:String, data:Dictionary) -> void:
	var file = File.new()
	var err = file.open(path, File.WRITE)
	if(err): 
		make_dir(path)
		err = file.open(path, File.WRITE)
	file.store_string(to_json(data))
	file.close()


func load_json(path:String) -> Dictionary:
	var file = File.new()
	file.open(path, File.READ)
	var content_as_text = file.get_as_text()
	var content_as_dictionary = parse_json(content_as_text)
	file.close()
	if(content_as_dictionary): return content_as_dictionary
	else: print("ERROR LOADING FILE: ", path)
	return {}


func diff_in_dictionery(dict1:Dictionary, dict2:Dictionary):
	for key in dict1.keys():
		if(dict1[key] != dict2[key]):
			return key
			


func ls(path, include_current_and_back = true) -> Array:
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()
	var dir_array:Array
	var path_item = dir.get_next()
	while path_item != "":
		if(
			include_current_and_back == false &&
			(path_item == "." || path_item == "..")
		): 
			path_item = dir.get_next()
			continue
		print(path_item)
		dir_array.append(path_item)
		path_item = dir.get_next()
	dir.list_dir_end()
	return dir_array
