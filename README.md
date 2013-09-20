# ActiveRecord::SimpleExplain

## Implemented

`ActiveRecord::Relation.explain()` method for ActiveRecord 3.0.x and 3.1.x and 3.2.x with SQLite

## Not Implemented

auto explain

## Supported Versions

 * Ruby 1.8.7+
 * ActiveRecord 3.0.x - 3.2.x

## Supported Adapters

 * SQLite
 * MySQL
 * PostgreSQL

## Depending

 * [cldwalker/hirb](https://github.com/cldwalker/hirb)
 * [miaout17/hirb-unicode](https://github.com/miaout17/hirb-unicode)

## Installation

Add this line to your application's Gemfile:

    gem 'activerecord-simple_explain'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord-simple_explain

## Usage

just call ActiveRecord::Relation.explain()

ex)

    Blog.joins(:comments).explain

on Rails console ( Rails 3.2 + SQLite Adapter )

    development(main):001:0> Blog.joins(:comments).explain
       (0.1ms)  explain query plan SELECT "blogs".* FROM "blogs" INNER JOIN "comments" ON "comments"."blog_id" = "blogs"."id"
    +------------------------------------------------------------------+------+-------+----------+
    | detail                                                           | from | order | selectid |
    +------------------------------------------------------------------+------+-------+----------+
    | SCAN TABLE comments (~1000000 rows)                              | 1    | 0     | 0        |
    | SEARCH TABLE blogs USING INTEGER PRIMARY KEY (rowid=?) (~1 rows) | 0    | 1     | 0        |
    +------------------------------------------------------------------+------+-------+----------+
    2 rows in set
    => nil

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
