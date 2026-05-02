// data_deconstruction.lp
// Demonstrates a data pipeline use case: processing a list of transaction amounts
// Positive amounts are credits, negative are debits
// Goal: Filter credits (positive), sum their amounts, and count them

// Filter positive amounts (credits) from a list
fun filter_credits(amounts) =
  match amounts with
  | [] -> []
  | h:t -> if h > 0 then h : filter_credits(t) else filter_credits(t)

// Sum amounts from a list
fun sum_amounts(amounts) =
  match amounts with
  | [] -> 0
  | h:t -> h + sum_amounts(t)

// Count items in a list
fun count(amounts) =
  match amounts with
  | [] -> 0
  | h:t -> 1 + count(t)

// Sample data: list of transaction amounts
transactions = [100, -200, 50, -75, 300, -10];

// Process the pipeline
credits = filter_credits(transactions);
total_credit_amount = sum_amounts(credits);
num_credits = count(credits);

// Return the total credit amount
total_credit_amount