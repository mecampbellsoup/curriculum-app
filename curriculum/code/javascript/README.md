# Javascript Code Quizzes

This is a javascript clone of the ruby code quizzes using [Jasmine](http://pivotal.github.io/jasmine/) for testing.

## What's Included

The JCQ contains an instance of Jasmine Standalone (v1.3.1) as well as a folder that contains beginner, intermediate, and advaned quizzes. Each quiz is made up of 3 files: a question, a solution, and a spec.

```
-- jasmine-standalone-1.3.1
  + -- lib
  + -- spec
  + -- src
-- quizzes
  + -- beginner
    + -- Dice
       -- Dice.js
       -- DiceSolution.js
       -- DiceSpec.js 
  + -- intermediate
  + -- advanced
```

## Instructions

1. Drop the question and solution javascript files into the `lib` folder in the Jasmine directory.

2. Drop the spec file into the `spec` folder.

3. Open `SpecRunner.html` in a browser of your choice. We recommend a recent version of [Chrome](https://www.google.com/intl/en/chrome/browser/) or [Firefox](http://www.mozilla.org/en-US/firefox/new/).

   When you open this file, you should see that all the tests for the solution pass, and all the tests for the question fail.

4. Open the question javascript file in a text-editor of your choosing. We recommend [Sublime Text](http://www.sublimetext.com/).

5. Based on the instructions in the question file and the steps in the spec, fill in the code that causes all the tests to pass.

6. Compare your code to the solution file.
