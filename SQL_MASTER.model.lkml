connection: "sql_server"

include: "/SQL_VIEW/*.view.lkml"


explore: stock_list_master {
  persist_for: "24 hours"
}

explore: symbol {
  persist_for: "24 hours"
}

explore: proc1 {
  persist_for: "24 hours"
}
