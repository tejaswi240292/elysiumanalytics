connection: "sql_server"

include: "/Delphain_Phase2/Views/*.view.lkml"

explore: earnings {
persist_for: "24 hours"
}

explore: get_earnings {
  persist_for: "24 hours"
}

explore: previous_earnings {
  persist_for: "24 hours"
}

explore: next_earnings {
  persist_for: "24 hours"
}

## Test Views
explore: get_earnings_1 {
  persist_for: "24 hours"
}
explore: get_prev_earnings_1 {
  persist_for: "24 hours"
}
explore: get_next_earnings_1 {
  persist_for: "24 hours"
}


explore: get_analyst_rating {
  persist_for: "24 hours"
}
explore: get_revenue_eps {
  persist_for: "24 hours"
}


explore:  get_top_stocks {
  persist_for: "24 hours"
}
explore:  key_ratios {
  persist_for: "24 hours"
}
explore:  market_sentiments {
  persist_for: "24 hours"
}


explore: top_stock_of_day {

}

explore: get_statements {
  persist_for: "24 hours"
}
explore: get_insider_overview {
  persist_for: "24 hours"
}
explore: get_latest_ratings {
  persist_for: "24 hours"
}
explore: get_current_State_Stats {
  persist_for: "24 hours"
}

explore: get_top_investors {  persist_for: "24 hours"
  }
