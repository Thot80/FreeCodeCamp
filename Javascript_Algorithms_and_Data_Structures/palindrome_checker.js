function palindrome(str) {


  let rafinedStr = str.replace(/[^a-zA-Z0-9]/g,'').toLowerCase();
  let strLength = rafinedStr.length;
  let leftArray = [];
  let rightArray = [];
  let boolArray = [];
  if(strLength % 2 == 0){
    for(let i = 0; i < strLength/2; i++){
    leftArray.push(rafinedStr[i]);
    }
    for(let i = strLength -1 ; i >= strLength /2; i--){
    rightArray.push(rafinedStr[i]);
    }
  }else{

    for(let i = 0; i < strLength/2 - 0.5; i++){
    leftArray.push(rafinedStr[i]);
    }
    for(let i = strLength - 1; i > strLength/2 -0.5; i--){
    rightArray.push(rafinedStr[i]);
    }
  }

  for(let i = 0; i < leftArray.length; i++){
    boolArray.push( leftArray[i] === rightArray[i]);
  }
  console.log(str)
  console.log(rafinedStr);
  console.log(leftArray)
  console.log(rightArray)
  console.log(boolArray)
  return boolArray.every(element => element == true);
}

palindrome("eye");