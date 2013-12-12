describe("Dog", function () {
  dog = new Dog();

  describe("#age", function() {
    it("should return an Integer", function(){
      expect(typeof dog.age).toEqual('number');
    });
  });

  describe("#age_in_years", function() {
    it("should return an Integer", function(){
      expect(typeof dog.age_in_years()).toEqual('number');
    });
  });

  describe("#age_in_days", function() {
    it("should return the dog's age in years times 365", function(){
      expect(dog.age_in_days()).toEqual(dog.age_in_years() * 365);
    });
  });

  describe("#age_in_dog_years", function() {
    it("should return the dog's age in years times 7", function(){
      expect(dog.age_in_dog_years()).toEqual(dog.age_in_years() * 7);
    });
  });

});