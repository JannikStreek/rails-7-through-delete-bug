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

Data preparation withint `rails c`
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

