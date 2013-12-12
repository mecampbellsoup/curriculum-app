## Description

  This is a Flatiron student project. This site is a portfolio site for developers where they are able to log in using Github Authentication. In doing so, it reads and brings in personal repos where they are able to create a project. After creating a project, the developer will be able to create features about units of code, and explain the feature through code snippets, descriptions and screenshots.

## Gems and Environment 

Gem Usage
- [carrierwave](https://github.com/carrierwaveuploader/carrierwave) to upload images
- [pygments.rb](https://github.com/tmm1/pygments.rb) to highlight syntax for code snippets
- [omniauth-github](https://github.com/intridea/omniauth-github) for authorization and sigin through github
- [best_in_place](https://github.com/bernat/best_in_place) for inline field editing
- [client_side_validations](https://github.com/bcardarella/client_side_validations) for form validations
- [debugger](http://rubydoc.info/gems/debugger/1.6.1/frames) for debuggin!
- [better_errors](https://github.com/charliesome/better_errors) and [binding_of_caller](https://github.com/banister/binding_of_caller) for a nice interface for error reporting
- [therubyracer](http://rubydoc.info/gems/therubyracer/0.12.0/frames) embedding ruby in javascript
- [mail](https://github.com/mikel/mail) using this for a mail interceptor in development

## Instructions

- clone Git Gallery Repo
<pre><code>git clone git@github.com:flatiron-school/git-gallery.git</code></pre>
- bundle install
- configure your database.yml.sample file (in the config directory) to set up your databases.
- remember to rename the file and remove the .sample from the file name.
- create your database with the following command:
<pre><code>rake db:migrate</code></pre>

## Github Application Registration
- when you are signed in Github click this [link](https://github.com/settings/applications/new) and register your application to be able use the [Github API](http://developer.github.com/v3/).

![screenshot](http://i.imgur.com/crXyqME.png)

This application uses the Github API for the following purposes:
- user authentication
- user information includeing github id, username, and email
- pulls repo list and repo information

Once the account is created you will need to assign the KEY and SECRET for your app.



- start your server
<pre><code>rails s</code></pre>

