connection: "snowfalkedb"

include: "/sp_views/*.view.lkml"
include: "/sp_views/*.dashboard.lookml"

explore: sp_networkevents_overtime {
  persist_for: "6 hours"
}

datagroup: ueba_outliers_ueba_data {
  max_cache_age: "24 hours"
#   sql_trigger: SELECT max(date) FROM ueba_outliers_ueba;;
}
explore: sp_top_notablevents {
  persist_with: ueba_outliers_ueba_data
}
explore: test123 {
  persist_with: ueba_outliers_ueba_data
}
explore: activedirectory {}
explore: beaconing12 {}

explore: btest {}
explore: bbtest {}
explore: Session_Track {}
explore: wgtrafficandsession {}
