describe( "Dice#roll", function() {
  dice = new Dice();

  it("should return an number", function() {
    expect(typeof dice.roll()).toBe("number")
  });      

  it("should return a number greater than 0", function() {
    expect(dice.roll()).toBeGreaterThan(0)
  });  

  it("should return a number less than 7", function() {
    expect(dice.roll()).toBeLessThan(7)
  });  
});
