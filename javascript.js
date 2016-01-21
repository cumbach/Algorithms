var uniqueInOrder=function(iterable){
  var result = [iterable[0]];
  for(var i = 1; i < iterable.length; i++){
    if (iterable[i-1] !== iterable[i]){
      result.push(iterable[i]);
    }
  }
  return result;
}

var maxSequence = function(arr){
  var i = 0;
  var j;
  var max = -1;
  var holder;
  while (i < arr.length) {
    j = i+1;
    holder = arr[i];
    while (j < arr.length) {
      holder += arr[j];
      if (max < holder) {max = holder}
      j += 1;
    }
    i += 1
  }
  if (max < 0) {return 0}
  return max;
}

  // var holder;
  // while (i < arr.length) {
  //   if (arr[i] > 0) {
  //     holder = arr[i];
  //   } else {
  //     break;
  //   }
  //   j = i + 1;
  //   while (holder > 0 && j < arr.length) {
  //     holder += arr[j]
  //     j += 1;
  //   }
  //   if (holder > max) {
  //     max = holder;
  //   }
  //   i += 1
  // }

// console.log(maxSequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]))
// should be 6: [4, -1, 2, 1]

var largestDifference = function(data) {
  var i = 0;
  var j = 0;
  var max = 0;
  var gdist = 0;
  var dist;
  var diff;
  var result = [];
  while (i < data.length) {
    j = i + 1;
    while (j < data.length) {
      diff = data[j] - data[i];
      dist = j - i;
      if (diff >= 0 && dist > gdist) {
        gdist = dist;
        max += data;
        result[0] = i;
        result[1] = j;
      }

      j += 1;
    }
    i += 1;
  }

  return result.length === 0 ? 0 : result[1] - result[0]

};

function whoIsNext(names, r){
  var queue = [];
  var count = 1;
  var newArr = []
  while (count < r) {
   newArr = [names[0], names[0]]
   names.shift();
   names = names.concat(newArr);
   count += 1;
  //  console.log(names)
  }
  return names[0];
}

// whoIsNext(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 10)=="Sheldon"
// whoIsNext(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 52)=="Penny"
console.log(whoIsNext(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 7230702951)=="Leonard")
