require 'bundler/setup'
Bundler.require

require 'uri'

DB = Sequel.connect("sqlite://db/quiz.db")

Sequel.extension :migration
