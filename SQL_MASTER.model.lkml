connection: "sql_server"

include: "/SQL_VIEW/*.view.lkml"



explore: z_tbl_stock_list_master {
  persist_for: "24 hours"
}
