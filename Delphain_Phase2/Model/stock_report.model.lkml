connection: "sql_server"

include: "/Delphain_Phase2/Views/*.view.lkml"

explore: price_history {
  persist_for: "24 hour"
}

explore: institution_count_per_quater {
  persist_for: "24 hour"
}

explore: total_shares_per_quater {
  persist_for: "24 hour"
}

explore: quaterly_avg_price {
  persist_for: "24 hour"
}

explore: investor_stats {
  persist_for: "24 hour"
}

explore: investor_status_count {
  persist_for: "24 hour"
}

explore: top_10_investors {
  persist_for: "24 hour"
}

explore: summry_report_1 {
  persist_for: "24 hour"
}

explore: summry_report_2 {
  persist_for: "24 hour"
}
