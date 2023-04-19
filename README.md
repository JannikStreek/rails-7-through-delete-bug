# README

This repository shows some strange rails 7 behaviour leveraging the references model option.

```
docker compose up -d
docker compose exec app bash
```

Setup
```
rake db:migrate
```

Data preparation with `rails c`
```ruby
d = Deal.create
l = Loan.create(deal: d)
fee = Fee.create(deal: d)
```

Assigning the loan to nil deletes the join table deal (which does not make use of belongs_to)
```ruby
irb(main):004:0> fee.loan = nil
  TRANSACTION (0.1ms)  begin transaction
  Deal Destroy (13.1ms)  DELETE FROM "deals" WHERE "deals"."id" = ?  [["id", 1]]
  TRANSACTION (4.6ms)  commit transaction
=> nil      
```

## Documentation

https://api.rubyonrails.org/v7.0.4.3/classes/ActiveRecord/Associations/ClassMethods.html#method-i-has_one

> :through
Specifies a Join Model through which to perform the query. Options for :class_name, :primary_key, and :foreign_key are ignored, as the association uses the source reflection. You can only use a :through query through a has_one or belongs_to association on the join model.

> If the association on the join model is a belongs_to, the collection can be modified and the records on the :through model will be automatically created and removed as appropriate. Otherwise, the collection is read-only, so you should manipulate the :through association directly.

> If you are going to modify the association (rather than just read from it), then it is a good idea to set the :inverse_of option on the source association on the join model. This allows associated records to be built which will automatically create the appropriate join model records when they are saved. (See the 'Association Join Models' section above.)
