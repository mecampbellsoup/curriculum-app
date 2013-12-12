describe( "#is_between", function() {
  it("should return true if the number is between the two numbers", function() {
    expect(is_between(15, 12, 18)).toBe(true);
  });      

  it("should return false if the number is not between the two numbers", function() {
    expect(is_between(5, 12, 18)).toBe(false);
  });   
});
