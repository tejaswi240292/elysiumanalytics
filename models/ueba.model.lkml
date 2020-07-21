connection: "snowfalkedb"

include: "/UEBA_VIEWS/*.view.lkml"

#datagroup: ueba_outliers_ueba_data {
 # max_cache_age: "24 hours"
#   sql_trigger: SELECT max(date) FROM ueba_outliers_ueba;;
#}

explore: ueba_bandwidth_usage_bycount {
  persist_for: "24 hours"
}
explore: ueba_bandwidth_usage_bysize {
  persist_for: "24 hours"
}
explore: ueba_botattack {
  persist_for: "24 hours"
}
explore: ueba_endpoint_indicators {
  persist_for: "24 hours"
}
explore: ueba_file_download {
  persist_for: "24 hours"
}
explore: ueba_highvolume_file_access {
  persist_for: "24 hours"
}
explore: ueba_privileged_accountusage {
  persist_for: "24 hours"
}
explore: ueba_vpn_session {
  persist_for: "24 hours"
}
explore: ueba_unusualdomain {
  persist_for: "24 hours"
}
explore: ueba_outliers_ueba {
 # persist_with: ueba_outliers_ueba_data
}
