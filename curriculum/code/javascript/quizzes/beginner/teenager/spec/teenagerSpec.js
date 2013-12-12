describe( "#is_between", function() {
  it("returns false if the person is younger than 13", function() {
    expect(is_a_teenager(12)).toBe(false);
  });      

  it("returns false if the person is older than 19", function() {
    expect(is_a_teenager(20)).toBe(false);
  }); 

  it("returns true if the person is between the ages of 13 and 19", function() {
    expect(is_a_teenager(15)).toBe(true);
  });  
});
