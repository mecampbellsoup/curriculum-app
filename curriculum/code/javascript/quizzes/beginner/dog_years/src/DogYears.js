function Dog() {
  this.age = Math.floor((Math.random()*15)+1);
}

Dog.prototype.age_in_years = function() {
  return this.age;
}
Dog.prototype.age_in_days = function() {
  return this.age * 365;
}
Dog.prototype.age_in_dog_years = function() {
  return this.age * 7;
}