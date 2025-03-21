# Restaurant App 

# Getting Started
Before setting up, make sure Ruby, Rails and Postgresql have to be installed on your computer. 

## Prerequisites
If it is not installed, go in your terminal, and follow the steps:

1. Install Homebrew

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`

2. Install Ruby

`brew install ruby`

3. Install Rails

`gem install rails`

4. Install PostgreSQL

`brew install postgresql`

## Setup

From your terminal,

1. Clone the repo and `cd` into the folder
2. Install dependencies with `bundle install`
3. Create migrations, migrate, and seed:

```
    rails db:create
    rails db:migrate
    rails db:seed
```
4. Launch the server with `rails s`

# Built With
Ruby on Rails 



