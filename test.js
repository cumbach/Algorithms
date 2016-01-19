var uniqueInOrder=function(iterable){
  var result = [iterable[0]];
  for(var i = 1; i < iterable.length; i++){
    if (iterable[i-1] !== iterable[i]){
      result.push(iterable[i]);
    }
  }
  return result;
}

console.log(uniqueInOrder([1,2,2,3,3]));
