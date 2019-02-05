const assert = require('assert');
var should = require('should');

//require('opencpu-browser');
const axios = require('axios');

const xaxis = "xaxis";
const yaxis = "yaxis";

//Get data
const rows = [ [ 1548838872676, 10.295 ], [ 1548838880874, 8.707 ], [ 1548838883334, 0.042 ], [ 1548838887309, 0.008 ], [ 1548838904499, 0.849 ], [ 1548838908571, 8.586 ], [ 1548838909338, 0.737 ], [ 1548838916561, 0.042 ], [ 1548838919252, 0.025 ] ];

axios.post('https://DevoInc.ocpu.io/stan/R/render', {
  dataframe: rows,
  dimensions: [xaxis, yaxis]
})
    .then((res) => {
       console.log(res);
    })
    .catch((error) => {
       console.log(error);
    })


/*
function response(message, expected) {
  axios.post('https://DevoInc.ocpu.io/stan/R/render', {
    dataframe: rows,
    dimensions: [xaxis, yaxis]
  });
  assert.deepEqual(message, expected);
}


describe('opencpu call', function() {
  it('should work with an empty log register', () => {
    response([], []);
  });
});
*/