connection: "snowfalkedb"

include: "/odm_views/*.view.lkml"
include: "/odm_views/*.dashboard.lookml"

explore: iis_odm {
  persist_for: "60 minutes"
}
explore: msexchangeagent_odm {
  persist_for: "60 minutes"
}
explore: msexchangeconnectivity_odm {
  persist_for: "60 minutes"
}
explore: msexchangemessagetracking_odm {
  persist_for: "60 minutes"
}
explore: symantecendpoint_odm {
  persist_for: "60 minutes"
}
explore:  symantecnetwork_odm{
  persist_for: "60 minutes"
}
explore: sysmon_odm {
  persist_for: "60 minutes"
}
explore: wgevent_odm {
  persist_for: "60 minutes"
}
explore: wgnetflow_odm {
  persist_for: "60 minutes"
}
explore: wgtraffic_odm {
  persist_for: "60 minutes"
}
explore: windowsnxlog_odm {
  persist_for: "60 minutes"
}
explore: statistical_data_view {
  persist_for: "60 minutes"
}

explore: alert_email {}

explore: symantecendpoints_description {
  join: symantecendpoint_odm {
    sql_on: ${symantecendpoint_odm.event_id} = ${symantecendpoints_description.event_id} ;;
    relationship: many_to_one
  }
}
