const axios = require('axios');
const expect = require('chai').expect;
const assert = require('chai').assert;
const fs = require('fs');

const mock = fs.readFileSync('test/mock.html');

const xaxis = "xaxis";
const yaxis = "yaxis";

//Get data
const rows = [
  [1548838872676, 10.295], [1548838880874, 8.707], [1548838883334, 0.042],
  [1548838887309, 0.008], [1548838904499, 0.849], [1548838908571, 8.586],
  [1548838909338, 0.737], [1548838916561, 0.042], [1548838919252, 0.025]
];

describe('Opencpu report generation', function () {

  this.timeout(10000);

  it('Attempt to generate file. Should return "Created"', function (done) {
    axios.post('https://DevoInc.ocpu.io/stan/R/render', {
      dataframe: rows,
      dimensions: [xaxis, yaxis]
    })
      .then((res) => {
        expect(res.statusText === "Created").to.be.true;
        done()
      })
  })

  it('Attempt with null dataframe. Should return error', function (done) {
    axios.post('https://DevoInc.ocpu.io/stan/R/render', {
      dataframe: null,
      dimensions: [xaxis, yaxis]
    })
      .catch((err) => {
        assert.notEqual(err, null);
        done()
      })
  })

  // it('Attempt to compare output html file with mock. Should be equal',
  //   function () {
  //     axios.post('https://DevoInc.ocpu.io/stan/R/render', {
  //       dataframe: rows,
  //       dimensions: [xaxis, yaxis]
  //     })
  //       .then((res) => {
  //         const url = `${res.headers.location}files/output.html`;
  //         axios.get(url)
  //           .then((res) => {
  //             const htmlfile = res.data;
  //             expect(htmlfile).to.equal(mock);
  //           })
  //       })
  //   })
})
