# Hacktive Record
In this lab you will learn how to create seed data and use a simplified ORM dubbed "HacktiveRecord" (a pun on "ActiveRecord" which you'll be using in Rails). We will be working with the `FFaker` gem and modeling our data using classes and inheritance.

### 1. Hello World
Start by cloning this project.

When you run `ruby 1_hello.rb` you should see the following printed to your terminal:

    "Hello, my name is Generic Student and I live at 123 Rudimentary Dr, Oakland California. I lurv geraniums!"

Modify the output to use __string interpolation__ (hint: `#{first_name}`), and your own name, address, and most favoritest thing in the world.

Bonus: print it ten times.

### 2. Motivational Speakers
Modify `2_speakers.rb` so that when you run `ruby 2_speakers.rd` you see 10 lines of output, formatted like so:

    Reichel Theresia, giovani@gmail.com, 415-253-3253
    Botsford Vicenta, ernestine@gmail.com, 716-282-1443
    Waters Nayeli, annabel_walter@gmail.com, 415-793-2549
    ...


This output should _NOT_ be hardcoded. It should change for every run of the file!

To achieve this goal, you will need to familiarize yourself with the `ffaker` gem.

First, install the gems in your `Gemfile`. Simply run:  
```bash
bundle install
#or just
bundle
```

You can also install gems individually (e.g. `gem install ffaker`), but `bundle` is better in this case.

Now dive into [FFaker's Documentation](https://github.com/ffaker/ffaker/blob/master/REFERENCE.md)!

### 3. Motivational Talks
Let's convert our talks into _objects_. Modify `3_talks_data.rb` so that when you run it you see something along the lines of:


    Speakers
    ========
    {:first_name=>"Joanny", :last_name=>"McGlynn", :email=>"rex_walsh@gmail.com", :phone=>"530-978-7619"}
    {:first_name=>"Cordelia", :last_name=>"Olson", :email=>"mervin.wehner@gmail.com", :phone=>"357-304-4194"}
    {:first_name=>"Benjamin", :last_name=>"Bashirian", :email=>"eusebio_gibson@gmail.com", :phone=>"474-759-7334"}
    ...

    Talks
    ========
    {:topic=>"Assimilated object-oriented moderator", :duration=>75}
    {:topic=>"Balanced fault-tolerant paradigm", :duration=>60}
    {:topic=>"Configurable local alliance", :duration=>90}

    ...


### 4. Model Speakers
Now let's take it up a notch. Instead of printing out objects, let's print out _instances_ of class `Speaker`. Modify `4_model_speakers.rb` so that when you run `ruby 4_model_speakers.rb`, you see the guts of our objects printed out like this:

    #<Speaker:0x007fa86225cfa8 @first_name="Herman", @last_name="Delia", @email="charlene@yahoo.com", @id=1>
    #<Speaker:0x007fa86225cc60 @first_name="Kessler", @last_name="George", @email="bernie@hotmail.com", @id=2>

You'll need to modify the code in `models/speaker.rb` so that you can do something like this in `4_model_speakers.rb`:

```ruby
speaker = Speaker.new({first: "Reichel", last: "Theresia", email: "giovani@gmail.com"})
p speaker
```
>***A note on `p` vs `puts`:***<br>
`puts` calls `to_s` on the object and generally returns a readable version of the object. `p` is equivalent to `puts`, but with the inspect method called instead of the `to_s`. So with `p` we will see the difference between "2" and 2. This method is better for debugging.

### 5. Hacktive Record
Now we're going to play with a super-simplified version of Active Record I've dubbed "HacktiveRecord". HacktiveRecord (defined in `hacktive_record.rb`) will give our models the ability to `save`, `create` and find `all` records (or "instances") of our class.

Let's start by modifying our `Speaker` class so that it inherits from `HacktiveRecord::Base`.

``` ruby
require "./hacktive_record.rb"
class Speaker << HacktiveRecord::Base
end
```

Now, we have two options for saving our instances.

```ruby
reichel = Speaker.new({first: "Reichel", last: "Theresia", email: "giovani@gmail.com"})
reichel.save
```
or
```ruby
reichel = Speaker.create({first: "Reichel", last: "Theresia", email: "giovani@gmail.com"})
```

We can also query for `all` the records in our pretend "database":
```ruby
p Speaker.all
```

#Ready for Rails!
This has been a very light introduction to faking data, seeding your database, and working with models and inheritance. We're ready to dive into rails and work with ActiveRecord!

####1. Create a new rails application
**Make sure you're in a new project folder**
``` bash
rails new conference_app -T -d postgresql
cd conference_app
bundle
git init
git add . -A
git commit -m "inital commit, rails skeleton"
subl .
```

####2. Create a `Talk` model
``` bash
rails g model talk topic:string duration:integer
git diff # take a look at the files you just created!
```

And take a look at the following files:  
* `app/models/talk.rb`
* `db/migrate/1234566789_create_talks.rb`

####3. Setup your database
Download and Launch Postgres.app. You should see an elephant in your menu if it's running.

Next, create your application database:
```bash
rake db:create # create a new database on your machine
rake db:migrate # instruct your database what tables it needs to contain
```

####4. Launch the rails console and create your first talk!
```bash
rails console
# or
rails c
```

**Confirm that your model exists**  
```ruby
Talk
 #=> Talk(id: integer, topic: string, duration: integer, created_at: datetime, updated_at: datetime)
```

(You may need to "connect" to your database in the rails console. Just follow the instructions.)

**Create your first record**!
``` ruby
Talk.create({topic: "Playing with Models in the Rails Console"})
Talk.count
Talk.all
```

**Try the following:**  
* Create 3 new Talks in the Rails Console.
* Delete the last talk you created
* Find the first talk
* Find the last talk
* Search by id
* Search by title
* Sort by title
* Update the title of the last talk you created
* Delete all the talks you created.

**Pro-Tip**: Remember, when you're working in the console/repl `up-arrow` is your friend! (That and "hanging a dot" + "double-tabbing").

####5. Can you seed your database?
Take a look at `db/seed.rb`.

Add the following line:
```ruby
p "Hello from seed.rb"
```

Now run the following from your command line (not the console!):
```bash
rake db:seed
# Hello from seed.rb
```

The `seed.rb` file is magic, because it _already_ knows about all of the models and gems in your rails app. All you have to do is tell it what data to create!

**Can you seed your database with speaker and talks?**

**Bonus**: can you do it with the FFaker gem? Hint: add the `ffaker` gem to your `Gemfile` with `gem ffaker`
