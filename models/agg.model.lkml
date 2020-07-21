connection: "snowfalkedb"

include: "/agg_views/*.view.lkml"
include: "/agg_views/*.dashboard.lookml"


datagroup: agg_email_data {
  max_cache_age: "24 hours"
  #sql_trigger: SELECT max(date) FROM agg_email;;
}
datagroup: agg_windows_data {
  max_cache_age: "24 hours"
  #sql_trigger: SELECT max(date) FROM agg_windows;;
}
datagroup: agg_watchguard_data {
  max_cache_age: "24 hours"
#sql_trigger: SELECT max(date) FROM agg_watchguard_proxy;;
}




explore: agg_email {
  persist_with: agg_email_data
}
explore: agg_watchguard_proxy {
  persist_with: agg_watchguard_data
}

explore: agg_windows {
  persist_with: agg_windows_data
}

explore: suspicious_access_activity {
  persist_with: agg_watchguard_data
}
explore: windows_account_and_group_information {
  persist_with: agg_windows_data
}
explore: feature_agg {}
