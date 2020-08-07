connection: "sql_server"

include: "/SQL_VIEW/*.view.lkml"



explore: stock_list_master {
  persist_for: "24 hours"
}

explore: symbol {
  persist_for: "24 hours"
}

explore: Insider_Trading {
  persist_for: "24 hours"
}

explore: Events {
  persist_for: "24 hours"
}

explore: Event_Earnings {
  persist_for: "24 hours"
}

explore: ETF_Exposure {
  persist_for: "24 hours"
}

explore: ChartDisplay {
  persist_for: "24 hours"
}

explore: Financials_IncomeStat {
  persist_for: "24 hours"
}
