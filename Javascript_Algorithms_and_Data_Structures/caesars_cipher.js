function rot13(str) {

    let mapping = {
      "N": "A",
      "O": "B",
      "P": "C",
      "Q": "D",
      "R": "E",
      "S": "F",
      "T": "G",
      "U": "H",
      "V": "I",
      "W": "J",
      "X": "K",
      "Y": "L",
      "Z": "M",
      "A": "N",
      "B": "O",
      "C": "P",
      "D": "Q",
      "E": "R",
      "F": "S",
      "G": "T",
      "H": "U",
      "I": "V",
      "J": "W",
      "K": "X",
      "L": "Y",
      "M": "Z"
    };
    return str.split('').map(element => {
      return Object.keys(mapping).includes(element) ? mapping[element] : element
      
    }).join('')
    
  }
  
  rot13("SERR PBQR PNZC");