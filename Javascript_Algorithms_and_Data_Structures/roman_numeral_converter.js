function convertToRoman(num) {
  

    let result = '';
    let reste = 0;
    let quot = 0; 
    do {
      if(num >= 1000){
        quot = Math.floor(num/1000);
        reste = num % 1000;
        for(let i = 0; i < quot; i++){
          result += 'M';
        }
        num = reste;
      }
      else if (num >= 900){
        result += 'CM';
        reste = num - 900;
        num = reste;
      }
      else if(num >= 500){
        quot = Math.floor(num/500);
        reste = num % 500;
        for(let i = 0; i < quot; i++){
          result += 'D';
        }
        num = reste;
      }
      else if (num >= 400){
        result += 'CD';
        reste = num - 400;
        num = reste;
      }
      else if(num >= 100){
        quot = Math.floor(num/100);
        reste = num % 100;
        for(let i = 0; i < quot; i++){
          result += 'C';
        }
        num = reste;
      }
      else if (num >= 90){
        result += 'XC';
        reste = num - 90;
        num = reste;
      }
      else if(num >= 50){
        quot = Math.floor(num/50);
        reste = num % 50;
        for(let i = 0; i < quot; i++){
          result += 'L';
        }
        num = reste;
      }else if (num >= 40){
        result += 'XL';
        reste = num - 40;
        num = reste;
      }
      else if(num >= 10){
        quot = Math.floor(num/10);
        reste = num % 10;
        for(let i = 0; i < quot; i++){
          result += 'X';
        }
        num = reste;
      }
      else if(num == 9){
        result += 'IX';
        reste = 0;
      }
      else if(num >= 5){
        quot = Math.floor(num/5);
        reste = num % 5;
        for(let i = 0; i < quot; i++){
          result += 'V';
        }
        num = reste;
      }
      else if(num == 4){
        result += 'IV';
        reste = 0;
      }
      else {
        for(let i = 0; i < num; i++){
          result += 'I';
        }
        reste = 0;
      }
    } while(reste !== 0)
    console.log(result) 
     return result;
    }
    convertToRoman(44);