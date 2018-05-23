var nunit = require("nunit");
var test = new nunit.Test("Test Hello Node!");
test.myTest = function(assert){
    assert.equals("hello Node!", "hello " + "Node" + "!");
  };

test.myTest2 = function(assert){
    assert.isTrue(true);
};

test.myTest3 = function(assert){
    assert.isTrue(false);
};

nunit.execute();