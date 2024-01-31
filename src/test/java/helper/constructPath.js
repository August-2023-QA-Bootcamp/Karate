function fun(path,values){
	const paths = path.split('}');
	var modified = '';
	for(let i = 0; i < paths.length; i++){
		var p = paths[i].substring(0, paths[i].indexOf('{'));
		modified = modified + p + values[i];
	}
	return modified;
}