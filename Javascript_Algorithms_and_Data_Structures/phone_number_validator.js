function telephoneCheck(str) {

    let killerRegex = /^1?(([\s\-]?\d{3}[\s\-]?)|(\s?\(\d{3}\)\s?))\d{3}[\s\-]?\d{4}$/
  
    let noOneReg = /^1[\s\-]?\d{3}[\s\-]?\d{3}[\s\-]?\d{4}/
    console.log('----------------------------------------')
    console.log(str)
    console.log(killerRegex.test(str))
    console.log('----------------------------------------')
    return killerRegex.test(str);
  }
  
  telephoneCheck("1 555-555-5555");