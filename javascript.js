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
// console.log(whoIsNext(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 7230702951)=="Leonard")

function power(s) {
  var result = [[]];
  var i = 0;
  var j;
  var gap;
  while (i < s.length) {
    gap = 0;
    j = i;
    while (gap + j <= s.length) {
      gap = 0;
      while (j + gap <= s.length) {
        result.push(s.slice(i,j+gap))
        console.log(result)
        j += 1;
      }
      j += 1;
    }
    i += 1;
  }
  return result;
}
// power([1,2,3])

var largestDifference = function(array) {
  var mins = [];
  var max_range = 0;

  var idx = 0;
  array.forEach(function(el){
    if (mins.length === 0 || el < array[mins[mins.length-1]]) {
      mins.push(idx)
    }
    idx += 1;
  });

  var array2 = array.slice().reverse();
  idx = 0;
  var unreversed_idx;
  var current_el;

  array2.forEach(function(el){
    unreversed_idx = array.length - 1 - idx
    current_el = array[unreversed_idx]
    while (!(mins.length === 0) && current_el >= array[mins[mins.length-1]]) {
      current_range = unreversed_idx - mins[mins.length-1]
      if (current_range > max_range) {
        max_range = current_range
      }
      mins.pop();
    }
    idx += 1;
  });
  return max_range;
};
// console.log(largestDifference([9,4,1,10,3,4,0,-1,-2]))
// console.log(largestDifference([3,2,1]))

function isMerge(s, part1, part2) {


  var val = true;
  s = s.split('').filter(noSpace);
  part1 = part1.split('').filter(noSpace);
  part2 = part2.split('').filter(noSpace);
  if (part1.length + part2.length !== s.length) {return false}
  var x = part1.length-1;
  var y = part2.length-1;
  for (var i = s.length-1; i >= 0; i--) {
    if (s[i] === part1[x]) {
      x -= 1
    } else if (s[i] === part2[y]) {
      y -= 1
    } else {
      val = false;
    }
  }
  return val;
}

function noSpace(lset) {
  return lset !== ' ';
};

console.log(isMerge('Bananas from Bahamas', 'Bah  as', 'Bananas from    am'));
