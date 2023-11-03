# Cloudwalk Challenge
> https://gist.github.com/cloudwalk-tests/76993838e65d7e0f988f40f1b1909c97

## Installation

First up, your system will need the
[prerequisites for running Ruby on Rails installed](https://guides.rubyonrails.org/getting_started.html)

## Previous Requirements (Linux / Mac OS X)
* [Ruby 3.2.2](https://www.ruby-lang.org)
* [Rails 7.1.1](http://railsinstaller.org)
* [PostgreSQL](https://www.postgresql.org/download)
* [Bundler gem](https://github.com/bundler/bundler)

Once you have these:

    # Checkout the project
    $ git clone git@github.com:rodrigovirgilio/cloudwalk_challenge.git
    $ cd cloudwalk_challenge

    # Install the project dependencies
    $ gem install bundler
    $ bundle **install**

    # Start the local web server
    $ bundle exec rails s

Or using docker:

    # Checkout the project
    $ git clone git@github.com:rodrigovirgilio/cloudwalk_challenge.git
    $ cd cloudwalk_challenge

    # Prepare container
    # On Mac use: `docker-compose`

    $ docker compose build
    $ docker compose up -d

You should then be able to navigate to http://localhost:3000 in a web browser.

## Test suite (rspec)
We provide you with a simple test by running:
```
$ docker exec -it cloudwalk_challenge-web-1 /bin/bash
> bundle exec rspec
```


# Validate the challenge

## Generate report anti-fraud:

### 1) By rake task
```ruby
  $ docker exec -it cloudwalk_challenge-web-1 /bin/bash
  $ bundle exec rails report:call
```

## Transaction management by API:

### API Create Transaction
### POST /api/v1/transactions

```bash
curl --request POST \
  --url http://localhost:3000/api/v1/transactions \
  --header 'Content-Type: application/json' \
  --data '{
"transaction_id" : 2342357,
"merchant_id" : 29744,
"user_id" : 97051,
"card_number" : "434505******9116",
"transaction_date" : "2019-11-31T23:16:32.812632",
"transaction_amount" : 373,
"device_id" : 285475
}'
```

#### 201 - Created
![Screenshot 2023-11-03 at 10 42 38](https://github.com/rodrigovirgilio/cloudwalk_challenge/assets/392677/bae6e369-81d7-4e03-8504-a89da6cbdd5a)


#### 422 - Unprocessable Entity
![Screenshot 2023-11-03 at 10 42 55](https://github.com/rodrigovirgilio/cloudwalk_challenge/assets/392677/1b15108b-41e9-4535-a375-f53cf09152cb)

