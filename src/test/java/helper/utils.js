function(config){
config.constructPath = function(path, pathValues) {
        var pathArray = path.split('/');
        var pathValueIndex = 0;

        // Convert input pathValues to list to handle case where only string is input instead of list
        if (!Array.isArray(pathValues)) {
            pathValues = [].concat(pathValues);
        }

        for (var x in pathArray) {
            if (pathArray[x].startsWith('{') && pathArray[x].endsWith('}')) {
                pathArray[x] = pathValues[pathValueIndex];
                pathValueIndex ++;
            }
        }

        return pathArray.join('/');
    }
    return config;
 }
