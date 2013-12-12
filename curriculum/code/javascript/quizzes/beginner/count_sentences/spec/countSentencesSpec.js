describe( "#is_between", function() {
  it("should return the number of sentences in a string", function() {
    expect(count_sentences("one. two. three?")).toBe(3);
  });      

  it("should return zero if there are no sentences in a string", function() {
    expect(count_sentences("")).toBe(0);
  });   
});
